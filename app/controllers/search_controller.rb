class SearchController < ApplicationController
  def index
    @query = params[:query]
    #  binding.pry
    # Movie.search_full_name(params[:query])
    @results = []
    if @query.present?
      @results = PgSearch.multisearch(@query)
                         .includes(:searchable)
                         .limit(10)
    end
     render partial: "search/results"
  end
end
