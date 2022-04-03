defmodule SocketControllerTest do
  use ExUnit.Case
  doctest SocketController

  test "socket" do
    {:ok, socket} = SocketController.connect('127.0.0.1', 4011)
    assert {:ok, "WorldServer3D Version 1.0. Welcome to the game!!!\r\n\n"} ==  SocketController.read_line(socket)
    require IEx; IEx.pry
  end

  test "greets the world" do
    assert SocketController.hello() == :world
  end
end
