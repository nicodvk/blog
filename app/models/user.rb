require 'carrierwave/mongoid'

class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Slug

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  
  mount_uploader :avatar, AvatarUploader
  
  field :current_sign_in_at, 			type: Time
  field :current_sign_in_ip, 			type: String
  field :email,              			type: String, default: ""
  field :encrypted_password, 			type: String, default: ""
  field :last_sign_in_at,    			type: Time
  field :last_sign_in_ip,    			type: String
  field :remember_created_at, 		type: Time
  field :reset_password_sent_at, 	type: Time
  field :reset_password_token,   	type: String
  field :sign_in_count,      			type: Integer, default: 0
  field :country,                 type: String
  field :type, 										type: String
  field :firstname,               type: String
  field :lastname,                type: String
  field :street,                  type: String
  field :country_code,            type: String
  field :town,                    type: String
  field :phone,                   type: String
  field :birthdate,               type: String

  slug :name, history: false

  def name
    "#{firstname} #{lastname}"
  end
end
