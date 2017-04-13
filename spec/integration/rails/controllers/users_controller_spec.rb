require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "POST #create" do
    let(:name)  { "Matt" }
    let(:email) { "matt@zipmark.com" }
    let(:age)   { 27 }

    let(:params) do
      {
        name:  name,
        email: email,
        age:   age
      }
    end

    before { post :create, params: params }

    # NOTE: type constraints declared as UsersController::CreateUserParams
    context "when the request params conform to the declared rules" do
      it "returns http success" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when the request params do not conform to the declared rules" do
      context "when a required param is absent" do

      end

      context "when a param is of the wrong type" do

      end

      context "when a non-permitted param is included" do

      end
    end
  end
end
