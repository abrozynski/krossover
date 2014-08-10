class UsersController < ApplicationController

 skip_before_filter :authenticate_user!, :only => [:show, :index], :if => lambda { 
    if params[:id]
      @user = User.find(params[:id])
      @user and @user.public?
    else
      false
    end
  }

  def new

  end

  def show
    	@user = User.friendly.find(params[:id])
      # @feed= (Article.all + Comment.all).sort!{|a,b| a.updated_at <=> b.updated_at}.reverse.take(10)

      comments = Comment.all
      comments_array = []
      comments.each do |f|
        comment_info ={}
        comment_info['feed_text'] = f.commenter + ' submitted to ' + Article.find(f.article_id).title
        comment_info['link'] = '../comments/' + f.id.to_s
        comment_info['time_stamp'] = f.updated_at
        comments_array<<comment_info
      end

      articles=Article.all
      articles_array =[]
      articles.each do |f|
        article_info ={}
        article_info['feed_text']='A new goal has been created:' + f.title
        article_info['time_stamp']=f.created_at
        article_info['link'] = '../goals/' + f.id.to_s
        articles_array<<article_info
      end



      @feed = (comments_array + articles_array).sort!{|a,b| a['time_stamp'] <=> b['time_stamp']}.reverse.take(10)
     
  end

  def index
  	@user = User.all.order(cumulative_kredit: :desc).take(10)
  end

   
   #articles, comments, kredit earnings, new users?


end
