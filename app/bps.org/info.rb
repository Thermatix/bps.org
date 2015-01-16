require_relative 'lib/ibase'

module BPS
	module Info  
		include Base::IBase
		set :version, '0.0.0'
		set :name, 'Barking Photographic Society Website'
		set :short_name, 'BPS.org'
		set :root, File.dirname(File.realpath(__FILE__))
		set :p_root, (t = self[:root].split('/')).first(t.length - 2 ).join('/')
		set :host, '0.0.0.0'
		set :port, '3000'
		set :logfile, "#{self[:p_root]}/#{self[:short_name]}.log"

	end
end


