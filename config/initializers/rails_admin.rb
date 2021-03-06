RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
   config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

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
    state

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model Review do
    list do
      fields :title, :rating, :book, :user, :created_at
      field :state, :state
    end

    edit do
      fields :title, :description, :rating, :book, :user, :created_at
      field :state, :state
    end
    state({
      events: {publish: 'btn-success', unpublish: 'label-important', cansel: 'btn-danger'},
      states: {in_draft: 'label-warning', published: 'btn-success', canseled: 'btn-danger'}
    })
  end
  config.model Order do
    list do
      fields :status_confirmed, :state,  :order_total, :order_items, :user, :created_at 
      field :state, :state
    end
    state({
      events: {was_delivered: 'btn-success',
               in_delivering: 'btn-warning',
               default_state: 'label-warning',
               cancel: 'btn-danger'},
      states: {waiting_processing: 'label-warning',
               in_delivery: 'btn-warning',
               delivered: 'btn-success',
               canceled: 'btn-danger' }
    })
  end
end
