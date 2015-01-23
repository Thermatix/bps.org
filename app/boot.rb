require 'sinatra'
require 'sinatra/form_helpers'
require "sinatra/namespace"
require 'sinatra/assetpack'
require 'yui/compressor'
require 'sass'
require 'yaml'
require 'json'


root = "#{File.dirname(File.realpath(__FILE__))}/bps.org"
require "#{root}/lib/loader"
Zeeb::Loader.pre_load self, 'info'

module BPS
	include Zeeb::Covered
	Log.create Info[:short_name],Info[:logfile]
	set_logger Log.logger
	cover :fatal do

		Log[:info] = [
			'booting...',
			'loading files...'
		]
		
		Zeeb::Loader.set_up Log.logger 
		Zeeb::Loader.get_list # change this to use the auto_paths 
		Zeeb::Loader.append_file 'settings'
		Zeeb::Loader.append_file 'main'
		Zeeb::Loader.require_files self

		Log[:info] = [
			'File loading finished',
			"Sinatra will run on: #{Info[:host]}:#{Info[:port]}"
		]


	end
end
