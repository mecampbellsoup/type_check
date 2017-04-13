class UsersController < ApplicationController
  include TypeCheck::ActionController

  CreateUserParams = {
    name: String,
    email: String,
    age: [NilClass, Integer]
  }.freeze

  assert_params_format CreateUserParams, only: :create

  def create
    head :ok
  end
end
