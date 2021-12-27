# require 'swagger_helper'
# require 'rails_helper'

# RSpec.describe "People", type: :request do
#   path '/api/people' do
#     get('get a list of people') do
#       tags 'Get list people'
#       consumes 'application/json'

#       response '200', 'successed' do
#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: response.body
#             }
#           }
#         end

#         run_test!
#       end
#     end
#   end
  # describe "GET /api/people" do
  #   it 'should sucess and render to json' do
  #     get "/api/people/"
  #     puts response.body.inspect
  #     expect(response).to have_http_status(:success)
  #     expect(response.body).to eq('[]')
  #   end

  #   it 'should array empty' do
  #     get "/api/people"
  #     expect(assigns(:people)).to be_empty
  #   end

  #   it 'should array one person' do
  #     create(:person)
  #     get "/api/people"
  #     expect(assigns(:people)).to_not be_empty
  #   end
  # end
# end
