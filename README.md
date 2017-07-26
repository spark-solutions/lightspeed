# Lightspeed

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/lightspeed`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem "lightspeed_ruby", require: "lightspeed"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lightspeed_ruby

## Usage

Lightspeed ruby follows a namespacing pattern, in which every layer of the
Lightspeed's API creates a new namespace.

### Items

**Find an item**

```ruby
client.items.find("20")
```

**Create an item**

```ruby
client.items.create(description: "blah blah", itemType: "non_inventory")
```

### Relations

Whenever the API allows it, you can ask for certain relations to be sideloaded.
For example, you may wish to get the category of an item.

```ruby
client.items.find("20", with: [:category])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lightspeed.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

