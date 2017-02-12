# Navigation related helper

module MenuHelper
  ADMIN_MENUS = {
    catalogs: { name: "Catalogs", path: '/admin/catalogs', icon: 'list-alt' },
    categories: { name: "Categories", path: '/admin/categories', icon: 'pencil' },
    events: { name: "Events", path: '/admin/events', icon: 'flash' },
    submissions: { name: "Submissions", path: '/admin/user_event_submissions', icon: 'paper-plane' },
    redemptions: { name: "Redemptions", path: '/admin/redemptions', icon: 'shopping-cart' }
  }

  ACTION_METHODS = {
    show:    { icon: 'folder-open', html_options: { title: 'Show' } },
    edit:    { icon: 'pencil', html_options: { title: 'Edit' } },
    destroy: { icon: 'trash', html_options: {
                                title: 'Destroy',
                                method: :delete,
                                data: { confirm: 'Are you sure?'}
                              }}}

  # Create link_to_[show, edit, destroy] method helpers
  ACTION_METHODS.each do |k,v|
    define_method("link_to_#{k.to_s}".to_sym) do |path|
      link_to path, v[:html_options] do
        content_tag :i, '', class: "fa fa-#{v[:icon]}"
      end
    end
  end

  def app_menus
    # TODO: Add application menus here
  end

  def admin_menus
    ADMIN_MENUS.map(&:last)
  end

  def link_to_custom(path, icon, title)
    link_to path, title: title do
      content_tag :i, '', class: "fa fa-#{icon}"
    end
  end

end
