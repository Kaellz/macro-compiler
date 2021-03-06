defmodule MacroCompiler.IncrementExpression do
  use Combine
  use Combine.Helpers
  alias MacroCompiler.ScalarVariable

  @enforce_keys [:scalar_variable]
  defstruct [:scalar_variable]

  def parser() do
    map(
      sequence([
        ScalarVariable.parser(),

        ignore(string("++")),

        skip(newline())
      ]),
      fn [scalar_variable] -> %MacroCompiler.IncrementExpression{scalar_variable: scalar_variable} end
    )
  end
end
