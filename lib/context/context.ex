defmodule Vodka.Context do
  @moduledoc false


  def delete(project, token, id, context) do
    url = "https://dialogflow.googleapis.com/v2/projects/#{project}/agent/sessions/#{id}/contexts/#{context}"
    Request.send_request(url, token, "", "", :delete)
  end

  def delete_all(project, token, id) do
    url = "https://dialogflow.googleapis.com/v2/projects/#{project}/agent/sessions/#{id}/contexts"
    Request.send_request(url, token, "", "", :delete)
  end

  def get(project, token, id, context) do
    url = "https://dialogflow.googleapis.com/v2/projects/#{project}/agent/sessions/#{id}/contexts/#{context}"
    Request.send_request(url, token, "", "", :get)
  end
end
