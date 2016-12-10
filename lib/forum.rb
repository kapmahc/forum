require 'forum/engine'

module Forum
  def self.dashboard(user)
    links= [
        {label: 'forum.articles.new.title', href: 'new_article_path'},
        {label: 'forum.articles.index.title', href: 'articles_path'},
        {label: 'forum.comments.index.title', href: 'comments_path'},
    ]
    if user.is_admin?
      links << nil
      links << {label: 'forum.tags.index.title', href: 'tags_path'}
    end
    {
        label: 'forum.dashboard.title',
        links: links
    }
  end

  def self.sitemap
    app = Forum::Engine.routes.url_helpers
    links = []

    Setting.languages.each do |l|
      links += Article.select(:id, :updated_at).map { |a| {url: app.article_path(a, locale: l), lastmod: a.updated_at} }
      links +=Tag.select(:id, :updated_at).map { |t| {url: app.tag_path(t, locale: l), lastmod: t.updated_at} }

      links << {url: app.hot_articles_path(locale: l)}
      links << {url: app.latest_articles_path(locale: l)}
      links << {url: app.hot_tags_path(locale: l)}
      links << {url: app.hot_comments_path(locale: l)}
      links << {url: app.latest_comments_path(locale: l)}

      links << {url: app.root_path(locale:l)}
    end

    links
  end
end
