class SponsoredPostsController < ApplicationController

    def new
      @topic = Topic.find(params[:topic_id])
      @sponsored_post = SponsoredPost.new
    end

    def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:post][:title]
    @sponsored_post.title = params[:post][:price]
    @sponsored_post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    @sponsored_post.topic = @topic

    if @sponsored_post.save
      flash[:notice] = "Sponsored Post was saved."
      redirect_to [@topic, @sponsored_post]
    else
      flash.now[:alert] = "There was an error saving the Sponsored post. Please try again."
      render :new
    end
  end

    def edit
      @sponsored_post = SponsoredPost.find(params[:id])
    end

    def show
      @sponsored_post = SponsoredPost.find(params[:id])
    end

    def update
       @sponsored_post = SponsoredPost.find(params[:id])
       @sponsored_post.title = params[:post][:title]
        @sponsored_post.price = params[:post][:price]
       @sponsored_post.body = params[:post][:body]

       if @sponsored_post.save
         flash[:notice] = "Post was updated."
         redirect_to [@sponsored_post.topic, @sponsored_post]
       else
         flash.now[:alert] = "There was an error saving the post. Please try again."
         render :edit
       end
     end

     def destroy
       @post = SponsoredPost.find(params[:id])

       if @post.destroy
         flash[:notice] = "\"#{@post.title}\" was deleted successfully."
         redirect_to  @sponsored_post.topic
       else
         flash.now[:alert] = "There was an error deleting the post."
         render :show
       end
     end

  end
