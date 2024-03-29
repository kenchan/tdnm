module ApplicationHelper
  def weblog
    @_weblog ||= Weblog.first
  end

  def meta_description
    @_meta_description ||= if @article
      truncate(
        strip_tags(Commonmarker.to_html(@article.body)),
        length: MetaTags.config.description_limit
      )
    else
      nil
    end
  end

  def default_meta_tags
    {
      site: weblog.title,
      charset: 'utf-8',
      title: @article.try(:title),
      reverse: true,
      description: meta_description,
      og: {
        title: @article.try(:title),
        site_name: weblog.title,
        image: @article.try(:featured_image_url).blank? ? weblog.default_featured_image_url : @article.featured_image_url,
        description: meta_description,
        url: @article ? article_path(title: @article.title, only_path: false) : root_url(only_path: false),
        type: @article ? 'article' : 'website'
      },
      twitter: {
        card: "summary"
      }
    }
  end
end
