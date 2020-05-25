defmodule MyApp.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    field :like, :boolean, default: false
    field :number_like, :integer
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:title, :body, :like])
    |> validate_required([:title, :body, :like])
  end
end
