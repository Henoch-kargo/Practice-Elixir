defmodule PhoenixPracticeWeb.VehicleeeView do
  use PhoenixPracticeWeb, :view
  alias PhoenixPracticeWeb.VehicleeeView

  def render("index.json", %{vehicleees: vehicleees}) do
    %{data: render_many(vehicleees, VehicleeeView, "vehicleee.json")}
  end

  def render("show.json", %{vehicleee: vehicleee}) do
    %{data: render_one(vehicleee, VehicleeeView, "vehicleee.json")}
  end

  def render("vehicleee.json", %{vehicleee: vehicleee}) do
    %{
      id: vehicleee.id,
      status: vehicleee.status,
      vehicle_plate: vehicleee.vehicle_plate
    }
  end
end
