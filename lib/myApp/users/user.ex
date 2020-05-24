defmodule MyApp.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword, PowEmailConfirmation]
  alias MyApp.Products.Product


  schema "users" do
    pow_user_fields()

    has_many :products, Product

    timestamps()

  end

  def changeset(user_or_changeset, attrs) do
   user_or_changeset
   |> pow_changeset(attrs)
   |> pow_extension_changeset(attrs)
 end
end
