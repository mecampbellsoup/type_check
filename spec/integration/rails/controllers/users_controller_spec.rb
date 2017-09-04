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

    # NOTE: type errors are simply rendered as JSON
    context "when the request params do not conform to the declared rules" do
      context "when a required param is absent" do
        it "renders the errors" do
          expect(response_json).to eq({
            errors: [{
              name: "blank"
            }]
          })
        end
      end

      context "when a param is of the wrong type" do
        let(:name) { 42 }

        it "renders the default type error" do
          expect(response_json).to eq({
            errors: [{
              name: "must_be_string"
            }]
          })
        end
      end

      context "when a non-permitted param is included" do
        before { params[:foo] = "bar" }

        context "when the params are filtered" do
          pending
        end
      end
    end
  end
end

def response_json
  JSON.parse(response.body)
end
