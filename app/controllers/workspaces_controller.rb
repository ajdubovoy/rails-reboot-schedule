class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.find(params[:id])
  end
end
