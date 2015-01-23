
module BPS
	class Info < Zeeb::Base::Info
		set :version, '0.0.0'
		set :name, 'Barking Photographic Society Website'
		set :short_name, 'BPS.org'
		set :root, File.dirname(File.realpath(__FILE__))
		set :p_root, (t = self[:root].split('/')).first(t.length - 2 ).join('/')
		set :public, "#{self[:root]}/public"
		set :assets, "#{self[:root]}/assets"
		set :host, '0.0.0.0'
		set :port, '3000'
		set :logfile, "#{self[:p_root]}/#{self[:short_name]}.log"
		set :helpers, %w( FormHelpers 
						  Helpers 
						  Rack::Utils
						)
		set :register, %w( Namespace 
						   AssetPack 
						   App::Api 
						   App::Actions
						)
		set :description, 'some description'
		set :author, 'Martin Becker'
	end
end


