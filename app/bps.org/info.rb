require 'lib/ibase'
module BPS
	module Info  
		include Base::IBase
		set :logfile, 'some path'
		set :version, '0.0.0'

	end
end