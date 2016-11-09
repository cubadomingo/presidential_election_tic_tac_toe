Rails.application.routes.draw do
root to: 'game#index'
post 'move', to: 'game#move'
get 'winner', to: 'game#winner'
get 'new_game', to: 'game#new_game'
end
