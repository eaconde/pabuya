# Navigation related helper

module MenuHelper
  ADMIN_MENUS = {
    catalogs: { name: "Catalogs", path: '/admin/catalogs', icon: 'list-alt' },
    categories: { name: "Categories", path: '/admin/categories', icon: 'pencil' }
  }

  def app_menus
    # TODO: Add application menus here
  end

  def admin_menus
    ADMIN_MENUS.map(&:last)
  end

end
