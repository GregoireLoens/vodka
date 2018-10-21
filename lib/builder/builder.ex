defmodule Vodka.Builder do
  @moduledoc false
  
  def header(token) do
    [
      {"Authorization", "Bearer #{token.token}"},
      {"Content-Type", "application/json"}
    ]
  end

  def message(text, lang) do
    %{
      queryInput: %{
        text: %{
          text: text,
          languageCode: lang
        }
      }
    }
    |> Poison.encode!
  end
end
