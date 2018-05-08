# frozen_string_literal: true

require 'reportabull/csv_builder'
require 'reportabull/builder'
require 'active_support'
require 'active_support/core_ext'

module Reportabull
  class ReportBuilder

    attr_reader :columns, :options

    attr_accessor :humanize_name

    def initialize(options = {}, &block)
      @columns = []
      @options = options
      @block = block
      @humanize_name = options.delete(:humanize_name)
    end

    def csv_options
      @csv_options ||= options.except(
        :encoding_options,
        :byte_order_mark,
        :column_names
      )
    end

    def column(name,  _options = {}, &block)
      @columns << Column.new(name, { humanize_name: humanize_name }, block)
    end

    def build(collection = [], output: nil, format: nil)
      exec_columns

      builder =
        case format
        when :csv
          CsvBuilder.new(columns, options, collection, output || '')
         else
           Builder.new(columns, options, collection, output || [])
      end

      builder.build
    end

    private

    def exec_columns
      @columns = []
      instance_exec(&@block) if @block.present?
      columns
    end
  end
end
