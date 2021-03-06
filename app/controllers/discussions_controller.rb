class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.xml
  def index
    @discussions = Discussion.order('updated_at DESC').page(params[:page]).per(5)
    @discussion = Discussion.new
    @post = @discussion.posts.build
    @latest = Discussion.latest_discussions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @discussions }
    end
  end

  # GET /discussions/1
  # GET /discussions/1.xml
  def show
    @discussion = Discussion.find(params[:id])
    @post = Post.new(:discussion => @discussion)
    @submit_text = "Post Reply"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @discussion }
    end
  end

  # GET /discussions/new
  # GET /discussions/new.xml
  def new
    redirect_to new_discussion_url()
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.xml
  def create
    if params[:url] != 'http://'  #TODO refactor into constants
      render :partial => 'layouts/spam' and return
    end

   # Rails.logger.debug("bg:" + request.env["HTTP_X_FORWARDED_FOR"])
    params[:discussion][:posts_attributes]['0'][:one_day_id] = get_one_day_id(request.remote_ip)
    @discussion = Discussion.new(params[:discussion])

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to(discussions_url, :notice => 'Discussion was successfully created.') }
        format.xml  { render :xml => @discussion, :status => :created, :location => @discussion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @discussion.errors, :status => :unprocessable_entity }
      end
    end
  end  

  # PUT /discussions/1
  # PUT /discussions/1.xml
  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to(@discussion, :notice => 'Discussion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { 
          @post = @discussion.posts.last  #hack
          @submit_text = "Post Reply"
          render :action => "edit"
        }
        format.xml  { render :xml => @discussion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.xml
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to(discussions_url) }
      format.xml  { head :ok }
    end
  end
end
