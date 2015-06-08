ActiveAdmin.register_page "Dashboard" do

    content :title=>"Recent Posts" do
        table_for Post.order("id desc").limit(15) do
            column :id
            column "Post title",:title do |post|
                link_to post.title,[:admin,post]
            end
            column :category,:sortable => :category
            column :created_at
            strong {link_to "Show all Posts",:admin_posts}
        end

        table_for Category.order("id desc").limit(15) do
            column :id
            column "category name",:name do |category|
                link_to category.name,[:admin,category]
            end

            strong {link_to "Show all Categories",:admin_categories}
        end
    end



end