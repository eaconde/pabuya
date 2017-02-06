# Navigation related helper

module MenuHelper
  ADMIN_MENUS = {
    catalogs: { name: "Catalogs", path: '/admin/catalogs', icon: 'list-alt' },
    categories: { name: "Categories", path: '/admin/categories', icon: 'pencil' },
    events: { name: "Events", path: '/admin/events', icon: 'flash' },
    submissions: { name: "Submissions", path: '/admin/user_event_submissions', icon: 'paper-plane' }
  }

  def app_menus
    # TODO: Add application menus here
  end

  def admin_menus
    ADMIN_MENUS.map(&:last)
  end

end
