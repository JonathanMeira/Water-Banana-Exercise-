defmodule Wabanex.Users.Get do

  import Ecto.Query

  alias Ecto.UUID
  alias Wabanex.{Repo, User, Training}

  # Calling user based on UUID

  def call(id) do
    id
    |>UUID.cast()
    |>handle_response()
  end

  # If response has error return "Invalid UUID"
  def handle_response(:error) do
    {:errors, "Invalid UUID"}
  end

  # If response is OK, case UUID exists, return User, if not, returns an error
  # message
  def handle_response({:ok, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, load_training(user)}
    end
  end

  defp load_training(user) do
    today = Date.utc_today()

    query =
      from t in Training,
       where: ^today >= t.start_date and ^today <= t.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end

end
