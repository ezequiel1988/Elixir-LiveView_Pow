defmodule MyApp.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyApp.Users.User

  schema "products" do
    field :image, :string
    field :name, :string
    field :price, :integer
    field :stock, :integer
    field :view, :integer
    field :user_id, :integer


    belongs_to :users, User

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :stock, :image, :view, :price])
    |> validate_required([:name, :stock, :image, :price], message: "*Se debe completar este campo")
    |> validate_number(:price, greater_than: 0, message: "*No puede ser menor a cero")
    |> validate_number(:stock, greater_than: -1, message: "*No puede ser menor a cero")
    |> validate_format(:image,  ~r/https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/, message: "*Formato de url inválido")


  end
end
