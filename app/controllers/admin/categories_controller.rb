module Admin
  class CategoriesController < Admin::BaseController

    crudify :category,
            :conditions => nil,            
            :include => [:parent],
            :title_attribute => 'name', :xhr_paging => true

    def create
          # if the position field exists, set this object as last object, given the conditions of this class.
          if Category.column_names.include?("position")
            params[:category].merge!({
              :position => ((Category.maximum(:position)||-1) + 1)
            })
          end

          if (@category = Category.create(params[:category])).valid?
            
              flash[:notice] = t('refinery.crudify.created', :what => @category.name)
        
              if @category.parent.present?
                if @category.parent.products.present?
                  flash[:notice] += " Please be aware that the '#{@category.parent.name}' category has products attached to it. Please re-assign these."
                end
              end                         
              
              redirect_to admin_categories_path            
            
          else            
              render :action => 'new'            
          end
    end
    
    def update
      
      if @category.update_attributes(params[:category])
        
        if @category.parent.present?
          if @category.parent.products.present?
            flash[:notice] = "Please be aware that the '#{@category.parent.name}' category has products attached to it. Please re-assign these."
          end
        end
        
        redirect_to admin_categories_path
      end
        
    end
    
  end
end
