defmodule Wabanex.Trainings.Create do

  alias Wabanex.{Repo,Training}

  # Function to create an training from table trainings from database

  def call(params) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end

end
