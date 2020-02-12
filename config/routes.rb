Rails.application.routes.draw do
  

  get 'tags/show'
  get 'tags/index'
  resources :users, only: [:new, :create]
  # Notice that `resource` is singular. Unlike `resources`,
  # `resource` will create routes that are meant to do CRUD
  # on a single thing. There will be no index route or any
  # route with :id. When using singular resource, the controller
  # it links to should still be plural.
  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resource :session, only: [:new, :create, :destroy]

  # get "/products/new" => "products#new", as: :new_product
  # post "/products" => "products#create", as: :products
  # get "/products/:id" => "products#show", as: :product
  # get "/products" => "products#index"
  # delete "/products/:id" => "products#destroy"
  # get "/products/:id/edit" => "products#edit", as: :edit_product
  # patch "/products/:id" => "products#update"

  resources :products do
    # creates the following route for us:
    # post('/products/:product_id/reviews', { to: 'reviews#create', as: :product_reviews })
    # Which, due to the `as` creates a method called `product_reviews_path`
    # This method requires one variable, a product or product id to "fill in"
    # the value for `:product_id` in the path
    # It returns the value: '/products/:product_id/reviews' with the :product_id
    # "filled in"
    resources :reviews, shallow: true, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
      resources :votes, only: [:create, :update, :destroy]
    end
    resources :favourites, shallow: true, only: [:create, :destroy]
  end
  resources :favourites, only: [:index]
  patch "/reviews/:id/toggle" => "reviews#toggle_hidden", as: "toggle_hidden"


  resources :news_articles
  resources :tags, only: [:show, :index]
  resources :votes, shallow: true, only: [:create, :update, :destroy]
  root "welcome#home"
  get("/about", { to: "welcome#about", as: :about })
  get("/contact_us", { to: "contacts#index", as: :contact })
  post("/contact_us", { to: "contacts#create" })
  match(
  "/delayed_job",
  to: DelayedJobWeb,
  anchor: false,
  via: [:get, :post]
)
# API routes
namespace :api, defaults: {format: :json} do
  namespace :v1 do
    resources :products, only: [:index, :show,:create]
    resource :session, only: [:create, :destroy]
    resources :users, only: [:create] do
        get :current, on: :collection
    end
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
