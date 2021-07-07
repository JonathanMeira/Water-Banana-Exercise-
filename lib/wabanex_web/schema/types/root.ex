defmodule WabanexWeb.Schema.Types.Root do

  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers
  alias WabanexWeb.Schema.Types

  alias Resolvers.User, as: UserResolver
  alias Resolvers.Training, as: TrainingResolver

  alias Crudry.Middlewares.TranslateErrors



  # Importing default types at root

  import_types Types.Custom.UUID4
  import_types Types.User
  import_types Types.Training

  # Creating root layer for GraphQL

  object :root_query do
    # Responsible for getting user information based upon Id
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)
      resolve &UserResolver.get/2
    end
  end


  object :root_mutation do
    # Responsible for creating an user using create_user_input object
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
    # Read possible error at execution time and translate then at GraphQL api route
      middleware TranslateErrors
    end

     # Responsible for creating an user using create_training_input object
     field :create_training, type: :training do
      arg :input, non_null(:create_training_input)

      resolve &TrainingResolver.create/2
    # Read possible error at execution time and translate then at GraphQL api route
      middleware TranslateErrors
    end









  end




end
