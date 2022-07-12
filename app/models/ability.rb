class Ability
 include CanCan::Ability

 def initialize(user)

     user ||= User.new # guest user (not logged in)

     if user.has_role? :admin
       can :manage, Category
       can :manage , :all  
     else
       can :read, Category

     end
 end
end


# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     #byebug
#      user ||= User.new

#     can :read, Category

#     # if a user is logged in
#     if user.present?
#       if user.has_role? :admin
#         #admins have the privilege to manage everything
#         can :manage, Category
#         can :manage, :all
#       else
#       #other users are given permission to read and edit their own posts.
#         can :read, Category
#        #They cannot read any hidden articles
#         #cannot :read, Category, hidden: true
#       end
#      else
#       #user not signed in should view a sign_up page:
#       can :read, :sign_up
#     end
#     end
#      # user ||= User.new # guest user (not logged in)
#      #   if user.role?.eql?("admin")
#      #     can :manage, :all
      
#   end
#     #  if user.has_role? :admin
#     #   can :manage, :all
#     # else
#     #   can :read, :all
#     # end  
#     # Define abilities for the passed in user here. For example:
#     #
#     #   user ||= User.new # guest user (not logged in)
#     #   if user.admin?
#     #     can :manage, :all
#     #   else
#     #     can :read, :all
#     #   end
#     #
#     # The first argument to `can` is the action you are giving the user 
#     # permission to do.
#     # If you pass :manage it will apply to every action. Other common actions
#     # here are :read, :create, :update and :destroy.
#     #
#     # The second argument is the resource the user can perform the action on. 
#     # If you pass :all it will apply to every resource. Otherwise pass a Ruby
#     # class of the resource.
#     #
#     # The third argument is an optional hash of conditions to further filter the
#     # objects.
#     # For example, here the user can only update published articles.
#     #
#     #   can :update, Article, :published => true
#     #
#     # See the wiki for details:
#     # https://github.com/ryanb/cancan/wiki/Defining-Abilities

