defmodule ReportsGenerator do
  def build(filename) do
    file =  File.read("reports/#{filename}")
  end
end
