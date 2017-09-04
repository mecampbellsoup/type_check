class UsersController < ApplicationController
  include TypeCheck::ActionController

  CreateUserParams = {
    name: String,
    email: String,
    age: [NilClass, Integer]
  }.freeze

  assert_params_format CreateUserParams, only: :create do |errors|
    render json: errors
    #return render json: errors
    # The preceding `return` statement does not change behavior since we
    # are inside a block. Therefore we must `return` from within the
    # `before_action` in `assert_params_format` to halt the request. This block
    # is only used for optionally preparing the error response for rendering,
    # e.g. rendering them as JSON like we do here.
  end

  def create
    head :ok
  end
end
