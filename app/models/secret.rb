class Secret < ActiveRecord::Base
  belongs_to :user2
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user2

  validates :content, presence: true
end
