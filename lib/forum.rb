require 'forum/engine'

module Forum
  def Forum.dashboard(user)
    {
        label: 'forum.home.dashboard.title',
        links: [
            {label: '111', href: 'root_path'},
            {label: '222', href: 'root_path'},
            {label: '333', href: 'root_path'},
        ]
    }
  end
end
