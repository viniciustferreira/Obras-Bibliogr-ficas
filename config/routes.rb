Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount V1::AuthorAPI => '/v1/author/'
end
