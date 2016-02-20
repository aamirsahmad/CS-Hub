class AddTypeofToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :type_of, :string
  end
end
