defmodule PhoenixPracticeWeb.TransporterResolver do
  alias PhoenixPracticeWeb.Vehicle
  alias PhoenixPracticeWeb.Vehicles.Vehicle

  def vehicle_list(_root, _args, _info) do
    {:ok, PhoenixPracticeWeb.Vehicles.Vehicle.list_vehicles()}
  end
end