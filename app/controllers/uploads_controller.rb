class UploadsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    #create object for upload
    @upload = Upload.create( upload_params )
    @upload.update(user_id: current_user.id)
    @upload.update(url: @upload.document.url)

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
      params.permit(:subject, :course, :term, :year, :instructor, :type_of, :type_num, :document, :user_id)
    end
end
