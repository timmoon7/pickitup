class TaskPolicy < ApplicationPolicy
    def index?
        true
    end

    def create?
        user.present?
    end   
    
    def update?
        # if not admin, only can edit his/her own posts
        user.present? && user.id == task.user_id
    end 

    def destroy?
        # only can destory the user is the person created the task
        update?
    end

    # only can charge the user is the person created the task
    def charge?
        update?
    end

    def accept?
        # only can accept the user is not the person created the task
        user.present? && user.id != task.user_id
    end

    # only can complete the user is the person created the task
    def complete?
        update?
    end

    def list_mypost?
        true
    end
 
    def list_mytask?
        true
    end

    private

    def task
        record
    end

    def set_task?
        true
    end

end