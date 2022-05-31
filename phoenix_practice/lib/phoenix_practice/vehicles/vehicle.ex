defmodule PhoenixPractice.Vehicles.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vehicles" do
    field :status, :string
    field :vehicle_plate, :string

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:status, :vehicle_plate])
    |> validate_required([:status, :vehicle_plate])
  end
end
