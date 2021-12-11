defmodule ReportsGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "it should be able to build the report" do
      file_name = "report_test.csv"

      response = ReportsGenerator.build(file_name)

      expected_value = %{
        "foods" => %{
          "açaí" => 1,
          "churrasco" => 2,
          "esfirra" => 3,
          "hambúrguer" => 2,
          "pastel" => 0,
          "pizza" => 2,
          "prato_feito" => 0,
          "sushi" => 0
        },
        "users" => %{
          "1" => 48,
          "10" => 36,
          "11" => 0,
          "12" => 0,
          "13" => 0,
          "14" => 0,
          "15" => 0,
          "16" => 0,
          "17" => 0,
          "18" => 0,
          "19" => 0,
          "2" => 45,
          "20" => 0,
          "21" => 0,
          "22" => 0,
          "23" => 0,
          "24" => 0,
          "25" => 0,
          "26" => 0,
          "27" => 0,
          "28" => 0,
          "29" => 0,
          "3" => 31,
          "30" => 0,
          "4" => 42,
          "5" => 49,
          "6" => 18,
          "7" => 27,
          "8" => 25,
          "9" => 24
        }
      }

      assert response == expected_value
    end
  end

  describe "fetch_higher_cost/2" do
    test "it should be able to return the user that spent the most when the option is 'users'" do
      file_name = "report_test.csv"
      option = "users"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost(option)

      expected_value = {:ok, {"5", 49}}

      assert response == expected_value
    end

    test "it should be able to return the food with the most frequency when the option is 'foods'" do
      file_name = "report_test.csv"
      option = "foods"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost(option)

      expected_value = {:ok, {"esfirra", 3}}

      assert response == expected_value
    end

    test "it should not be able to return higher cost when the option is invalid" do
      file_name = "report_test.csv"
      option = "banana"

      response =
        file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost(option)

      expected_value = {:error, "Invalid option!"}

      assert response == expected_value
    end
  end
end
