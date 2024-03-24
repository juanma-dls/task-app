class ProjectCardComponent < ViewComponent::Base
  def initialize(project:)
    @project = project
  end

  def render?
    @project.present?
  end

  def project
    @project
  end
end
