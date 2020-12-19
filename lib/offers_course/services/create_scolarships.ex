defmodule OffersCourse.Services.ScholarShips do
  alias OffersCourse.Repo
  alias OffersCourse.Entities.University

  def execute(scholar_ship_list) do
    %University{}
    |> University.changeset(scholar_ship_list)
    |> Repo.insert()
  end
end
