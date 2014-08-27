Bloccit::Application.routes.draw do
  get "welcome/index"#, to: "welcome#index"
  get "welcome/about"#, to: "welcome#about"
  get "welcome/contact"
  
  root to: 'welcome#about'
end
