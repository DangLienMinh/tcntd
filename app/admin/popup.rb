# encoding: utf-8
ActiveAdmin.register Popup do

  menu :if => proc{ current_admin_user.is_admin? }, label: "QUẢN LÝ POPUP"
  controller do
    def permitted_params
      params.permit popup: [:caption,:content,:trangthai]
    end
  end
  index  title: "Danh sách popup "do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title))
    # end
    column :caption
    column :content
    column :trangthai

    actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input :caption, :label => "Tiêu đề"
      f.cktext_area :content, :class => 'ckeditor', :label => "Nội dung"
      f.check_box :trangthai, :label => "Trạng thái"
    end
    f.actions
  end
  config.clear_action_items!
  action_item :only => :index do
    link_to "Thêm popup" , "/admin/popups/new"
  end
  show title:"Thông tin chi tiết popup" do |s|
    attributes_table do
      row :caption do
        s.caption
      end
      row :content do
        raw(s.content)
      end
      row :trangthai do
        s.trangthai
      end

    end
    active_admin_comments
  end
end
