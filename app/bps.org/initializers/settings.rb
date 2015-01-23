module BPS
	module Settings
		module Singleton_Methods

			def setup_extentions_for context				
				context.instance_exec do
					assets do		  		
				  		serve '/js', from: "#{Info[:assets]}/javascripts"
				  		serve '/css', from: "#{Info[:assets]}/css"
				  		serve '/images', from: "#{Info[:assets]}/images"

				  		js :main, [
				  			"/js/vendor/jquery-1.11.2.min.js",
				  			"/js/main.js"
				  		]

				  		css :main, [
				  			"/css/main.css"
				  		]

				  		css_compression :sass
				  		js_compression  :yui, :munge => true 
				  	end
				end
			end

		end


		def self.included(base)
			base.extend Singleton_Methods
		end

	end
end