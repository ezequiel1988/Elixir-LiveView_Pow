defmodule MyAppWeb.FormLive do
  use MyAppWeb, :live_view
  alias MyApp.Store


  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, email: "", stores: Store.list_of_users(), loading: false )}
  end

  @impl true
  def handle_event("email", %{"email" => email_input}, socket) do

    send(self(), {:email_not_found, email_input})

  socket = assign(socket, email: email_input, stores: Store.search_by_email(email_input), loading: true)

  {:noreply, socket}

  end


  @impl true
  def handle_info({:email_not_found, email_input}, socket) do

    case Store.search_by_email(email_input) do
      [] ->
        socket=
          socket
          |> put_flash(:error, "no se encontro ningún usuario con este email #{email_input}")
          |> assign(stores: [],  loading: false)

        {:noreply, socket}

        stores ->
          socket =
            socket
            |> clear_flash()
            |> assign( stores: stores, loading: true)
        {:noreply, socket}


    end
  end

end
