class Category
  include Mongoid::Document

  has_many :questions, dependent: :destroy

  field :category,        type: String
end
