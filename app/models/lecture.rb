class Lecture < ApplicationRecord
    validates :attachment, file_size: { less_than: 1.megabytes }
    validates_uniqueness_of :title, scope: :course_id
    validates :title , presence: true
    mount_uploader :attachment, AttachmentUploader
    belongs_to :course
    has_and_belongs_to_many :users
    acts_as_votable
    acts_as_commentable

    def spam!(user)
        if !spam?(user)
        self.users<< user
        end
    end

    def spam?(user)
        self.users.include? user
    end
end
