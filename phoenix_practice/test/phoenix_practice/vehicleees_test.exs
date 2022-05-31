defmodule PhoenixPractice.VehicleeesTest do
  use PhoenixPractice.DataCase

  alias PhoenixPractice.Vehicleees

  describe "vehicleees" do
    alias PhoenixPractice.Vehicleees.Vehicleee

    import PhoenixPractice.VehicleeesFixtures

    @invalid_attrs %{status: nil, vehicle_plate: nil}

    test "list_vehicleees/0 returns all vehicleees" do
      vehicleee = vehicleee_fixture()
      assert Vehicleees.list_vehicleees() == [vehicleee]
    end

    test "get_vehicleee!/1 returns the vehicleee with given id" do
      vehicleee = vehicleee_fixture()
      assert Vehicleees.get_vehicleee!(vehicleee.id) == vehicleee
    end

    test "create_vehicleee/1 with valid data creates a vehicleee" do
      valid_attrs = %{status: "some status", vehicle_plate: "some vehicle_plate"}

      assert {:ok, %Vehicleee{} = vehicleee} = Vehicleees.create_vehicleee(valid_attrs)
      assert vehicleee.status == "some status"
      assert vehicleee.vehicle_plate == "some vehicle_plate"
    end

    test "create_vehicleee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vehicleees.create_vehicleee(@invalid_attrs)
    end

    test "update_vehicleee/2 with valid data updates the vehicleee" do
      vehicleee = vehicleee_fixture()
      update_attrs = %{status: "some updated status", vehicle_plate: "some updated vehicle_plate"}

      assert {:ok, %Vehicleee{} = vehicleee} = Vehicleees.update_vehicleee(vehicleee, update_attrs)
      assert vehicleee.status == "some updated status"
      assert vehicleee.vehicle_plate == "some updated vehicle_plate"
    end

    test "update_vehicleee/2 with invalid data returns error changeset" do
      vehicleee = vehicleee_fixture()
      assert {:error, %Ecto.Changeset{}} = Vehicleees.update_vehicleee(vehicleee, @invalid_attrs)
      assert vehicleee == Vehicleees.get_vehicleee!(vehicleee.id)
    end

    test "delete_vehicleee/1 deletes the vehicleee" do
      vehicleee = vehicleee_fixture()
      assert {:ok, %Vehicleee{}} = Vehicleees.delete_vehicleee(vehicleee)
      assert_raise Ecto.NoResultsError, fn -> Vehicleees.get_vehicleee!(vehicleee.id) end
    end

    test "change_vehicleee/1 returns a vehicleee changeset" do
      vehicleee = vehicleee_fixture()
      assert %Ecto.Changeset{} = Vehicleees.change_vehicleee(vehicleee)
    end
  end
end
