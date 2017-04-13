# TypeCheck

This library provides a minimal interface to perform type comparisons beteween a literal value and a type constraint. It draws heavily from a [LiveScript](http://livescript.net/) library called [`type-check`](https://github.com/gkz/type-check).

```bash
gem install type_check
```

## Quick examples

```ruby
require 'type_check'

## Basic types
TypeCheck::valid?(Integer, 42)            # true
TypeCheck::valid?(Integer, "42")          # false
TypeCheck::valid?(Integer, "42")          # false
TypeCheck::valid?(NilClass, nil)          # true
TypeCheck::valid?(Hash, { answer: 42 })   # true
TypeCheck::valid?(Array, ["foo", "bar"])  # true
TypeCheck::valid?(Array, "Array")         # false
```

```
## Optional types
TypeCheck::valid?([Integer, String], 42)              # true
TypeCheck::valid?([Integer, String], "42")            # true
TypeCheck::valid?([Integer, String], { answer: 42 })  # false
TypeCheck::valid?([NilClass, String], nil)            # true
```

## Usage

### POR

The basic hash-to-rules comparison operation can be used anywhere, e.g. a [Sinatra]() endpoint. Generally speaking,
the following pattern could be useful anywhere you want to enforce type constraints on an input object/document as part of
permitting the operation to proceed.

```ruby
TypeConstraints = {
  input_1: String,
  input_2: Integer,
  optional_input_3: [NilClass, String]
}.freeze

def business_sensitive_operation!(inputs)
  errors = assert_params_format(TypeConstraints, inputs)
  raise(BadInputsError) if errors.present?
  # proceed with the remaining operations
  ...
end
```

### Rails

The salient methods in the following code snippet are:

* `assert_params_format`: when used in a `before_action`, this method will compare each type constraint in `CreateUserParams` to the corresponding parameter value. Fail states can and should be handled by yielding to a block, where you have access to the parameters' validation errors.
* `filtered_params`: removes non-permitted parameters, returning only key-value pairs specified in the type constraints. This method will raise an exception if called prior to `assert_params_format` This method will raise an exception if called prior to `assert_params_format`.

```ruby
class UsersController < ActionController::Base
  include TypeCheck::ActionController

  CreateUserParams = {
    name:  String,      # params[:name] is a required string parameter
    email: String,      # params[:email] is a required string parameter
    age:   Integer      # params[:age] is a required numeric parameter
  }.freeze

  assert_params_format CreateUserParams, only: :create do |errors|
    # Handle fail states inside this block.
    return render json: errors, status: 400
  end

  def create
    user = User.new(filtered_params)
  end
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
