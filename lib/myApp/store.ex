defmodule MyApp.Store do

  def search_by_email(email) do
    :timer.sleep(2000)
    list_of_users()
      |> Enum.filter(fn x -> x.email == email end)
  end

  def search_by_active(%{"active"=> active}) do
    IO.inspect(active)
    list_of_users()
      |> Enum.filter(fn x -> x.active == active end)
  end

  def list_of_users do
    [
      %{
        name: "Pedro",
        lastname: "Gonzales",
        age: 36,
        email: "pedro@email.com",
        active: "false"
        },
      %{
        name: "Ezequiel",
        lastname: "Olivera",
        age: 31,
        email: "ekiolivier@gmail.com",
        active: "true"
        },
      %{
        name: "Marcela",
        lastname: "Jimenez",
        age: 45,
        email: "mjimenez@email.com",
        active: "true"
        },
      %{
        name: "Nerio",
        lastname: "Villa",
        age: 56,
        email: "nvilla@email.com",
        active: "false"
        },
      %{
        name: "Cecilia",
        lastname: "Mosir",
        age: 24,
        email: "cmoris@email.com",
        active: "true"
        }
    ]
  end

end
