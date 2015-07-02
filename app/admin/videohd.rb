# encoding: utf-8
ActiveAdmin.register Videohd do
  menu :if => proc{ current_admin_user.is_admin? }, label: "VIDEO HOẠT ĐỘNG"
  controller do
    def permitted_params
      params.permit videohd: [:caption,:link,:ordernum]
    end
  end
  index  title: "Danh sách video hoạt động "do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title))
    # end
    column :caption
    column :link
    column :ordernum

    actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input :caption, :label => "Tiêu đề"
      f.input :link, :label => "Liên kết"
      f.input :ordernum, :label => "STT"
    end
    f.actions
  end

  config.clear_action_items!
  action_item :only => :index do
    link_to "Thêm video" , "/admin/videohds/new"
  end
  show title:"Thông tin chi tiết video" do |s|
    attributes_table do
      row :caption do
        s.caption
      end
      row :link do
        s.link
      end
      row :ordernum do
        s.ordernum
      end

    end
    active_admin_comments
  end

end
