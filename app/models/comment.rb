class Comment
  include Mongoid::Document
  embeds_one :user
  embedded_in :post, :inverse_of => :comments 
  field :content, type: String
  field :visible, type: Boolean

  validates_presence_of :content, :visible
end
