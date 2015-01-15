require 'logger'

module Bps
  class Log
    F = File.open(Info[:logfile], 'a')
    F.sync = true
    @l = Logger.new(F).tap do |log|
      log.progname = Info[:short_name]
    end

    def self.set_level(level)
      @l.level = Logger.const_get level.upcase
    end

    def self.[]=(level,message)
      @l.send level, message
    end

  end

end
