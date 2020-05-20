defmodule MyAppWeb.Plugs.SessionPlugs do
  import Plug.Conn

  def init(opts), do: opts



  def call(conn, _params) do

    current_user = conn.assigns.current_user

    conn
      |> put_session(:current_user, current_user)

  end

end
