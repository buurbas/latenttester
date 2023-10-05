defmodule Latentester do
  @moduledoc """
  Documentation for `Latentester`.
  """
  require Logger

  @doc """
  Run tests against

  ## Examples

  ### Run 100 tests
      iex> Latentester.run_tests(100)
      :ok

  ### Run 1000 tests
      iex> Latentester.run_tests(1000)

  """
  def run_tests(amount \\ 10) do
    Logger.info("Testing is started")
    basic_auth = Application.get_env(:latentester, :basic_auth)
    endpoint = Application.get_env(:latentester, :endpoint)
    r = Enum.map(:lists.seq(0, amount), fn(_) ->
      start = :os.system_time(:millisecond)
      HTTPoison.post(endpoint,
        "grant_type=client_credentials",
        [{"Content-Type", "application/x-www-form-urlencoded"},
         {"Authorization", "Basic " <> basic_auth}])
      :os.system_time(:millisecond)-start
    end)

    Logger.info("Testing done. Presenting results.")
    Logger.info("=================================")
    Logger.info("Fastest request took #{Enum.min(r)}ms to complete")
    Logger.info("Slowest request took #{Enum.max(r)}ms to complete")
    Logger.info("#{amount} request was totally sent against server")
    :ok
  end
end
