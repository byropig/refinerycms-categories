module Admin
  class CategoriesController < Admin::BaseController

    crudify :category,
            :conditions => nil,            
            :include => [:parent],
            :title_attribute => 'name', :xhr_paging => true

    after_filter :validate_children
    
    def validate_children
      
      if Category.last.parent.present?
        if Category.last.parent.products.present?
          flash.now[:notice] = "Please be aware that the '#{Category.last.parent.name}' category has products attached to it. Please re-assign these."
        end
      end
        
    end
    
  end
end
