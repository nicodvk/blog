class Post
  include Mongoid::Document
  include Mongoid::Slug

  field :title, type: String
  field :hat, type: String
  field :content, type: String
  
  slug :title, history: true

  validates_presence_of :title, :content
end
