Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } 
	resources :doctors
	resources :patients
	resources :appointments
	resources :welcomes
	resources :developers
	resources :projects
	resources :users
	resources :addresses

	
    resources :posts do #posts/:id
    	resources :likes #posts/:id/likes
		  resources :comments do #posts/:post_id/comments/
		  	resources :likes #posts/:post_id/comments/:id/likes
		  	resources :replies do #posts/:post_id/comments/comment_id/replies/
		  		resources :likes #posts/:post_id/comments/comment_id/replies/:id/likes
		  	end	    
	    end    
    end  
    resources :posts do
    	resources :images
    end

    resources :likes do
    	collection do
      post :'create_post_like' 
      post :'create_comment_like'
      post :'create_reply_like'
      delete :'destroy_post_like'
      delete :'destroy_comment_like'
      delete :'destroy_reply_like'
    	end
    end
	# resources :replies do
 #        resources :likes
 #    end
	root 'welcomes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
