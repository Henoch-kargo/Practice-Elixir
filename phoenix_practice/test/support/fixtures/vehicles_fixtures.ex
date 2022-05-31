defmodule PhoenixPractice.VehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixPractice.Vehicles` context.
  """

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        id: "some id",
        status: "some status",
        vehicle_plate: "some vehicle_plate"
      })
      |> PhoenixPractice.Vehicles.create_vehicle()

    vehicle
  end

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        status: "some status",
        vehicle_plate: "some vehicle_plate"
      })
      |> PhoenixPractice.Vehicles.create_vehicle()

    vehicle
  end
end
