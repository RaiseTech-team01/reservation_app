# frozen_string_literal: true

# == Schema Information
#
# Table name: stores
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  image                  :string(255)
#  name                   :string(255)
#  nickname               :string(255)
#  provider               :string(255)      default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  tokens                 :text(65535)
#  uid                    :string(255)      default(""), not null
#  unconfirmed_email      :string(255)
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
end
