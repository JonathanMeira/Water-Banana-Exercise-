defmodule Wabanex.Repo.Migrations.CreateUsersTable do

  use Ecto.Migration

# Creating first database migration
# Creating table users and setting email ruleset

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :password, :string
      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
