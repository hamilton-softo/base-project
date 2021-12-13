require "swagger_helper"

describe "People API" do
  path "/people" do
    post "/people" do
      tags "People"
      consumes "application/json"
      parameter name: :person, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          active: { type: :boolean },
          birthday: { type: :date },
          address: { type: :string },
          email: { type: :string },
        },
        required: ["name", "cpf", "active"],
      }

      response "201", "Person created" do
        let(:person) {
          {
            name: "Teste",
            cpf: "123.456.789-00",
            active: "true",
            birthday: "2021-10-21",
            address: "tasdasasd",
            email: "teste@teste.com",
          }
        }
        run_test!
      end

      response "400", "invalid request" do
        let(:person) {
          {
            name: "Teste",
            cpf: "123.456.789-00",
          }
        }
        run_test!
      end
    end

    # get "/people" do
    #   tags "People"
    #   consumes "application/json"

    #   response "200", nil do
    #     let(:person) {
    #       {
    #         name: "Teste",
    #         cpf: "123.456.789-00",
    #         active: "true",
    #         birthday: "2021-10-21",
    #         address: "tasdasasd",
    #         email: "teste@teste.com",
    #       }
    #     }
    #     run_test!
    #   end

    #   response "400", "Bad request" do
    #     let(:person) {
    #       {
    #         name: "Teste",
    #         cpf: "123.456.789-00",
    #       }
    #     }
    #     run_test!
    #   end
    # end

    # get "/people/:id" do
    #   tags "Blogs", "Another Tag"
    #   produces "application/json", "application/xml"
    #   parameter name: :id, in: :path, type: :string

    #   response "200", "blog found" do
    #     schema type: :object,
    #       properties: {
    #         id: { type: :integer },
    #         title: { type: :string },
    #         content: { type: :string },
    #       },
    #       required: ["id", "title", "content"]

    #     let(:id) { Blog.create(title: "foo", content: "bar").id }
    #     run_test!
    #   end

    #   response "404", "blog not found" do
    #     let(:id) { "invalid" }
    #     run_test!
    #   end

    #   response "406", "unsupported accept header" do
    #     let(:'Accept') { "application/foo" }
    #     run_test!
    #   end
    # end
  end
end
