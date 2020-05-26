defmodule MyAppWeb.CommentLive.Index do
  use MyAppWeb, :live_view

  alias MyApp.Comments
  alias MyApp.Comments.Comment

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :comments, fetch_comments())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar Comentario")
    |> assign(:comment, Comments.get_comment!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Nuevo Comentario")
    |> assign(:comment, %Comment{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listado de Comentarios")
    |> assign(:comment, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    comment = Comments.get_comment!(id)
    {:ok, _} = Comments.delete_comment(comment)

    {:noreply, assign(socket, :comments, fetch_comments())}
  end

  defp fetch_comments do
    Comments.list_comments()
  end
end
