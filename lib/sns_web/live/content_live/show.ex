defmodule SnsWeb.ContentLive.Show do
  use SnsWeb, :live_view

  alias Sns.Contents

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:content, Contents.get_content!(id))}
  end

  defp page_title(:show), do: "Show Content"
  defp page_title(:edit), do: "Edit Content"
end
