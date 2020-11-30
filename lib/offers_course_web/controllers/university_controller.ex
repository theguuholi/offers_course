defmodule OffersCourseWeb.UniversityController do
  use OffersCourseWeb, :controller

  alias OffersCourse.Universities
  alias OffersCourse.Universities.University

  action_fallback OffersCourseWeb.FallbackController

  def index(conn, _params) do
    universities = Universities.list_universities()
    render(conn, "index.json", universities: universities)
  end

  def create(conn, %{"university" => university_params}) do
    with {:ok, %University{} = university} <- Universities.create_university(university_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.university_path(conn, :show, university))
      |> render("show.json", university: university)
    end
  end

  def show(conn, %{"id" => id}) do
    university = Universities.get_university!(id)
    render(conn, "show.json", university: university)
  end

  def update(conn, %{"id" => id, "university" => university_params}) do
    university = Universities.get_university!(id)

    with {:ok, %University{} = university} <-
           Universities.update_university(university, university_params) do
      render(conn, "show.json", university: university)
    end
  end

  def delete(conn, %{"id" => id}) do
    university = Universities.get_university!(id)

    with {:ok, %University{}} <- Universities.delete_university(university) do
      send_resp(conn, :no_content, "")
    end
  end
end
