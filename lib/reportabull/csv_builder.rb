# frozen_string_literal: true

require "csv"

module Reportabull
  class CsvBuilder < Builder

    def add_byte_order_mark
      bom = options.fetch(:byte_order_mark, false)
      output << bom if bom
    end

    def build_header
      add_byte_order_mark
      return unless options.fetch(:column_names, true)
      headers = columns.map { |column| encode(column.name, options) }
      output << CSV.generate_line(headers, options)
    end

    def build_rows
      collection.each do |resource|
        row = build_row(resource)
        output << CSV.generate_line(row.values, options)
      end
    end
  end
end
