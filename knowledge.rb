class Module
	def attribute(name, &block)
		default = nil
		name, default = name.to_a.first if name.is_a?(Hash) 
		name = name.to_sym

		define_method(name) do
			if instance_variable_get("@#{name}")
				instance_variable_get("@#{name}")
			else
				block ? instance_eval(&block) : default
			end 
		end
		 
		define_method("#{name}=") { |value| instance_variable_set("@#{name}", value) }
		define_method("#{name}?") { send(name) ? true : false }		
		
	end
end

