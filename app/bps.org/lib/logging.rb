require 'logger'

module BPS
  class Log
    F = File.open(Info[:logfile], 'a')
    F.sync = true
    @l = Logger.new(F).tap do |log|
      log.progname = Info[:short_name]
    end
    class << self
      def set_level(level)
        @l.level = Logger.const_get level.upcase
      end

      def display(message, level)
        puts message unless level == :fatal
      end

      def []=(level,message)
        case message.class.to_s
          when 'String'
            display message, level
            @l.send level, message
          when 'Array'
            message.each do |line|
              display line, level
              @l.send level, line
            end
          when 'Hash'
            message.each do |level,line|
              display line, level
              @l.send level, line
            end
        else
          raise TypeError, "method expects Hash,String or Array, message was of type #{message.class}"
        end
      end
      
      
    end

  end

end
