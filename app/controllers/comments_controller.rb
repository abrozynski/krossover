class CommentsController < ApplicationController


  #def award_user
  #end

	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    @comment.user_id = current_user.id
    
    if @comment.save
    #  current_user.kredits += @article.kredit
        current_user.update_attributes( :kredits => (current_user.kredits + @article.kredit) )
       redirect_to article_path(@article)  
    end

  end


 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
