class UploadsController < ApplicationController
  def new
  end

  def create
    # Make object in bucket
    key = "uploads/" + params[:file].original_filename + DateTime.now.to_s
    obj = S3_BUCKET.objects[key]

    #upload file
    obj.write(
      file: params[:file],
      acl: :public_read
    )

    #create object for upload
    @upload = Upload.new(
      url: obj.public_url,
      name: obj.key[8..-1],
      subject: params[:subject],
      course: params[:course],
      term: params[:term],
      year: params[:year],
      instructor: params[:instructor],
      type_of: params[:type_of],
      type_num: params[:type_num]
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


  private
    def upload_params
      params.require(:upload).permit(:file, :subject)
    end
end
