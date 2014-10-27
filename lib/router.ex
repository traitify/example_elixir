defmodule ExampleElixir.Router do
  import Plug.Conn
  use Plug.Router

  use Calliope.Engine, [
    templates: "web/templates",
    alias: nil,
    layout: :none
  ]

  alias Traitify.Client

  plug :fetch
  plug :match
  plug :dispatch

  @doc """
  Landing page for the example. The available decks are passed to the UI
  """
  get "/" do
    decks = Client.all(:decks)
    haml conn, content_for(:index, [title: "Welcome to Traitify 2", decks: decks])
  end

  @doc """
  Create an assessment for a specific deck and respond with the show page
  """
  get "/assessments/:deck" do
    assessment = Client.create(:assessments, %{deck_id: deck})
    haml conn, content_for(:show, [assessment: assessment])
  end

  @doc """
  Get the slides for an assessment. This is where the assessment is taken by the user
  """
  get "/assessments/slides/:id" do
    slides = Client.all(:slides, assessment_id: id)
    haml conn, content_for(:slides, [assessment_id: id, slides: slides])
  end

  @doc """
  Post the users answers to a given slide
  """
  post "/assessments/:assessment_id/slides/:slide_id/:answer" do
    Client.update(:slides, %{response: answer, time_taken: 2}, assessment_id: assessment_id, slide_id: slide_id)
    haml conn, "true"
  end

  @doc """
  Get the results for an assessment after the assessment is completed
  """
  get "/assessments/:id/results" do
    personality_types = Client.all(:personality_types, [assessment_id: id])
    # Although not currently displayed on the page, this is an example of getting the traits
    personality_traits = Client.all(:personality_traits, [assessment_id: id])

    haml conn, content_for(:results, [personality_types: personality_types, personality_traits: personality_traits])
  end

  @doc """
  Catch invalid page requests
  """
  match _ do
    send_resp(conn, 404, "oops")
  end

  defp fetch(conn, _opts) do
    fetch_params(conn)
  end

  defp haml(conn, page, status\\200, params\\[]) do
    send_resp(conn, status, page)
  end
end
