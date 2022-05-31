defmodule PhoenixPracticeWeb.VehicleeeControllerTest do
  use PhoenixPracticeWeb.ConnCase

  import PhoenixPractice.VehicleeesFixtures

  alias PhoenixPractice.Vehicleees.Vehicleee

  @create_attrs %{
    status: "some status",
    vehicle_plate: "some vehicle_plate"
  }
  @update_attrs %{
    status: "some updated status",
    vehicle_plate: "some updated vehicle_plate"
  }
  @invalid_attrs %{status: nil, vehicle_plate: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vehicleees", %{conn: conn} do
      conn = get(conn, Routes.vehicleee_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vehicleee" do
    test "renders vehicleee when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vehicleee_path(conn, :create), vehicleee: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.vehicleee_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => "some status",
               "vehicle_plate" => "some vehicle_plate"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vehicleee_path(conn, :create), vehicleee: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vehicleee" do
    setup [:create_vehicleee]

    test "renders vehicleee when data is valid", %{conn: conn, vehicleee: %Vehicleee{id: id} = vehicleee} do
      conn = put(conn, Routes.vehicleee_path(conn, :update, vehicleee), vehicleee: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.vehicleee_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => "some updated status",
               "vehicle_plate" => "some updated vehicle_plate"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vehicleee: vehicleee} do
      conn = put(conn, Routes.vehicleee_path(conn, :update, vehicleee), vehicleee: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vehicleee" do
    setup [:create_vehicleee]

    test "deletes chosen vehicleee", %{conn: conn, vehicleee: vehicleee} do
      conn = delete(conn, Routes.vehicleee_path(conn, :delete, vehicleee))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.vehicleee_path(conn, :show, vehicleee))
      end
    end
  end

  defp create_vehicleee(_) do
    vehicleee = vehicleee_fixture()
    %{vehicleee: vehicleee}
  end
end
