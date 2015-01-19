module BPS
	module Sinatra
		module App
			module Api 

				include  Covered
				set_logger Log.logger

				cover do
					namespace '/api' do
						def self.registered app
							Log[:info] = "#{self} registering"

						end
					end
				end

			end
		end
	end
end
