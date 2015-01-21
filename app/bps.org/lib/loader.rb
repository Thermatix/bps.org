module BPS
	class Loader
		class << self
			attr_accessor :logger, :files, :root
		
			def set_up  root, logger
				self.logger = logger
				self.root = root
				self.files = []
			end

			def get_list folder_list
				folder_list.each do |folder|
					self.files << Dir.glob("#{self.root}/#{folder}/*.rb")
				end
				self.files = self.files.flatten
			end

			def append_file file, root=nil
				path = "#{root||self.root}/#{file}"
				self.files.push path
			end

			def prepend_file file, root=nil
				path = "#{root||self.root}/#{file}"
				self.files.unshift path
			end		

			def require_files context
				get_files :require,context
			end

			def reload_files context
				get_files :load,context
			end
			
			def reload_file file,context
				wrap context, file, :load
			end

			def pre_load context,root, file_list, logger=nil
				puts 'pre-loading files'
				logger.info = 'pre-loading files' if logger				
				file_list.each do |file|
					wrap context, "#{root}/#{file}", :require, logger
				end				
			end

			private 

				def get_files method, context
					self.files.each do |file|
						wrap context,file,method
					end	
				end

				def wrap context, file, method,logger=nil
					context.instance_exec(self) do |loader|
						loader.send :get_file, method, file, (logger || loader.logger)
					end	
				end
				def get_file method, file,context, logger=nil
					l = logger || self.logger || nil
					if context.send method, file
						if l
							msg = "loaded #{File.basename(file,'.rb')}"
							puts msg
							l.info msg
						end
					end
				end
		end
	end
end