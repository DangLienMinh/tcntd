ActiveAdmin.register AdminUser do
  menu priority: 2,:if => proc{ current_admin_user.is_admin? },label: "Quản lý người dùng"
  permit_params :email, :name, :password, :password_confirmation, :is_admin, :department_id
    index title: "Danh sách người dùng" do
      selectable_column
      id_column
      column "Email",:email
      column "Họ tên",:name
      column "Ngày ĐN mới nhất ",:current_sign_in_at
      column "Số lần ĐN",:sign_in_count
      column "Quản trị",:is_admin
      column "Phòng ban",:department
      column "" do |resource|
        links = ''.html_safe
        links += link_to 'Hiển thị', resource_path(resource), :class => "member_link view_link"
        links += link_to 'Sửa', edit_resource_path(resource), :class => "member_link edit_link"
        links += link_to 'Xóa', resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
        links
      end
      #actions
    end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Nhập thông tin chi tiết" do
      f.input :email,:label => "Email"
      f.input :name,:label => "Họ tên"
      f.input :password,:label => "Mật khẩu"
      f.input :password_confirmation,:label => "Nhập lại mật khẩu"
      f.input :is_admin, :label => "Là quản trị hệ thống", :as => :radio, :collection =>[['Không là admin', 0],['Là admin', 1]]
      
      f.input :department,:label => "Phòng ban", :include_blank => false
    end
    f.actions
  end

  config.clear_action_items!

  action_item :only => :index do
      link_to "Thêm người dùng" , "/admin/admin_users/new" 
  end

  show title: "Thông tin chi tiết" do |s|
    panel "Thông tin chi tiết" do
      attributes_table_for admin_user do
        row "ID" do
          s.id
        end
        row "Email" do
          s.email
        end
        row "Họ tên" do
          s.name
        end
        row "Lần đăng nhập gần nhất" do
          s.current_sign_in_at
        end
        row "Số lần đăng nhập" do
          s.sign_in_count
        end
        row "Là quản trị hệ thống" do
          s.is_admin
        end
        row "Phòng ban" do
          s.department
        end
      end
    end
   end

  controller do
    before_filter { @page_title = "Thêm người dùng" }
    def edit
      # use resource.some_method to access information about what you're editing
      @page_title = "Cập nhật thông tin của "+resource.name
    end
  end
end