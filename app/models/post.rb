class Post < ApplicationRecord
  belongs_to :category, required: false
  belongs_to :user, required: false
  has_many :comments

  validates :title, presence: true
  validates :category_id, presence: true
  validates :body, presence: true

  has_attached_file :image, :default_url => ":style/rails1.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search(query)
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end
end
