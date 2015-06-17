ActiveAdmin.register Category do
menu priority: 4,:if => proc{ current_admin_user.is_admin? },label: "Quản lý danh mục"
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
      params.permit category: [:name]
    end
    before_filter { @page_title = "Thêm danh mục" }
    def edit
      # use resource.some_method to access information about what you're editing
      @page_title = "Cập nhật danh mục "+resource.name
    end
  end

  index title: "Danh sách danh mục" do
      selectable_column
      column "ID", :id
      column "Tên danh mục",:name
      column "Ngày tạo",:created_at
      column "Ngày cập nhật",:updated_at
      column "" do |resource|
		  links = ''.html_safe
		  links += link_to 'Hiển thị', resource_path(resource), :class => "member_link view_link"
		  links += link_to 'Sửa', edit_resource_path(resource), :class => "member_link edit_link"
		  links += link_to 'Xóa', resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
		  links
	end
      #actions
  end

  form do |f|
    f.inputs "Nhập thông tin chi tiết" do
      f.input :name,:label => "Tên danh mục"
    end
    f.actions
  end

  	config.clear_action_items!

	action_item :only => :index do
	    link_to "Thêm danh mục" , "/admin/categories/new" 
	end

  show title:"Thông tin chi tiết" do |s|
    panel "Chi tiết danh mục" do
      attributes_table_for category do
      	row "ID" do
          s.id
        end
        row "Tên danh mục" do
          s.name
        end
        row "Ngày tạo" do
          s.created_at
        end
        row "Ngày cập nhật" do
          s.updated_at
        end
      end
    end
   end
end

