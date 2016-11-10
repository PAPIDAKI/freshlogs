module WorkersHelper
	def sti_worker_path(type="worker",worker=nil,action=nil)
		send "#{format_sti(action,type,worker)}_path",worker
	end

	def format_sti(action,type,worker)
		action || if worker 
			"#{format_action(action)}#{type.underscore}"
		else
			"#{type.underscore.pluralize}"
		end
	end

	def format_action(action)
		action ? "#{action}_tenant_" : ""
	end


end
