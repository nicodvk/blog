class Post
  include Mongoid::Document
  include Mongoid::Slug

  embeds_many :comments
  belongs_to :user
  has_and_belongs_to_many :tags
  
  field :title, type: String
  field :hat, type: String
  field :content, type: String
  field :created, type: Date
  
  slug :title, history: true

  validates_presence_of :title, :content
end
