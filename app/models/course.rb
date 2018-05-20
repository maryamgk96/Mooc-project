class Course < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :user_id, presence: true
    belongs_to :user
    has_many :lectures, dependent: :destroy

end
