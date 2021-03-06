module Api
  module V1
    class UsersController < ApiController
      include Wor::Paginate

      def rents_index
        authorize current_user
        render_paginated current_user.rents, each_serializer: UserRentSerializer
      end
    end
  end
end
