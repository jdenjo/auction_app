class User < ApplicationRecord
  has_secure_password
  #this provides user authentication with bycrpt

  has_many :users
  has_many :questions
  has_many :bids

  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
