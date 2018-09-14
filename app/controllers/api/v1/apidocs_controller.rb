module Api
  module V1
    class ApidocsController < ActionController::Base
      include Swagger::Blocks

      swagger_root do
        key :swagger, '2.0'
        info do
          key :version, '1.0.0'
          key :title, 'My backend API'
          key :description, 'A sample API that uses ' \
                            'demonstrate features in cardholder'
          key :termsOfService, 'http://helloreverb.com/terms/'
          contact do
            key :name, 'Ruby API Team'
          end
          license do
            key :name, 'MIT'
          end
        end

        key :host, 'localhost:3000'
        key :basePath, '/api/v1'
        key :consumes, ['application/json']
        key :produces, ['application/json']
        key :schemes , ['http']
      end

      swagger_path '/telephones' do

        operation :post do
          key :summary, 'Getting new phone number'
          key :description, 'Creating a new phone number'
          key :operationId, 'createtelephone'
          key :tags, [
            'Telephones'
          ]

          parameter do
            key :in, :body
            key :name, 'body'
            key :example, { "phone_number": "111-222-3333"} 
          end

          response 200 do
            key :description, 'success response'
            schema do
              key :type, :array
              items do
                key :'$ref', :Telephone
              end
            end
          end

          response :default do
            key :description, 'unexpected error'
            schema do
              key :'$ref', '#/definitions/ErrorModel'
            end
          end
        end
      end

      SWAGGERED_CLASSES = [
        Telephone,
        ErrorModel,
        self,
      ].freeze

      def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
    end
  end
end
