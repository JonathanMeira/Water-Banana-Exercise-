defmodule Wabanex.IMCTest do

  use ExUnit.Case, async: true

  alias Wabanex.IMC

  # Create an describe name_function for every public method your code has
  # Testing business rules

  describe "calculate/1" do
    test "when the file exists, returns user's name plus his IMC" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok, %{"Jonathan" => 21.36686914318855, "Vale" => 24.772096710265558}}

      assert response == expected_response
    end

    test "when file doesn't exists, or wrong file name is given returns an error message" do
      params = %{"filename" => "not_students.csv"} # Note, the not_ will generate an error

      response = IMC.calculate(params)

      expected_response =
        {:error, "Error while operating file"}

      assert response == expected_response
    end






  end

end
