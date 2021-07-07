defmodule Wabanex.IMC do

  # Creating functions to calculate an person IMC

  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_file()
  end

  # Handle file and transform into an Map, or return an error message

  defp handle_file({:ok, content}) do
    data =
      content
    |> String.split("\n")
    |> Enum.map(fn line -> parse_line(line) end)
    |> Enum.into(%{})
    {:ok, data}
  end

  defp handle_file({:error, _reason}) do
    {:error, "Error while operating file"}
  end

  # Parse each line for file mapping

  defp parse_line(line) do
    line
    |>String.split(",")
    |> Enum.map(&String.trim/1)
    |>List.update_at(1, &String.to_float/1)
    |>List.update_at(2, &String.to_float/1)
    |>calculate_imc()
  end

  def calculate_imc([name,height,weight]), do: {name, weight/(height * height)}


end
