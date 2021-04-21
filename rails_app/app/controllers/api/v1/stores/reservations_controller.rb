module Api::V1
  class Stores::ReservationsController < BaseApiController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, except: [:create]

    def create
      # 登録ユーザでモック
      reversion = User.first.reservations.create!(reversion_params)
      # serializers の記述
      binding.pry
    end

    private

      def reversion_params
        # """ strong parameter """
        params.require(:reservation).permit(:date_at, :date_on, :number_people, :menu, :budget,
                                            :inquiry, :reservation_number, :user_id, :store_id)
      end
  end
end
