class Api::V1::ReservationsController < Api::V1::BaseApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    # 指定店舗の一覧を表示
    reservations = Reservation.search_store(params["store_id"])
    render json: reservations, each_serializer: Api::V1::ReservationSerializer
  end

  def show
    # 指定店舗の選択した予約詳細を表示
    reservation = Reservation.search_store(params["store_id"])
    reservation = reservation.find(params[:id])
    render json: reservation, serializer: Api::V1::ReservationSerializer
  end

  def create
    reservation = current_user.reservations.build(reservation_params)
    # 生成した予約番号を呼び出し
    reservation.reservation_number = reservation.create_reservation_num
    # 指定店舗があることを確認し格納
    reservation.store_id = Store.find(params["store_id"]).id
    reservation.save!

    render json: reservation, serializer: Api::V1::ReservationSerializer
  end

  def update
    # 対象の予約を検索する
    reservation = current_user.reservations.search_store(params["store_id"])
    reservation = reservation.find(params[:id])
    # リクエストで変更のある値を更新
    reservation.update!(reservation_params)
    render json: reservation, serializer: Api::V1::ReservationSerializer
  end

  def destroy
    reservation = current_user.reservations.search_store(params["store_id"])
    reservation = reservation.find(params[:id])
    reservation.destroy!
  end

  private

    def reservation_params
      params.require(:reservation).permit(:date_at, :date_on, :number_people, :menu, :budget,
                                          :inquiry, :user_id, :store_id)
    end
end
