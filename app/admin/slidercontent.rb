# encoding: utf-8
ActiveAdmin.register Slidercontent do

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
      params.permit slidercontent: [:link,:topcaption, :botcaption, :ordernum, :picture]
    end
  end
  index do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title))
    # end
    column :ordernum
    column :link
    column :topcaption
    column :botcaption
    actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input :link, :label => "Đường link"
      f.input :topcaption, :label => "Dòng Chữ Trên"
      f.input :botcaption, :label => "Dòng Chữ Dưới"
      f.input :ordernum, :label => "STT"
      f.input :picture,:as => :file, :label => "Ảnh"

    end
    f.actions
  end

  show do |s|
    attributes_table do
      row :link do
        s.link
      end
      row :topcaption do
        s.topcaption
      end
      row :botcaption do
        s.botcaption
      end
      row :ordernum do
        s.ordernum
      end
      row :picture do
        s.picture? ? image_tag(s.picture.url, height: '100') : content_tag(:span, "No photo yet")
      end

    end
    active_admin_comments
  end
end
