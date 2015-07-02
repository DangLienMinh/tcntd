# encoding: utf-8
ActiveAdmin.register Confighome do

  menu :if => proc{ current_admin_user.is_admin? }, label: "CẤU HÌNH TRANG CHỦ"
  controller do
    def permitted_params
      params.permit confighome: [:numslider,:numpostbox,:muctieu,:cacnghedt,:diachi,:phone,:email,:linkfb,:linktw,:copyright,:trangthai]
    end
    before_filter { @page_title = "Cấu hình trang chủ" }
    def edit
      #@department=Department.find_by_url(params[:id])
      # use resource.some_method to access information about what you're editing
      @page_title = 'Cập nhật cấu hình '
    end
  end
  index  title: "Cấu hình trang chủ "do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title))
    # end
    column :numslider,:label=>"Số slider hiển thị"
    column :numpostbox,:label=>"Số post hiển thị"

    column :trangthai,:label=>"Trạng thái"
    actions
  end


  form :html => { :multipart => true }  do |f|
    f.inputs  do
      f.input :numslider, :label => "Số slider hiển thị"
      f.input :numpostbox, :label => "Số post hiển thị"
      f.cktext_area :muctieu, :class => 'ckeditor', :label => "Mục tiêu"
      f.cktext_area :cacnghedt, :class => 'ckeditor', :label => "Các nghề đào tạo"
      f.cktext_area :copyright, :class => 'ckeditor', :label => "Thông tin copyright"
      f.cktext_area :diachi, :class => 'ckeditor', :label => "Địa chỉ"
      f.input :phone, :label => "SĐT"
      f.input :email, :label => "Email"
      f.input :linkfb, :label => "Liên kết Facebook"
      f.input :linktw, :label => "Liên kết Twiter"
      f.check_box :trangthai,:label =>"Trạng thái"

    end
    f.actions
  end

  config.clear_action_items!

end
