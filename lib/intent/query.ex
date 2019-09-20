defmodule Vodka.Query do
  @moduledoc """
  Query management for simple discussion with a chatbot
"""


  def send_query(project, token, text, lang, id) do
    url = "https://dialogflow.googleapis.com/v2/projects/#{project}/agent/sessions/#{id}:detectIntent"
    Request.send_request(url, token, text, lang, :post)
  end
end
