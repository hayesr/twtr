class QueriesController < ApplicationController
  def index
    @queries = Query.all
  end

  def show
    @query = Query.find(params[:id])
  end
end
