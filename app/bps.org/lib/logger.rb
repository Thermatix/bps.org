require 'logger'

module BPS
  class Log
    F = File.open(Info[:logfile], 'a')
    F.sync = true
    L = Logger.new(f).tap do |log|
      log.progname = name
    end

    def self.set_level(level)
      L.level = Logger.const_get level.upcase
    end

    def self.this(level)
      yield.each do |text|
        L.send level, text
      end
    end

  end
end