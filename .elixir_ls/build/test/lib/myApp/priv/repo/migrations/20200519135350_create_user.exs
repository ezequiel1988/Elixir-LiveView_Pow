defmodule MyApp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string, null: false
      add :password, :string

      timestamps()
    end

    create unique_index(:user, [:email])

  end
end
