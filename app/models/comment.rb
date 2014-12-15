class Comment
  include Mongoid::Document
  field :content, type: String
  field :visible, type: Boolean

  validates_presence_of :content, :visible
end
