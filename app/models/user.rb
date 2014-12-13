class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  after_initialize :migrate_data

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

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
  field :type, 										type: String

  def migrate_data
      if !self[:first_name].blank? or !self[:last_name].blank?
          self.set(:name, "#{self[:first_name]} #{self[:last_name]}".strip)
          self.remove_attribute(:first_name)
          self.remove_attribute(:last_name)
      end
  end

end
