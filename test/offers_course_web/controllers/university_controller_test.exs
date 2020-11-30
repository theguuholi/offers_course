defmodule OffersCourseWeb.UniversityControllerTest do
  use OffersCourseWeb.ConnCase

  alias OffersCourse.Universities
  alias OffersCourse.Universities.University

  @create_attrs %{
    logo_url: "some logo_url",
    name: "some name",
    score: "120.5"
  }
  @update_attrs %{
    logo_url: "some updated logo_url",
    name: "some updated name",
    score: "456.7"
  }
  @invalid_attrs %{logo_url: nil, name: nil, score: nil}

  def fixture(:university) do
    {:ok, university} = Universities.create_university(@create_attrs)
    university
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all universities", %{conn: conn} do
      conn = get(conn, Routes.university_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create university" do
    test "renders university when data is valid", %{conn: conn} do
      conn = post(conn, Routes.university_path(conn, :create), university: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.university_path(conn, :show, id))

      assert %{
               "id" => id,
               "logo_url" => "some logo_url",
               "name" => "some name",
               "score" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.university_path(conn, :create), university: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update university" do
    setup [:create_university]

    test "renders university when data is valid", %{
      conn: conn,
      university: %University{id: id} = university
    } do
      conn =
        put(conn, Routes.university_path(conn, :update, university), university: @update_attrs)

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.university_path(conn, :show, id))

      assert %{
               "id" => id,
               "logo_url" => "some updated logo_url",
               "name" => "some updated name",
               "score" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, university: university} do
      conn =
        put(conn, Routes.university_path(conn, :update, university), university: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete university" do
    setup [:create_university]

    test "deletes chosen university", %{conn: conn, university: university} do
      conn = delete(conn, Routes.university_path(conn, :delete, university))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.university_path(conn, :show, university))
      end
    end
  end

  defp create_university(_) do
    university = fixture(:university)
    %{university: university}
  end
end
