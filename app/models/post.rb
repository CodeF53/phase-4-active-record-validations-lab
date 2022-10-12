class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :title_clickbait

  def title_clickbait
    errors.add(:title, 'needs clickbait') unless /(Won't Believe|Secret|Top \d+|Guess)/i.match title
  end
end
