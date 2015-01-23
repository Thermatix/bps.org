module BPS
	class App < Zeeb::App		# module Routing
			module Api 
				
				
				set_logger Log.logger

				cover do
					namespace '/api' do
						def self.registered app

						end
					end
				end

			end
		# end
	end
end
