ActiveAdmin.register Lecture do
    permit_params :content, :attachment, :course_id, :title

    index do 
      selectable_column
      id_column
      column :title   
      column ('course')  
      column :updated_at     
      column :created_at
  
      actions
    end
  
  show do |lecture| 
      attributes_table do
          row :title
          row ('course') 
          row :created_at
          row :updated_at 
          row (:content) { |lec| raw(lec.content)}
          if lecture.attachment? 
            if File.extname(lecture.attachment.to_s)=='.jpeg'|| File.extname(lecture.attachment.to_s)=='.jpg'        
          row :attachment do |ad|
            image_tag ad.attachment.url
        end
      else
        row (:attachment) {|lec|  link_to (lec.attachment_url)}
      end
      end
    end
  end
end