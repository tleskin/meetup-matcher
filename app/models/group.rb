class Group < ActiveRecord::Base
  validates :name, :url_name, presence: true
  validates :url_name, uniqueness: true
  belongs_to :user
  belongs_to :favorites
end
