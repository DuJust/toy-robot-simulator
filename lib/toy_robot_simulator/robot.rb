module ToyRobotSimulator
  class Robot
    attr_reader :errors

    def place(x, y, orientation)
      update_position(x: x, y: y, orientation: orientation)
    end

    def report
      on_table do
        puts [@position.x, @position.y, @position.orientation].join(',')
      end
    end

    def move
      on_table do
        case
          when @position.north?
            update_position(y: @position.y + 1)
          when @position.east?
            update_position(x: @position.x + 1)
          when @position.south?
            update_position(y: @position.y - 1)
          when @position.west?
            update_position(x: @position.x - 1)
        end
      end
    end

    def left
      on_table do
        case
          when @position.north?
            update_position(orientation: Position::WEST)
          when @position.east?
            update_position(orientation: Position::NORTH)
          when @position.south?
            update_position(orientation: Position::EAST)
          when @position.west?
            update_position(orientation: Position::SOUTH)
        end
      end
    end

    def right
      on_table do
        case
          when @position.north?
            update_position(orientation: Position::EAST)
          when @position.east?
            update_position(orientation: Position::SOUTH)
          when @position.south?
            update_position(orientation: Position::WEST)
          when @position.west?
            update_position(orientation: Position::NORTH)
        end
      end
    end

    private

    def on_table
      @errors = []

      if @position && @position.on_table?
        yield if block_given?
        true
      else
        @errors << 'Robot is not on table.'
        false
      end
    end

    def update_position(**args)
      @errors       = []
      next_position = create_or_clone_position(args)

      if next_position.on_table?
        @position = next_position
        true
      else
        @errors += next_position.errors
        false
      end
    end

    def create_or_clone_position(args)
      @position ? @position.clone_with(args) : Position.new(args[:x], args[:y], args[:orientation])
    end
  end
end
