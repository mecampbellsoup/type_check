# TypeCheck

This library provides a minimal interface to perform type comparisons beteween a literal value and a type constraint. It draws heavily from a [LiveScript](http://livescript.net/) library called [`type-check`](https://github.com/gkz/type-check).

```bash
gem install type_check
```

### Quick examples

```ruby
require 'type_check'

## Basic types
TypeCheck::valid?(Integer, 42)           # true
TypeCheck::valid?(Integer, "42")         # false
TypeCheck::valid?(Integer, "42")         # false
TypeCheck::valid?(NilClass, nil)         # true
TypeCheck::valid?(Hash, { answer: 42 })  # true

## Optional types
TypeCheck::valid?([Integer, String], 42)              # true
TypeCheck::valid?([Integer, String], "42")            # true
TypeCheck::valid?([Integer, String], { answer: 42 })  # false
TypeCheck::valid?([NilClass, String], nil)            # true
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
