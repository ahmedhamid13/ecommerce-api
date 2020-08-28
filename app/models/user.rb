# frozen_string_literal: true

class User < ActiveRecord::Base
  # has_one_attached :image
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  
  has_one :cart, dependent: :destroy
  has_one_attached :avatar

  def get_avatar
      self.avatar.attachment.nil? ? '' :
      "#{Rails.configuration.api_url}#{Rails.application.routes.url_helpers.rails_blob_path(self.avatar, only_path: true)}"
  end

  def as_json(options={})
    super(options).merge({
        avatar: self.get_avatar,
        cart: self.cart,
        user_endpoint: "#{Rails.configuration.api_url}/users/#{self.id}"
    })
  end
  
end
