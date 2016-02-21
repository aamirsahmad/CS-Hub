ActiveAdmin.register Upload do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :url, :subject, :course, :instructor, :year, :term, :type_num, :type_of, :user_id, :document_file_name, :document_content_type, :document_file_size, :document_updated_at
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
