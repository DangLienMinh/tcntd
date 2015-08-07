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
    column "" do |resource|
        links = ''.html_safe
        links += link_to 'Hiển thị', resource_path(resource), :class => "member_link view_link"
        links += link_to 'Sửa', edit_resource_path(resource), :class => "member_link edit_link"
        #links += link_to 'Xóa', resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
        links
      end
  end


  form :html => { :multipart => true }  do |f|
    f.inputs  do
      f.input :numslider, :label => "Số slider hiển thị"
      f.input :numpostbox, :label => "Số post hiển thị"
      f.label :muctieu,"Mục Tiêu :"
      f.cktext_area :muctieu, :class => 'ckeditor', :label_inline => "Mục tiêu"
      f.label :cacnghedt,"Các nghề đào tạo :"
      f.cktext_area :cacnghedt, :class => 'ckeditor', :label => "Các nghề đào tạo"
      f.input :copyright, :label => "Thông tin copyright"
      f.input :diachi, :label => "Địa chỉ"
      f.input :phone, :label => "SĐT"
      f.input :email, :label => "Email"
      f.input :linkfb, :label => "Liên kết Facebook"
      f.input :linktw, :label => "Liên kết Twiter"
      f.label :trangthai,"Trạng Thái :"
      f.check_box :trangthai
    end
    f.actions
  end

  config.clear_action_items!

end
