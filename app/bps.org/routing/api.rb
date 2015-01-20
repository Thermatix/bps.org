module BPS
	module Sinatra
		module App
			module Api 

				include  Covered
				set_logger Log.logger

				cover do
					# namespace '/api' do
						def self.registered app

						end
					# end
				end

			end
		end
	end
end
