defmodule Request do
  @moduledoc false

  alias Vodka.Builder, as: Bd

  defp match_response(diag_response) do
    case diag_response do
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

  def send_request(url, token, text, lang, form) do
    case form do
      :post ->
        HTTPoison.request(form, url, Bd.message(text, lang), Bd.header(token)) |> match_response()
      :delete ->
        HTTPoison.request(form, url, "", Bd.header(token)) |> match_response()
      :get ->
        HTTPoison.request(form, url, "", Bd.header(token)) |> match_response()
    end
  end

end