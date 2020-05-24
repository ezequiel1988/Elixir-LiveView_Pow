defmodule MyApp.Repo.Migrations.CreateProducts do
  use Ecto.Migration
  alias MyApp.Users.User

  def change do
    create table(:products) do
      add :name, :string
      add :stock, :integer
      add :image, :string
      add :view, :integer
      add :price, :integer
      add :users_id, references(:users)

      timestamps()
    end
    create unique_index(:products, [:name])

  end
end
