class NewsCell < BaseCell
  
  cache :sidebar_latest_news, :expires_in => 10.minutes
  
  def sidebar_app_latest_news(args)
    @app = args[:app]
    @latest_news = @app.news.limit(5)
    render
  end

  def sidebar_latest_news
    @latest_news = News.limit(10)
    render
  end
end
