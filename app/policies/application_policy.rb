class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user 
    @record = record
  end

  def index?
    @user.manager?
  end

  def show?
    @user.manager?
  end

  def create?
    @user.manager?
  end

  def new?
    create?
  end

  def update?
    @user.manager?
  end

  def edit?
    update?
  end

  def destroy?
    @user.manager?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
