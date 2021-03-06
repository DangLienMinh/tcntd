ActiveAdmin.register Contact do
menu :if => proc{ current_admin_user.is_admin? }, label: "LIÊN HỆ"
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
  filter :email
  filter :name
  filter :phone
  filter :subject
  filter :created_at

actions :all, :except => [:new]
config.clear_action_items!
end
