ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  controller do
    def permitted_params
      params.permit post: [:title, :pic, :summary, :content, :category_id, :admin_user_id]
    end
  end

  index do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title)) 
    # end
    column :title 
    column "Author",:admin_user
    column :category
    column :created_at
    actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input :title, :label => "Tiêu đề"
      f.input :summary, :label => "Tóm tắt"
      f.input :category, :label => "Loại tin"
      f.file_field :pic, :label => "Image"
      f.input :admin_user, :label => "Tác giả", :selected => current_admin_user.id
      f.cktext_area :content, :class => 'ckeditor', :label => "Nội dung"
      end
      f.actions
  end

  show do |s|
      attributes_table do
        row :title do
          s.title
        end
        row :category do
          s.category
        end
        row :admin_user do
          s.admin_user
        end
        row :summary do
          s.summary
        end
        row :content do
          raw s.content
        end
        row :pic do
          s.pic? ? image_tag(s.pic.url, height: '100') : content_tag(:span, "No photo yet")
        end
    end
     active_admin_comments
   end

end