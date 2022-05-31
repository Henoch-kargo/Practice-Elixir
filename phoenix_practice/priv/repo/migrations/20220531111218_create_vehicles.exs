defmodule PhoenixPractice.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :status, :string
      add :vehicle_plate, :string

      timestamps()
    end
  end
end
