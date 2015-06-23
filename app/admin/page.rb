ActiveAdmin.register Page do
menu priority: 5,:if => proc{ current_admin_user.is_admin? },label: "Quản lý trang"
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
      params.permit page: [:name,:description,:slogan,:menu_id,:url]
    end
    before_filter { @page_title = "Thêm trang" }
    def edit
      #@department=Department.find_by_url(params[:id])
      # use resource.some_method to access information about what you're editing
      @page_title = "Cập nhật trang "+resource.name
    end
  end

  index title: "Danh sách trang" do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title)) 
    # end

    column "Tên trang",:name do |name|
        link_to name.name,[:admin,name]
      end
    column "Lời giới thiệu",:slogan 
    
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
      f.input :name, :label => "Tên trang"
      f.input :slogan, :label => "Slogan"
      f.input :menu, :label => "Menu", :include_blank => false
      f.cktext_area :description, :class => 'ckeditor', :label => "Mô tả"
      end
      f.actions
  end

  config.clear_action_items!

  action_item :only => :index do
      link_to "Thêm trang" , "/admin/departments/new" 
  end

  show title:"Thông tin chi tiết" do |s|
    panel "Chi tiết trang" do
      attributes_table_for page do
        row "Tên trang" do
          s.name
        end
        row "Slogan" do
          s.slogan
        end

        row "Mô tả" do
          raw s.description
        end
      end
    end
end

end