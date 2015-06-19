# encoding: utf-8
ActiveAdmin.register Slider do

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
    def slider_params
      params.require(:slider).permit(:name,:infobig, :infosmall, :pic1, :pic2, :pic3,  :pic4,  :pic5)
    end
  end

  index do |s|
    # column :title do
    #   link_to(:title, admin_post_path(s.title))
    # end
    column :name
    column :infobig
    column :infosmall
    column :created_at
    actions
  end

  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input :name, :label => "Tên"
      f.input :infobig, :label => "Dòng Chữ Trên"
      f.input :infosmall, :label => "Dòng Chữ Dưới"

      f.input :pic1,:as => :file, :label => "Ảnh 1"

      f.input :pic2,:as => :file, :label => "Ảnh 2"


      f.input :pic3,:as => :file, :label => "Ảnh 3"


      f.input :pic4,:as => :file, :label => "Ảnh 4"


      f.input :pic5,:as => :file, :label => "Ảnh 5"


    end
    f.actions
  end

  show do |s|
    attributes_table do
      row :name do
        s.name
      end
      row :infobig do
        s.infobig
      end
      row :infosmall do
        s.infosmall
      end

      row :pic1 do
        s.pic1? ? image_tag(s.pic1.url, height: '100') : content_tag(:span, "No photo yet")
      end


      row :pic2 do
        s.pic2? ? image_tag(s.pic2.url, height: '100') : content_tag(:span, "No photo yet")
      end


      row :pic3 do
        s.pic3? ? image_tag(s.pic3.url, height: '100') : content_tag(:span, "No photo yet")
      end


      row :pic4 do
        s.pic4? ? image_tag(s.pic4.url, height: '100') : content_tag(:span, "No photo yet")
      end


      row :pic5 do
        s.pic5? ? image_tag(s.pic5.url, height: '100') : content_tag(:span, "No photo yet")
      end



    end
    active_admin_comments
  end

end
