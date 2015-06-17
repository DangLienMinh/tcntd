ActiveAdmin.register Post do
  menu priority: 3,label: "Quản lý bài viết"
 #menu :if => proc{ current_admin_user.is_admin? }
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
      params.permit post: [:title, :pic, :summary, :content, :category_id, :admin_user_id]
    end
    def scoped_collection
      # some stuffs
      if current_admin_user.department_id==1
        super.where(:category_id=>10)
      elsif current_admin_user.department_id==2
        super.where(:category_id=>8)
      elsif current_admin_user.department_id==3
        super.where(:category_id=>7)
      elsif current_admin_user.department_id==4
        super.where(:category_id=>6)
      elsif current_admin_user.department_id==5
        super.where(:category_id=>5)
      else
        super.all
      end
    end
    before_filter { @page_title = "Thêm bài viết" }
    def edit
      # use resource.some_method to access information about what you're editing
      @page_title = "Cập nhật bài viết "+resource.title
    end
  end

  index title: "Danh sách bài viết" do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title)) 
    # end
    column "Tiêu đề",:title 
    column "Tác giả",:admin_user
    column "Loại tin",:category
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
      f.input :title, :label => "Tiêu đề"
      if current_admin_user.is_admin?
        #f.input :category, :label => "Loại tin", :collection => Category.where(:id=>[1,2,3,4])
        f.input :category, :label => "Loại tin"
      elsif current_admin_user.department_id==1
        f.input :category, :label => "Loại tin", :selected => 10,:input_html => { disabled: true }
      elsif current_admin_user.department_id==2
        f.input :category, :label => "Loại tin", :selected => 8,:input_html => { disabled: true }
      elsif current_admin_user.department_id==3
        f.input :category, :label => "Loại tin", :selected => 7,:input_html => { disabled: true }
      elsif current_admin_user.department_id==4
        f.input :category, :label => "Loại tin", :selected => 6,:input_html => { disabled: true }
      elsif current_admin_user.department_id==5
        f.input :category, :label => "Loại tin", :selected => 5,:input_html => { disabled: true }
      end
      f.input :admin_user, :label => "Tác giả", :selected => current_admin_user.id,:input_html => { disabled: true }
      f.input :pic, :as => :file, :label => "Hình ảnh",:hint=>image_tag(f.object.pic.url(:thumb))
      f.input :summary, :label => "Tóm tắt"
      f.cktext_area :content, :class => 'ckeditor', :label => "Nội dung"
      end
      f.actions
  end

  config.clear_action_items!

  action_item :only => :index do
      link_to "Thêm bài viết" , "/admin/posts/new" 
  end

  show title:"Thông tin chi tiết" do |s|
    panel "Chi tiết bài viết" do
      attributes_table_for post do
        row "Tiêu đề" do
          s.title
        end
        row "Loại tin" do
          s.category
        end
        row "Tác giả" do
          s.admin_user
        end
        row "Hình ảnh" do
          s.pic? ? image_tag(s.pic.url, height: '100') : content_tag(:span, "No photo yet")
        end
        row "Tóm tắt" do
          s.summary
        end
        row "Nội dung" do
          raw s.content
        end
      end
    end
   end
end