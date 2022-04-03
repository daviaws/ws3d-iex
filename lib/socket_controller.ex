defmodule SocketController do
  require Logger

  def connect(host, port) do
    :gen_tcp.connect(host, port, [:binary, active: false, reuseaddr: true, reuseaddr: true])
  end

  @spec write_line(
          port | {:"$inet", atom, any},
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | byte,
              binary | []
            )
        ) :: :ok | {:error, atom}
  def write_line(socket, line) do
    :gen_tcp.send(socket, line)
  end

  def read_line(socket) do
    socket
    |> :gen_tcp.recv(0, 100)
    |> log_response()
  end

  def log_response({:ok, msg} = response), do: Logger.info("Incoming: #{msg}") && response
  def log_response({:error, msg} = response), do: Logger.error("Incoming fail: #{msg}") && response

  def hello do
    :world
  end
end
