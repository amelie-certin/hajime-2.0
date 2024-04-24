# frozen_string_literal: true

Rails.application.routes.draw do
  root 'fights#new'

  resources :fights, only: %i[new create show]
  resources :characters, only: %i[new create show index]
end
