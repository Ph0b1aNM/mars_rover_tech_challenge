Rails.application.routes.draw do

	#Set root view for http://localhost:3000
	root 'roverinputs#new', as: 'home'
	#
	get '/roverinputs/:id', to: 'roverinputs#show', as: 'id_roverinputs'
	#
	get 'index' => 'roverinputs#index', as: 'index_roverinputs'
	#
	get 'new' => 'roverinputs#new', as: 'new'
	#Set following resources for roverinputs_controller
	resource :roverinputs
	resolve('Roverinputs') { [:roverinputs] }
	#, only: [:show, :create, :update, :destroy, :edit, :new]

	get '/outputprocs/index' => 'outputprocs#run_output'
	#
	get '/outputprocs/show' => 'outputprocs#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
