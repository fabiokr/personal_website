class PagesDashboardPanelCell < Cell::Rails
  helper AdminHelper

  def display
    @pages = ManageableContent::Manager.pages.order('updated_at DESC').limit(5)
    render
  end

end
