class Post
  include Mongoid::Document
  include Mongoid::Slug

  embeds_many :comments
  belongs_to :user
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :comments, allow_destroy: true

  field :title, type: String
  field :hat, type: String
  field :content, type: String
  field :created, type: Date
  field :likes, type: Array, default: []
  
  slug :title, history: true

  validates_presence_of :title, :content
end
