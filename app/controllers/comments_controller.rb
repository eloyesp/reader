class CommentsController < ApplicationController

  # POST articles/2/comments
  # POST articles/2/comments.json
  def create
    @article = Article.find params[:article_id]
    @comment = @article.comments.build params[:comment]
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

# TODO: implement delete and edit comments
#  # PUT /comments/1
#  # PUT /comments/1.json
#  def update
#    @comment = Comment.find(params[:id])

#    respond_to do |format|
#      if @comment.update_attributes(params[:comment])
#        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
#        format.json { head :no_content }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @comment.errors, status: :unprocessable_entity }
#      end
#    end
#  end

#  # DELETE /comments/1
#  # DELETE /comments/1.json
#  def destroy
#    @comment = Comment.find(params[:id])
#    @comment.destroy

#    respond_to do |format|
#      format.html { redirect_to comments_url }
#      format.json { head :no_content }
#    end
#  end

end

