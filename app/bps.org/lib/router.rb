module Zeeb	
	class Routes
		class << self
			def define &scipt
				@routes ||= {}
				self.new.instance_eval(&scipt)
			end
		end

		def map name, route
			set_r(get_r.merge({ name => route[:to]}))
		end

		private

			def get_r
				self.class.instance_variable_get :@routes
			end

			def set_r value
				self.class.instance_variable_set(
						:@routes, 
						value
					)
			end
	end


 	class App < ::Sinatra::Base
		
		class << self

		 	def get(*args)args[0]=check(args.first);super(*args);end
		    def put(*args)args[0]=check(args.first);super(*args);end
		    def post(*args)args[0]=check(args.first);super(*args);end
		    def delete(*args)args[0]=check(args.first);super(*args);end
		    def head(*args)args[0]=check(args.first);super(*args);end
		    def options(*args)args[0]=check(args.first);super(*args);end
		    def patch(*args)args[0]=check(args.first);super(*args);end
		    def link(*args)args[0]=check(args.first);super(*args);end
		    def unlink(*args)args[0]=check(args.first);super(*args);end

			def check path
				if path.class == Symbol
					Routes.instance_variable_get(:@routes)[path]
				else
					path
				end
			end

		end
	end
end