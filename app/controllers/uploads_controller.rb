class UploadsController < ApplicationController
  def new
  end

  def create
    # Make object in bucket
    key = "uploads/" + params[:file].original_filename
    obj = S3_BUCKET.objects[key]

    #upload file
    obj.write(
      file: params[:file],
      acl: :public_read
    )

    #create object for upload
    @upload = Upload.new(
      url: obj.public_url,
      name: obj.key[8..-1]
    )

    #save upload
    if @upload.save
      redirect_to uploads_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error uploading your file'
      render :new
    end
  end

  def index
    @uploads = Upload.all
  end
end
