Rails.application.routes.draw do
  namespace :open_desk do
    get "/menu", to: "central_navigation#menu", as: :menu
  end
end
