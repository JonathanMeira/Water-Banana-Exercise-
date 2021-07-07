defmodule Wabanex.UserTest do

  use Wabanex.DataCase, async: true

  alias Wabanex.User


  #Testing changeset parameters from Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Jonathan", email: "jonathan@gmail.com", password: "123456" }

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "Jonathan", email: "jonathan@gmail.com", password: "123456" },
        errors: []} = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "J", email: "jonathan@gmail.com"}
      # Note, the name has minus than 2 characters, and there isn't the password field

      response = User.changeset(params)

      expected_response = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}


      assert errors_on(response) == expected_response
    end



  end
end
