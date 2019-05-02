defmodule Vodka.Query do
  @moduledoc """
  Query management for simple discussion with a chatbot
"""

  alias Vodka.Builder, as: Bd

  def send_query(token, text, lang, id) do
    url = "https://dialogflow.googleapis.com/v2/projects/viny-526fe/agent/sessions/#{id}:detectIntent"

    case HTTPoison.request(:post, url, Bd.message(text, lang), Bd.header(token)) do
      {:ok, %HTTPoison.Response{status_code: status, body: body}} when status in 200..299 ->
        {:ok, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: status, body: body}} when status in 400..499 ->
        {:error, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: status, body: body}} when status >= 500 ->
        {:error, Poison.decode!(body)}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Poison.decode!(reason)}
    end
  end
end
