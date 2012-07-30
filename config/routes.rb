ProgrammingChallenges::Application.routes.draw do
  root to: "challenges#index"
  resources :challenges
end
