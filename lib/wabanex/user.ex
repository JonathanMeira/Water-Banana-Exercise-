defmodule Wabanex.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Wabanex.Training

  # Setting primary key autogeneration
  @primary_key{:id, :binary_id, autogenerate: true}

  @fields [:email,:password, :name]

  schema "users" do
      field :email, :string
      field :name, :string
      field :password, :string

      has_many :trainings, Training
      timestamps()
  end

  # Using Ecto.Changeset for memory validations.

  def changeset(params) do
    %__MODULE__{}
    |>cast(params, @fields)
    |>validate_required(@fields)
    |>validate_length(:password, min: 6)
    |>validate_length(:name, min: 2)
    |>validate_format(:email, ~r/@/)
    |>unique_constraint([:email])
  end
end
