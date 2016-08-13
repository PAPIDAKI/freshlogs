module LoadingsHelper

 def human_boolean(delivered)
    delivered ? 'Delivered' : 'Travelling'
 end

end
