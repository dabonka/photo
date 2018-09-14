module Api
  module V1
    class TelephonesController < ApplicationController
      include Swagger::Blocks

      def create
        @telephone = Telephone.new
        
        get_custom_value(phones_params[:phone_number])
        if @telephone.valid? 
          @telephone.save!
          render :create
        else
          render json: @telephone.errors.full_messages
        end
      end
      
      private
      
      def number_generate
        a = rand(111...999)
        b = rand(111...999)
        c = rand(1111...9999)
        a.to_s + '-' + b.to_s + '-' + c.to_s
      end

      def get_custom_value (custom_number)
        if custom_number.nil?
          set_random_value
        elsif is_number_exist(custom_number)
          set_random_value
        else
          set_custom_value (custom_number)
        end
      end

      def set_random_value
        phone_number = number_generate
        while is_number_exist(phone_number)
          phone_number = number_generate
        end
        @telephone.phone_number = phone_number
      end

      def set_custom_value (custom_number)
        @telephone.phone_number = custom_number
      end

      def is_number_exist (phone_number)
        Telephone.exists?(phone_number: phone_number)
      end

      def phones_params
        params.permit(:phone_number)
      end

    end
  end
end
