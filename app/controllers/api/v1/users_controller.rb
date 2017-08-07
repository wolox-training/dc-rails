module Api
  module V1
    class UsersController < ApiController
      def rents_index
        render json: Rent.all, each_serializer: UserRentSerializer
      end

      def rents_params
        params.require(:rent).permit(:user_id, :book_id, :from, :to)
      end

      def rents_create
        new_rent = Rent.new(rents_params)
        if new_rent.save
          head :created
        else
          render json: new_rent.errors.as_json
        end
      end
    end
  end
end
