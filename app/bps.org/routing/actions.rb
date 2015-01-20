module BPS
	module Sinatra
		module App
			module Actions

				include  Covered
				set_logger Log.logger

				cover do
					def self.registered app
						app.get '/' do
							erb :index
						end
					end
				end

			end
		end
	end
end