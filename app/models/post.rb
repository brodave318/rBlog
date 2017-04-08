class Post < ApplicationRecord
  belongs_to :category, required: false
  belongs_to :users, required: false
  has_many :comments

  validates :title, presence: true
  validates :category_id, presence: true
  validates :body, presence: true

  def self.search(query)
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end
end
