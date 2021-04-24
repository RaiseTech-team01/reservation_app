class Api::V1::Store::ReservationsController < Api::V1::BaseApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:create]

  def create
    reversion = current_user.reservations.build(reversion_params)
    # 生成した予約番号を呼び出し
    reversion.reservation_number = reversion.create_reservation_num
    # 指定店舗があることを確認し格納
    reversion.store_id = Store.find(params["store_id"]).id
    reversion.save!

    render json: reversion, serializer: Api::V1::ReservationCreateSerializer
  end

  private

    def reversion_params
      params.require(:reservation).permit(:date_at, :date_on, :number_people, :menu, :budget,
                                          :inquiry, :reservation_number, :user_id, :store_id)
    end
end
