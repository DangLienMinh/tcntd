ActiveAdmin.register_page "Dashboard" do
  
  menu priority: 1, label: "Quản lý chung"

  content title: "Quản lý chung" do
    if current_admin_user.is_admin==1
     columns do
       column do
         panel "Bài viết gần đây" do
           table_for Post.order("id desc").limit(15) do
             column :id
             column "Tiêu đề",:title do |post|
               link_to post.title,[:admin,post]
             end
             column "Tác giả",:admin_user
             column "Loại tin",:category,:sortable => :category
             column "Ngày tạo",:created_at
           end
           strong {link_to "Hiện tất cả bài viết",:admin_posts}
        end
      end

      column do
        panel "Loại tin" do
          table_for Category.order("id desc").limit(15) do
            column :id
            column "Tên loại tin",:name do |category|
              link_to category.name,[:admin,category]
            end
            column "Ngày tạo",:created_at
          end
          strong {link_to "Hiện tất cả Loại tin",:admin_categories}
       end
       end


       column do
        panel "Yêu cầu liên hệ" do
          table_for Contact.order("id desc").limit(15) do
            column :id
            column "Email",:email do |contact|
              link_to contact.name,[:admin,contact]
            end
            column "Điện thoại ",:phone
            column "Nội dung",:message

          end
          strong {link_to "Hiện tất cả liên hệ",:admin_contacts}
       end
       end
     end

    end # content
  end
end
