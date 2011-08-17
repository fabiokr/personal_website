class PagesDashboardPanelCell < Cell::Rails
  helper AdminHelper

  def display
    @pages = ManageableContent::Page.order('updated_at DESC').limit(5)
    render
  end

end
