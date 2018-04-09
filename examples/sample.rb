# frozen_string_literal: true

require 'reportabull'

class Sample
  include Reportabull

  User = Struct.new(:name, :email)

  def self.find_collection
    (1..10).to_a.map.with_index{ |m, i| User.new("user_#{i}", "user_#{i}@example.com") }
  end

  columns do
    column(:name)
    column(:email)
  end
end
