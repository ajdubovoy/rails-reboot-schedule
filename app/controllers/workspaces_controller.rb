class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
  end
end
