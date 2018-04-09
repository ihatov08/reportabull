# frozen_string_literal: true

require "reportabull/version"
require "reportabull/builder"
require "reportabull/column"
require "reportabull/csv_builder"
require "reportabull/report_builder"

module Reportabull
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_accessor :report_builder

    def columns(options = {}, &block)
      self.report_builder = ReportBuilder.new(options, &block)
    end

    def to_csv(collection: nil)
      report_builder.build(collection || find_collection, output: '', format: :csv)
    end

    def to_csv_enumrator(collection: nil)
      Enumerator.new do |y|
        report_builder.build(collection || find_collection, output: y, format: :csv)
      end
    end
  end
end
