class NewsCell < BaseCell
  
  def sidebar_latest_news(args)
    @app = args[:app]
    @latest_news = @app.news.limit(5)
    render
  end

end
