require 'sinatra'
require 'sinatra/form_helpers'
require 'yaml'
require 'json'



root = File.dirname(File.realpath(__FILE__))
%w( info lib/logging).each do |file|
	require "#{root}/bps.org/#{file}"
end

module BPS
	begin
		Log[:info] = [
			'booting...',
			'loading files...'
		]
		folder_list = %w(lib models helpers routing)
		files = []
		

		folder_list.each do |folder|
			files << Dir.glob("#{Info[:root]}/#{folder}/*.rb")
		end
		files = files.flatten
					 .push("#{Info[:root]}/main")
		files.each do |file|
			Log[:info] = "loading #{File.basename(file,'.rb')}"
			require file
		end

		Log[:info] = [
			'File loading finished',
			"Sinatra will run on: #{Info[:host]}:#{Info[:port]}"
		]
		Log[:asd] = {
			info: 'asdsad',
			fatal: 'sadad'
		}
	rescue Exception => err
		Log[:fatal] = [
			"Boot Failure \n error=#{err}",
			"Stacktrace=#{err.backtrace.join("\n")}"
		]
		raise
	end
end
