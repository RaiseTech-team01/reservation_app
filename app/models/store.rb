# frozen_string_literal: true

# == Schema Information
#
# Table name: stores
#
#  id                     :bigint           not null, primary key
#  address                :string
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  fax                    :string
#  furigana               :string
#  genre                  :string
#  name                   :string
#  other                  :string
#  postal_code            :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  responsible_party      :string
#  restaurant             :string
#  seat                   :integer
#  tel                    :string
#  tokens                 :text
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  url                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_stores_on_confirmation_token    (confirmation_token) UNIQUE
#  index_stores_on_email                 (email) UNIQUE
#  index_stores_on_reset_password_token  (reset_password_token) UNIQUE
#  index_stores_on_uid_and_provider      (uid,provider) UNIQUE
#
class Store < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :users, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :word_mouths, dependent: :destroy
  has_many :store_discount_info_notifications, dependent: :destroy
  has_many :storemap, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :furigana, presence: true, length: { maximum: 100 }
  validates :tel, presence: true, format: { with: /[0-9]/ }, length: { maximum: 21 }
  validates :fax, format: { with: /[0-9]/ }, length: { maximum: 21 }
  validates :postal_code, presence: true, format: { with: /[0-9]/ }, length: { maximum: 7 }
  validates :address, presence: true
  validates :url, presence: true
  validates :seat, presence: true, format: { with: /[0-9]/ }, length: { maximum: 3 }
  validates :restaurant, presence: true, length: { maximum: 50 }
  validates :genre, presence: true, length: { maximum: 50 }
  validates :responsible_party, presence: true, length: { maximum: 50 }
end
