module BPS
	class App < Zeeb::App		# module Routing
			module Actions

				include  Covered
				set_logger Log.logger
				cover do
					def self.registered app
						app.get :root do
							erb :index
						end
					end
				end

			end
		# end
	end
end