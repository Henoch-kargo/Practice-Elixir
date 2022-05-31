defmodule PhoenixPractice.VehicleeesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixPractice.Vehicleees` context.
  """

  @doc """
  Generate a vehicleee.
  """
  def vehicleee_fixture(attrs \\ %{}) do
    {:ok, vehicleee} =
      attrs
      |> Enum.into(%{
        status: "some status",
        vehicle_plate: "some vehicle_plate"
      })
      |> PhoenixPractice.Vehicleees.create_vehicleee()

    vehicleee
  end
end
