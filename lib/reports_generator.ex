defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.read()\
    |> handle_file()
  end

  defp handle_file({:ok , file_content}), do: file_content
  defp handle_file({:error , _}), do: "Error while opening file!"

end
