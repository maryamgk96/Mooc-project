class LecturesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures_users, id: false do |t|
      t.belongs_to :lecture, index: true
      t.belongs_to :user, index: true
    end
  end
end