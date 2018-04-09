# frozen_string_literal: true

module Reportabull
  class Builder
    attr_accessor :collection, :output, :columns, :options

    def initialize(columns, options, collection, output)
      @columns = columns
      @options = options
      @collection = collection
      @output = [output]
    end

    def build
      build_header
      build_rows
      output.join
    end

    def build_header
      nil
    end

    def build_rows
      collection.each do |resource|
        output << build_row(resource)
      end
    end

    def build_row(resource)
      columns.each_with_object({}) do |column, result|
        result[column.name] = encode(column.value(resource), options)
      end
    end

    def encode(content, options)
      if options[:encoding]
        content.to_s.encode(options[:encoding], options[:encoding_options])
      else
        content
      end
    end
  end
end
