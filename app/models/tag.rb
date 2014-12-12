class Tag
  include Mongoid::Document
  field :name, type: String

  validate_presence_of :name
  validates_uniqueness_of :name
end
