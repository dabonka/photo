class Telephone < ApplicationRecord
  include Swagger::Blocks

  validates :phone_number, format: { with: /\(?\b([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\b/,
  message: 'Only format XXX-XXX-XXXX' }, allow_blank: true,
  uniqueness: { message: 'This phone number is already busy, '}

  swagger_schema :Telephone do
    key :required, [:id, :phone_number]
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :phone_number do
      key :type, :string
    end
  end
end
