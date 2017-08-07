module Api
  module V1
    class UsersController < ApiController
      def rents_index
        render json: Rent.all, each_serializer: UserRentSerializer
      end

      def rents_create
        new_rent = Rent.new(user_id: params[], book_id: params[], from: params[], to: params[])
      end
    end
  end
end
