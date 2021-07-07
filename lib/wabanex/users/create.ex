defmodule Wabanex.Users.Create do

  alias Wabanex.{Repo, User}

  # Function to create users from table users from database

  def call(params) do
    params
    |>User.changeset()
    |>Repo.insert()
  end
end
