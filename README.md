# Reportabull

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/reportabull`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reportabull'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reportabull

## Usage

```ruby

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

Sample.to_csv
=> "Name,Email\nuser_0,user_0@example.com\nuser_1,user_1@example.com\nuser_2,user_2@example.com\nuser_3,user_3@example.com\nuser_4,user_4@example.com\nuser_5,user_5@example.com\nuser_6,user_6@example.com\nuser_7,user_7@example.com\nuser_8,user_8@example.com\nuser_9,user_9@example.com\n"
[

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/reportabull. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Reportabull project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/reportabull/blob/master/CODE_OF_CONDUCT.md).
