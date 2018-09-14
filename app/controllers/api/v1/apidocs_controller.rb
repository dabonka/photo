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

      swagger_path '/auth' do

      end

      SWAGGERED_CLASSES = [
        Entry,
        ErrorModel,
        self,
      ].freeze

      def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
    end
  end
end
