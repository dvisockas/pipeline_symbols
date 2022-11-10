# pipeline_symbols
![example workflow](https://github.com/dvisockas/pipeline_symbols/actions/workflows/main.yml/badge.svg)

With pipeline_symbols, you can pipeline ruby symbols as if they are callable (procs and methods).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "pipeline_symbols"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pipeline_symbols

## Usage

Just require `pipeline_symobls` (`require "pipeline_symbols"`) and chain your symbols like no one is watching!

```ruby
class User
  attr_reader :id, :name

  def with_default_name
    @name = "John Doe"
    self
  end

  def with_rand_id
    @id = rand(1000)
    self
  end
end
```

Now instead of writing:

```ruby
[User.new, User.new].map(&:with_default_name).map(&:with_rand_id)
```

You can just pipeline the symbols:

```ruby
[User.new, User.new].map(&:with_default_name >> :with_rand_id)
```

Chaining of other callable objects (procs and methods) is also supported:

```ruby
[User.new, User.new].map(&:with_default_name >> :with_rand_id >> ->(user) { user.id })
=> [47, 820]
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvisockas/pipeline_symbols. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dvisockas/pipeline_symbols/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Referential project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dvisockas/pipeline_symbols/blob/master/CODE_OF_CONDUCT.md).
