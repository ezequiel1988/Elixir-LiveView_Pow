defmodule MyApp.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :title, :string
      add :body, :string
      add :like, :boolean, default: false, null: false
      add :number_like, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:user_id])
  end
end
