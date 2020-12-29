class TweetsController < ApplicationController
  get "/tweets" do
    if logged_in?
      @tweets = Tweet.all
      erb :"tweets/tweets"
    else
      redirect to "/login"
    end
  end

  get "/tweets/new" do
    if logged_in?
      if params[:content] == ""
        redirect to "/tweets/new"
      else
        @tweet = current_user.tweets.build(content: params[:content])
      end
    else
      redirect to "/login"
    end
  end
end
