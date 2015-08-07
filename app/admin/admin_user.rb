ActiveAdmin.register AdminUser do
  skip_before_filter :verify_authenticity_token
  menu priority: 7,:if => proc{ current_admin_user.is_admin? },label: "TÀI KHOÁN NGƯỜI DÙNG"
  action_item only:[:show] do
    link_to "Message Customers", new_admin_share_blast_path(share_blast:{share_id:share})
  end
  permit_params :email, :name, :password, :password_confirmation,:phone, :is_admin, :page_id
    index title: "Danh sách người dùng" do
      selectable_column
      column "Email",:email do |email|
        link_to email.email,[:admin,email]
      end
      column "Họ tên",:name
      column "SĐT",:phone
      column "Ngày ĐN mới nhất",:current_sign_in_at
      column "Quản trị" do |m|
      m.is_admin? ? "Quản trị" : "Người dùng"
    end
      column "Phòng ban",:page
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
  filter :name
  filter :page
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|

    f.inputs "Nhập thông tin chi tiết" do
      f.input :id,input_html: { :style=> 'display:none;' },:label=>false
      f.input :email,:label => "Email"
      f.input :name,:label => "Họ tên"
      f.input :phone,:label => "Số Điện Thoại"
      f.input :password_current,:label => "Mật khẩu hiện tại"
      f.input :password,:label => "Mật khẩu mới"
      f.input :password_confirmation,:label => "Nhập lại mật khẩu mới"
      if current_admin_user.is_admin?
        f.input :is_admin, :label => "Là quản trị hệ thống", :as => :boolean, :input_html => {
          :onclick => "
              if(document.getElementById('admin_user_is_admin').checked==true){
               $('#admin_user_page_id').parent().hide();
               $('#admin_user_page_id').val(null);
              }else{
                $('#admin_user_page_id').parent().show();
                $('#admin_user_page_id').val($('#admin_user_page_id option:first').val());
              }
          "}
        f.input :page ,:label => "Trang", :include_blank => false
      end
    end
    f.actions
  end

  config.clear_action_items!

  action_item :only => :index do
      link_to "Thêm người dùng" , "/admin/admin_users/new" 
  end
  action_item :only => :show do
      ("<a class='fancybox' href='#inline1' title=''>Thay Đổi Mật Khẩu</a>").html_safe

  end
action_item :only => :show do

      link_to "Thay đổi thông tin cá nhân",edit_admin_admin_user_path
      
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
        row "Số điện thoại" do
          s.phone
        end
        row "Lần đăng nhập gần nhất" do
          s.current_sign_in_at
        end
        row "Số lần đăng nhập" do
          s.sign_in_count
        end
        row "Là quản trị hệ thống" do
          s.is_admin? ? "Quản trị" : "Người dùng"
        end
        row "Phòng ban" do
          s.page
        end
      end
    end
   end

  controller do
    def edit
      # use resource.some_method to access information about what you're editing
      @page_title = "Cập nhật thông tin của "+resource.name
    end

    def update
      # get the currently logged in AdminUser's id
      current_id = current_admin_user.id
      # load the AdminUser being updated
      @admin_user = AdminUser.find(params[:id])
      @current_pass=params[:admin_user][:password_current].to_s
      # update the AdminUser with new attributes
      # if successful, this will sign out the AdminUser being updated
      if @admin_user.valid_password?(@current_pass)
        if @admin_user.update_attributes(permitted_params[:admin_user])
          # if the updated AdminUser was the currently logged in AdminUser, sign them back in
          if @admin_user.id == current_id
            sign_in(AdminUser.find(current_id), :bypass => true)
          end
          flash[:notice] = 'Thay đổi thông tin tài khoản thành công !'
          redirect_to '/admin'
        # display errors
        else
            flash[:notice] = 'Thông tin bạn vừa nhập chưa đúng ! Vui lòng thực hiện lại.'
          redirect_to '/admin'
        end
      else
         flash[:notice] ='Mật khẩu bạn vừa nhập không đúng ! Vui lòng thực hiện lại.'
          redirect_to '/admin'
      end
    end

  end
end