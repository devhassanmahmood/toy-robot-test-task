require_relative '../validations/command'

module Processors
  class Command
    
    def self.interpret(instruction)
      args = instruction.split(/\s+/)
      command = args.first.to_s.downcase.to_sym
      arguments = args.last

      raise ArgumentError, 'Invalid command' unless ::Validations::Command::VALID_COMMANDS.include?(command)

      case command
      when :place
        raise ArgumentError, 'Invalid command' if arguments.nil?

        tokens = arguments.split(/,/)

        raise ArgumentError, 'Invalid command' unless tokens.count > 2

        x = tokens[0].to_i
        y = tokens[1].to_i
        direction = tokens[2].downcase.to_sym

        return { method_name: 'place', params: [x, y, direction]}
      when :move
        return { method_name: 'move', params: [] }
      when :left
        return { method_name: 'rotate_left', params: [] }
      when :right
        return { method_name: 'rotate_right', params: [] }
      when :report
        return { method_name: 'report', params: [] }
      else
        raise ArgumentError, 'Invalid command'
      end
    end
  end
end
