class PagesDashboardPanelCell < Cell::Rails
  helper AdminHelper
  helper Activo::Rails::Helper

  def display
    @pages = ManageableContent::Manager.pages.order('updated_at DESC').limit(5)
    render
  end

end
