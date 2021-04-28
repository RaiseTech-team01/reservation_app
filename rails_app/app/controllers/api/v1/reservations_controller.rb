class Api::V1::ReservationsController < Api::V1::BaseApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:create, :update]

  def index
    reservations = Reservation.where_store_id(params["store_id"])
    render json: reservations, each_serializer: Api::V1::ReservationIndexSerializer
  end

  def show
    reservation = Reservation.where_store_id(params["store_id"])
    detail = reservation.find(params[:id])
    render json: detail, serializer: Api::V1::ReservationShowSerializer
  end

  def create
    reversion = current_user.reservations.build(reversion_params)
    # 生成した予約番号を呼び出し
    reversion.reservation_number = reversion.create_reservation_num
    # 指定店舗があることを確認し格納
    reversion.store_id = Store.find(params["store_id"]).id
    reversion.save!

    render json: reversion, serializer: Api::V1::ReservationCreateSerializer
  end

  def update
    # 対象の予約を検索する
    reservation = Reservation.where_store_id(params["store_id"])
    detail = reservation.find(params[:id])
    # リクエストで変更のある値を更新
    detail.update!(reversion_params)

    render json: detail, serializer: Api::V1::ReservationShowSerializer
  end

  private

    def reversion_params
      params.require(:reservation).permit(:date_at, :date_on, :number_people, :menu, :budget,
                                          :inquiry, :user_id, :store_id)
    end
end
