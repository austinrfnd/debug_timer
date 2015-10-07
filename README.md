# DebugTimer

This gem is to help debug slow portions of the code.  When RubyProf isn't enough and you need to get deeper into the code base this is the solution.  The output will look like this:

```
 1.8040 └── search
 1.0554    └── 1st
 0.0033        └── config
 0.0001        └── 1.1
 0.6579        └── 1.2
 0.0087            └── 1.2.1
 0.0075            └── 1.2.2
 0.6416            └── set_custom_variable
 0.3941        └── 1.3
 0.3938            └── 1.3.1
 0.0002            └── 1.3.2
 0.1487    └── 2nd
 0.5999    └── 3rd
 0.0133        └── presenter
 0.0023        └── serialize
 0.5843        └── respond_to
 0.5842            └── render
 0.1506                └── presenter.view

 ```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'debug_timer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install debug_timer

### Configuration

You can add your logger instance if you want:

```ruby
# Straight assignment
DebugTimer.logger = Logger.new('asdf')
DebugTimer.object_allocations = true

# or config assignment
DebugTimer.config do |config|
  config.logger = Logger.new('asdf')
  config.object_allocations = true
end

```

## Usage

To use DebugTimer simply wrap the code you want to time in a block.

```ruby
DebugTimer.start('search function') do
  Search.searchysearchsearch('search query')
  SomeOtherCode.DoWhatever?

  IhazFunction?
end
```

When you run that piece of code you will see in your log.  The number on the left is the time that block of code took to run

```
1.8040 └── search function
```

### Nesting

You can nest blocks within blocks.

```ruby
DebugTimer.start('search function') do
  Search.searchysearchsearch('search query')

  DebugTimer.start('Some other code') do
    SomeOtherCode.DoWhatever?
  end

  IhazFunction?
end
```

And the output will look like:

```
 1.8040 └── search function
 1.0554    └── Some other code
```

### Object Allocations
```ruby

# Enable it
DebugTimer.object_allocations = true

# Time
DebugTimer.start('search function') do
  Search.todo('in here')
end
```

And the output will look like:
```
1.8040 | 10 └── search function
```

The second number is the total number of objects allocated in that block.


## Running Specs

```
> rake

Finished in 0.00926 seconds (files took 0.11604 seconds to load)
5 examples, 0 failures
```

## TODOS:
- Add GC output before and after blocks

## Contributing

1. Fork it ( https://github.com/[my-github-username]/debug_timer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
