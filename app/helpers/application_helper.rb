module ApplicationHelper


    def authorized(object, current_user)
        object.user_id == current_user.try(:id)        
    end

end
