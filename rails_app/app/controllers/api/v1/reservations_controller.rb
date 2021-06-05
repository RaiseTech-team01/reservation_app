class Api::V1::ReservationsController < Api::V1::BaseApiController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    # 指定店舗の一覧を表示
    reservations = current_user.reservations.where(store_id: params[:store_id])
    render json: reservations, each_serializer: Api::V1::ReservationSerializer
  end

  def show
    # 指定店舗の選択した予約詳細を表示
    reservations = current_user.reservations.where(store_id: params[:store_id])
    reservation = reservations.find(params[:id])
    render json: reservation, serializer: Api::V1::ReservationSerializer
  end

  def create
    reservations_date_at = current_user.reservations.pluck(:date_at)
    params_date_at = Time.zone.parse(reservation_params[:date_at])

    # 予約がない場合
    if reservations_date_at.empty?
      return create_reservation
    end

    # 予約重複の確認
    current_user.reservations.find_each do |reservation|
      next if params_date_at == reservation[:date_at]

      unless reservations_date_at.include?(params_date_at)
        return create_reservation
      end
    end
    self.duplicate_reservation
  end

  def update
    # 対象の予約を検索する
    reservations = current_user.reservations.where(store_id: params[:store_id])
    reservation = reservations.find_by!(params[:id])

    # リクエストで変更のある値を更新
    reservation.update!(reservation_params)

    render json: reservation, serializer: Api::V1::ReservationSerializer
  end

  def destroy
    reservations = current_user.reservations.where(store_id: params[:store_id])
    reservation = reservations.find(params[:id])
    reservation.destroy!
  end

  private

    def create_reservation
      # 予約席の有無
      reservation_number_people = reservation_params[:number_people].to_i
      store_seat = Store.find(params[:store_id]).seat.to_i

      if store_seat >= reservation_number_people
        residual_seat = store_seat - reservation_number_people

        Store.find(params[:store_id]).seat = residual_seat
      end

      if store_seat < reservation_number_people
        # 予約席が足りません
        self.no_seat_reservation

        return false
      end

      reservation = current_user.reservations.build(reservation_params)

      # 生成した予約番号を格納
      reservation.reservation_number = reservation.create_reservation_num

      # 指定店舗があることを確認し格納
      reservation.store_id = Store.find(params[:store_id]).id
      reservation.save!

      render json: reservation, serializer: Api::V1::ReservationSerializer
    end

    def duplicate_reservation
      render json: {
        date_at: reservation_params[:date_at],
        status: 200,
        messege: "すでに予約した時間帯と被ってます。",
      }, status: :ok
    end

    def no_seat_reservation
      render json: {
        seat: reservation_params[:number_people],
        status: 200,
        messege: "申し訳ありません。予約席が一杯で予約できません。",
      }, status: :ok
    end

    def record_not_found
      # TODO: この書き方は間違っている.
      # JSON形式で、クライアントにも伝わる適切なErrorメッセージを書く
      render json: {
        store_id: params[:store_id],
        status: 404,
        messege: "申し訳ありません。指定した予約データは存在しません",
      }, status: :not_found
    end

    def reservation_params
      params.require(:reservation).permit(:date_at, :date_on, :number_people, :menu, :budget,
                                          :inquiry, :user_id, :store_id)
    end
end
