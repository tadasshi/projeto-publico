RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard # mandatory
    index # mandatory
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

  config.model Post do
    configure :description, :ck_editor
    configure :summary, :text do
      html_attributes do
        {:maxlength => 155}
      end
    end
    show do
      include_all_fields
      field :description do
        pretty_value do
          value.html_safe
        end
      end
    end
    list do
      field :id
      field :title
      field :summary
      field :created_at do
        strftime_format '%d/%m/%Y'
        label do
          'Criado em'
        end
      end
    end
  end

  config.model Ebook do
    configure :description, :ck_editor
    configure :summary, :text do
      html_attributes do
        {:maxlength => 155}
      end
    end
    show do
      include_all_fields
      field :description do
        pretty_value do
          value.html_safe
        end
      end
    end
    list do
      field :id
      field :title
      field :summary
      field :created_at do
        strftime_format '%d/%m/%Y'
        label do
          'Criado em'
        end
      end
    end
  end

  config.model Metaphor do
    configure :description, :ck_editor
    configure :summary, :text do
      html_attributes do
        {:maxlength => 155}
      end
    end
    show do
      include_all_fields
      field :description do
        pretty_value do
          value.html_safe
        end
      end
    end
    list do
      field :id
      field :title
      field :summary
      field :created_at do
        strftime_format '%d/%m/%Y'
        label do
          'Criado em'
        end
      end
    end
  end

  config.model Biography do
    configure :description, :ck_editor
    configure :summary, :text do
      html_attributes do
        {:maxlength => 155}
      end
    end
    show do
      include_all_fields
      field :description do
        pretty_value do
          value.html_safe
        end
      end
    end
    list do
      field :id
      field :title
      field :summary
      field :created_at do
        strftime_format '%d/%m/%Y'
        label do
          'Criado em'
        end
      end
    end
  end

  config.model Bibliography do
    configure :description, :ck_editor
    configure :summary, :text do
      html_attributes do
        {:maxlength => 155}
      end
    end
    show do
      include_all_fields
      field :description do
        pretty_value do
          value.html_safe
        end
      end
    end
    list do
      field :id
      field :title
      field :summary
      field :created_at do
        strftime_format '%d/%m/%Y'
        label do
          'Criado em'
        end
      end
    end
  end

  config.model Bibliography do
    list do
      field :id
      field :name
      field :email
      field :created_at do
        strftime_format '%d/%m/%Y'
        label do
          'Criado em'
        end
      end
    end
  end
end
