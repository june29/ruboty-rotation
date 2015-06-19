module Ruboty
  module Handlers
    class Rotation < Base
      NAMESPACE = "rotation"

      on(/rotation items add (?<item>.+)/, name: "add_item", description: "Add item")
      on(/rotation items delete (?<item>.+)/, name: "delete_item", description: "Delete item")
      on(/rotation items\z/, name: "list_items",  description: "List items")
      on(/rotation next\z/, name: "move_to_next", description: "Rotate to next")
      on(/rotation prev\z/, name: "move_to_prev", description: "Rotate to prev")
      on(/rotation current\z/, name: "current", description: "Show current")

      attr_writer :items

      def initialize(*args)
        super
        set_current
      end

      def add_item(message)
        item = message[:item]

        if items.include?(item)
          message.reply("Item #{item} already exist")
        else
          items << item
          message.reply("Item #{item} added")
        end
      end

      def delete_item(message)
        item = message[:item]

        if items.include?(item)
          items.delete(item)
          message.reply("Item #{item} deleted")
        else
          message.reply("Item #{item} does not exist")
        end
      end

      def list_items(message)
        message.reply(items.join(","), code: true)
      end

      def move_to_next(message)
        index = current_index + 1

        if index >= items.size
          set_index(0)
        else
          set_index(index)
        end
      end

      def move_to_prev(message)
        index = current_index - 1

        if index < 0
          set_index(items.size - 1)
        else
          set_index(index)
        end
      end

      def current(message)
        message.reply([
            ENV['ROTATION_CURRENT_PREFIX'],
            current_item,
            ENV['ROTATION_CURRENT_SUFFIX']
          ].compact.join(""))
      end

      private

      def current_item
        items[current_index]
      end

      def current_index
        robot.brain.data[NAMESPACE][:current_index]
      end

      def set_index(index)
        robot.brain.data[NAMESPACE][:current_index] = index
      end

      def set_current
        setup_brain
        robot.brain.data[NAMESPACE][:current_index] ||= 0
      end

      def items
        setup_brain
        robot.brain.data[NAMESPACE][:items] ||= []
      end

      def setup_brain
        robot.brain.data[NAMESPACE] ||= {}
      end
    end
  end
end
