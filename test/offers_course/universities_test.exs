defmodule OffersCourse.UniversitiesTest do
  use OffersCourse.DataCase

  alias OffersCourse.Universities

  describe "universities" do
    alias OffersCourse.Universities.University

    @valid_attrs %{logo_url: "some logo_url", name: "some name", score: "120.5"}
    @update_attrs %{logo_url: "some updated logo_url", name: "some updated name", score: "456.7"}
    @invalid_attrs %{logo_url: nil, name: nil, score: nil}

    def university_fixture(attrs \\ %{}) do
      {:ok, university} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Universities.create_university()

      university
    end

    test "list_universities/0 returns all universities" do
      university = university_fixture()
      assert Universities.list_universities() == [university]
    end

    test "get_university!/1 returns the university with given id" do
      university = university_fixture()
      assert Universities.get_university!(university.id) == university
    end

    test "create_university/1 with valid data creates a university" do
      assert {:ok, %University{} = university} = Universities.create_university(@valid_attrs)
      assert university.logo_url == "some logo_url"
      assert university.name == "some name"
      assert university.score == Decimal.new("120.5")
    end

    test "create_university/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Universities.create_university(@invalid_attrs)
    end

    test "update_university/2 with valid data updates the university" do
      university = university_fixture()

      assert {:ok, %University{} = university} =
               Universities.update_university(university, @update_attrs)

      assert university.logo_url == "some updated logo_url"
      assert university.name == "some updated name"
      assert university.score == Decimal.new("456.7")
    end

    test "update_university/2 with invalid data returns error changeset" do
      university = university_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Universities.update_university(university, @invalid_attrs)

      assert university == Universities.get_university!(university.id)
    end

    test "delete_university/1 deletes the university" do
      university = university_fixture()
      assert {:ok, %University{}} = Universities.delete_university(university)
      assert_raise Ecto.NoResultsError, fn -> Universities.get_university!(university.id) end
    end

    test "change_university/1 returns a university changeset" do
      university = university_fixture()
      assert %Ecto.Changeset{} = Universities.change_university(university)
    end
  end
end
