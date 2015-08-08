# encoding: utf-8
ActiveAdmin.register Slidercontent do
  menu priority: 3,:if => proc{ current_admin_user.is_admin? },label: "SLIDER"


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
filter :name
  filter :created_at
  filter :updated_at
  controller do
    def permitted_params
      params.permit slidercontent: [:link,:topcaption, :botcaption, :ordernum, :picture]
    end
  end
  index  title: "Danh sách slider"do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title))
    # end
    column :ordernum
    column :link
    column :topcaption
    column "Image" do |m|
      m.picture? ? image_tag(m.picture.url,width:'100', height: '100') : content_tag(:span, "Chưa có dữ liệu ")
    end
    actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input :link, :label => "Liên kết"
      f.input :topcaption, :label => "Dòng Chữ Trên"
      f.input :botcaption, :label => "Dòng Chữ Dưới"
      f.input :ordernum, :label => "STT",input_html: { min: '0', max: '5' }
      f.input :picture,:as => :file, :label => "Ảnh"

    end
    f.actions
  end
  config.clear_action_items!
  action_item :only => :index do
    link_to "Thêm slider" , "/admin/slidercontents/new"
  end
  show title:"Thông tin chi tiết slider" do |s|
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
