class AddDetailsToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :subject, :string
    add_column :uploads, :course, :integer
    add_column :uploads, :instructor, :string
    add_column :uploads, :year, :integer
    add_column :uploads, :term, :string
    add_column :uploads, :type, :string
    add_column :uploads, :type_num, :integer
  end
end
