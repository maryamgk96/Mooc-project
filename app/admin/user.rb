ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :gender, :date_of_birth, :profile_picture, :role

  index do
    selectable_column
    id_column
    column :name   
    column :email
    column :gender  
    column :date_of_birth
    column :role  
    column :created_at
    column :updated_at
    

    actions
  end

show do |user| 
    attributes_table do
        row :name
        row :email
        row :gender
        row :date_of_birth
        row :role
        row :profile_picture do |ad|
        image_tag ad.profile_picture.url
      end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "User" do
      f.input :email
      f.input :name
      f.input :profile_picture, :as => :file
      f.input :gender
      f.input :date_of_birth
      f.input :role ,:as => :select, :collection => User::ROLES
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end