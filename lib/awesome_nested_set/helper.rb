module CollectiveIdea #:nodoc:
  module Acts #:nodoc:
    module NestedSet #:nodoc:
      # This module provides some helpers for the model classes using acts_as_nested_set.
      # It is included by default in all views.
      #
      module Helper
        # Returns options for select.
        # You can exclude some items from the tree.
        # You can pass a block receiving an item and returning the string displayed in the select.
        #
        # == Params
        #  * +class_or_item+ - Class name or top level times
        #  * +mover+ - The item that is being move, used to exlude impossible moves
        #  * +&block+ - a block that will be used to display: { |item, descendants, level| ... }
        #
        # == Usage
        #
        #   <%= f.select :parent_id, nested_set_options(Category, @category) { |item, descendants, level|
        #       "#{'–' * level} #{item.name}"
        #     }) %>
        #
        def nested_set_options(class_or_item, mover = nil, &block)
          class_or_item.to_a(true, mover) do |item, descendants, level|
            [ block.call(item, descendants, level), item.id ]
          end
        end
        
      end
    end  
  end
end