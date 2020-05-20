defmodule MyAppWeb.PageLive do
  use MyAppWeb, :live_view

  @impl true
  def mount(_params, %{"current_user" => params}, socket) do

    {:ok, assign(socket, user: params)}

  end

end
