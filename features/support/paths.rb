module NavigationHelpers
  module Refinery
    module Categories
      def path_to(page_name)
        case page_name
        when /the list of categories/
          admin_categories_path

         when /the new category form/
          new_admin_category_path
        else
          nil
        end
      end
    end
  end
end
