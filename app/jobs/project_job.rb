class ProjectJob < ApplicationJob
  queue_as :default

  def perform(project, removed)
    ActionCable.server.broadcast 'projects',
      id: project.id,
      name: project.name,
      desc: project.desc,
      url: project.url,
      destroy: removed
    
  end
end
