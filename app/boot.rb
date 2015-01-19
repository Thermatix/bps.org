require 'sinatra'
require 'sinatra/form_helpers'
require "sinatra/namespace"
require 'sinatra/assetpack'
require 'yui/compressor'
require 'yaml'
require 'json'
 


root = "#{File.dirname(File.realpath(__FILE__))}/bps.org"
require "#{root}/lib/loader"
BPS::Loader.pre_load self,root, %w( info lib/logging lib/covered )

module BPS
	include Covered
	Log.create Info[:short_name],Info[:logfile]
	set_logger Log.logger
	cover :fatal do

		Log[:info] = [
			'booting...',
			'loading files...'
		]
		
		Loader.set_up Info[:root], Log.logger 
		Loader.get_list %w(lib models helpers routing)
		Loader.append_file 'main'
		Loader.require_files self

		Log[:info] = [
			'File loading finished',
			"Sinatra will run on: #{Info[:host]}:#{Info[:port]}"
		]


	end
end
