class SearchController < ApplicationController

def choose_job
end

def choose_features
  
end

def show_results
  @users = User.where(:job_id => 2)
  @users.sort! { |a,b| a.score(params) <=> b.score(params) }
end

end
