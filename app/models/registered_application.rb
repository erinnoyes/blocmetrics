class RegisteredApplication < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, length: { minimum: 3, maximum: 20 }, presence: true
  validates :url, length: { minimum: 5 }, presence: true
end
