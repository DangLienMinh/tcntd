ActiveAdmin.register Menu do
menu priority: 2,:if => proc{ current_admin_user.is_admin? },label: "MENU"
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
  filter :parent

	controller do
		def permitted_params
		  params.permit menu: [:id, :name, :parent, :order, :create_at, :update_at, :url]
		end
		before_filter { @page_title = "Danh sách Menu" }
		def edit
		  # use resource.some_method to access information about what you're editing
		  @page_title = "Cập nhật Menu: "+resource.name
		end
	end
	form do |f|
		f.inputs do
			f.input :name,:label => "Tên Hiển Thị"
			f.input :parent,:as=> :select,:label => "Menu cha", :collection => Menu.all,:include_blank =>"Không có menu cha"
			f.input :order,:label => "Thứ Tự"
			f.input :url,:label => "URL"
		end
		f.actions
	end
	index title: "Danh sách Menu" do
		selectable_column
		column "ID", :id
		column "Name",:name do |name|
		  link_to name.name,[:admin,name]
		end
		#Can get name parent o vi tri nay
		column "Parent Menu", :parent
		column "Vị trí sắp xếp", :order
		column "Ngày tạo",:created_at
		column "Ngày cập nhật",:updated_at
		column "Lệnh" do |resource|
		  links = ''.html_safe
		  links += link_to 'Xem', resource_path(resource), :class => "member_link view_link"
		  links += link_to 'Sửa', edit_resource_path(resource), :class => "member_link edit_link"
		  links += link_to 'Xóa', resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
		  links
	  	end
	end
end
