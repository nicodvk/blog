class Comment
  include Mongoid::Document
  embeds_one :user
  embedded_in :post, :inverse_of => :comments 
  field :content, type: String
  field :visible, type: Boolean
  field :created, type: Date

  accepts_nested_attributes_for :user

  validates_presence_of :content, :visible
end
