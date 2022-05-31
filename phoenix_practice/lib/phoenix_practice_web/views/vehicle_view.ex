defmodule PhoenixPracticeWeb.VehicleView do
  use PhoenixPracticeWeb, :view
  alias PhoenixPracticeWeb.VehicleView

  def render("index.json", %{vehicles: vehicles}) do
    %{data: render_many(vehicles, VehicleView, "vehicle.json")}
  end

  def render("show.json", %{vehicle: vehicle}) do
    %{data: render_one(vehicle, VehicleView, "vehicle.json")}
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    %{
      id: vehicle.id,
      status: vehicle.status,
      vehicle_plate: vehicle.vehicle_plate
    }
  end
end
