RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.authorize_with :cancan
  config.current_user_method &:current_user

  config.included_models = [Comment, Tag, Post, User]

  config.model 'Post' do 
    configure :comments do
      queryable true
      searchable :all       
    end
    field :title
    field :hat
    field :content
    field :tags
    field :created, :hidden do
      default_value do
        DateTime.now
      end
    end
    field :user, :hidden do 
     visible false
     default_value do
        bindings[:view]._current_user.id
      end
    end
    field :comments
  end

  config.model 'Comment' do
    field :content
    field :id, :hidden
    field :user, :hidden do 
      visible false
      default_value do
        bindings[:view]._current_user.id
      end
    end
    field :created do 
      default_value do
        DateTime.now
      end
    end
  end

  config.model 'User' do
    field :email
    field :country
    field :type
    field :firstname
    field :lastname
    field :street
    field :country_code
    field :town
    field :phone
    field :birthdate
  end

  config.model 'Tag' do
    field :name
    field :posts
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
