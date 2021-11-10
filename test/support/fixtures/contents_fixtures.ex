defmodule Sns.ContentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sns.Contents` context.
  """

  @doc """
  Generate a content.
  """
  def content_fixture(attrs \\ %{}) do
    {:ok, content} =
      attrs
      |> Enum.into(%{
        detail: "some detail",
        name: "some name"
      })
      |> Sns.Contents.create_content()

    content
  end
end
