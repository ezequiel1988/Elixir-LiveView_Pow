defmodule MyAppWeb.LoginLive do
  use MyAppWeb, :live_view


  @impl true
  def mount(_params, _session, socket) do

     {:ok, assign(socket, changeset: "cset")}

  end



end
