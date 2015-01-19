require_relative 'lib/ibase'

module BPS
	class Info < Base::IBase
		set :version, '0.0.0'
		set :name, 'Barking Photographic Society Website'
		set :short_name, 'BPS.org'
		set :root, File.dirname(File.realpath(__FILE__))
		set :p_root, (t = self[:root].split('/')).first(t.length - 2 ).join('/')
		set :public, "#{self[:root]}/public"
		set :host, '0.0.0.0'
		set :port, '3000'
		set :logfile, "#{self[:p_root]}/#{self[:short_name]}.log"
		set :helpers, %w( FormHelpers Helpers)
		set :routing, %w( Namespace AssetPack App::Api App::Actions )
	end
end


