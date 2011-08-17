module Admin
  class PagesController < Admin::Controllers::Resource
    actions :all, :except => [ :new, :create, :delete, :destroy ]
    defaults :resource_class => ManageableContent::Page, :collection_name => 'pages', :instance_name => 'page'

    before_filter do
      #ManageableContent::Generator.generate!
    end

    def collection
      super
      @pages = @pages.order("key ASC, locale ASC")
    end 
  end
end
