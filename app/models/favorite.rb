
class Favorite < ActiveRecord::Base
    validates :url_name, presence: true, uniqueness: true
    belongs_to :user
    has_many :groups
end
