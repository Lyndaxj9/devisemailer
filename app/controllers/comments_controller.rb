class CommentsController < ApplicationController
	before_action :authenticate_user! #has to be a signed in user to use these functions
	
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(params[:comment].permit(:body))
		@comment.user_id = current_user.id if current_user
		
		if @comment.save
			redirect_to article_path(@article), notice: "Comment successfully saved."
		else
			redirect_to 'new'
		end
	end
	
	def update
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		
		if @comment.update(params[:comment].permit(:body))
			redirect_to article_path(@article), notice: "Comment successfully updated."
		else
			render 'edit'
		end
	end
	
	def edit
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
	end
	
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article), notice: "Comment successfully deleted."
	end
	
end