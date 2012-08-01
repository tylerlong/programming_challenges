ProgrammingChallenges::Application.routes.draw do
  root to: "challenges#index"
  resources :challenges do
    member do
      post :test
    end
  end
end
