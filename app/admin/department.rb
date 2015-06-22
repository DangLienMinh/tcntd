ActiveAdmin.register Department do
menu priority: 5,:if => proc{ current_admin_user.is_admin? },label: "Quản lý phòng ban"
#menu false
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
      params.permit department: [:name,:description,:slogan,:department_type,:url]
    end
    before_filter { @page_title = "Thêm phòng ban" }
    def edit
      #@department=Department.find_by_url(params[:id])
      # use resource.some_method to access information about what you're editing
      @page_title = "Cập nhật phòng ban "+resource.name
    end
  end

  index title: "Danh sách phòng ban" do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title)) 
    # end
    column "Tên phòng ban",:name 
    column "Lời giới thiệu",:slogan 
    column :department_type do |object|
      object.department_type? ? 'Khoa' : 'Phòng ban'
  end
    column "Ngày tạo",:created_at
    column "" do |resource|
      links = ''.html_safe
      links += link_to 'Hiển thị', resource_path(resource), :class => "member_link view_link"
      links += link_to 'Sửa', edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to 'Xóa', resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
    #actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input :name, :label => "Tên phòng ban"
      f.input :slogan, :label => "Slogan" 
      f.input :department_type, :label => "Là khoa hay phòng ban", :as => :radio, :collection =>[['Phòng ban', 0],['Khoa', 1]]
      f.cktext_area :description, :class => 'ckeditor', :label => "Mô tả"
      end
      f.actions
  end

  config.clear_action_items!

  action_item :only => :index do
      link_to "Thêm Phòng ban" , "/admin/departments/new" 
  end

  show title:"Thông tin chi tiết" do |s|
    panel "Chi tiết Phòng ban" do
      attributes_table_for department do
        row "Tên phòng ban" do
          s.name
        end
        row "Slogan" do
          s.slogan
        end
        row "Là khoa hay phòng ban" do
          s.department_type==0? "Là phòng ban" : "Là khoa"
        end
        
        row "Mô tả" do
          raw s.description
        end
      end
    end
end

end