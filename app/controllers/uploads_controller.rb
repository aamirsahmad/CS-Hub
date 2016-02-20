class UploadsController < ApplicationController
  before_action :authenticate_user!

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
      type_num: params[:type_num],
      user_id: current_user.id
    )

    #save upload
    if @upload.save
      redirect_to uploads_path, :flash => { :success => "File successfully uploaded!" }
    else
      flash.now[:error] = 'Upload Error' + @upload.errors.messages.to_s
      render :new
    end
  end

  def index
    @uploads = Upload.all
    @min_required_uploads = 3
  end


  private
    def upload_params
      params.require(:upload).permit(:file, :subject)
    end
end
