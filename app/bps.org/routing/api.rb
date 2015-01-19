module BPS
	module Sinatra
		module App
			module Api
				include  Covered
				set_logger Log.logger

				cover do
					def self.registered app

						namespace '/api' do
						end


					end
				end

			end
		end
	end
end
