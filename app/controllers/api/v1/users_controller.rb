module Api
  module V1
    class UsersController < ApiController
      def rents_index
        authorize current_user
        render json: current_user.rents, each_serializer: UserRentSerializer
      end
    end
  end
end
