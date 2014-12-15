class Tag
  include Mongoid::Document
  include Mongoid::Slug

  has_and_belongs_to_many :posts

  field :name, type: String

  slug :name, history: true

  validates_presence_of :name
  validates_uniqueness_of :name
end
