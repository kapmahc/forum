require 'forum/engine'

module Forum
  def Forum.dashboard(user)
    links= [
        {label: 'forum.articles.new.title', href: 'new_article_path'},
        {label: 'forum.articles.index.title', href: 'articles_path'},
        {label: 'forum.comments.index.title', href: 'comments_path'},
    ]
    if user.is_admin?
      links << {label: 'forum.tags.index.title', href: 'tags_path'}
    end
    {
        label: 'forum.home.title',
        links: links
    }
  end
end
