defmodule RpnCalculator do
  def split(stack, 0), do: { [], stack }

  def split(stack, n) do
    { front, back } = split tl(stack), n - 1
    { [ hd(stack) | front ] , back }
  end

  def do_operation(stack, arity, do: op) do
    { operands, stack } = split stack, arity
    [ apply(op, :lists.reverse(operands)) | stack ]
  end

  def evaluate_token(token, stack) do
    op = case token do
	   "+" -> &:erlang.+/2
	   "-" -> &:erlang.-/2
	   "*" -> &:erlang.*/2
	   "/" -> &:erlang.//2
	   _ -> fn ->
		 {f, ""} = Float.parse(token)
		 f
	       end
	 end
    do_operation stack, :erlang.fun_info(op)[:arity], do: op
  end

  def evaluate(expr, stack \\ [0]) do
    tokens = String.split expr
    List.foldl tokens, stack, &RpnCalculator.evaluate_token/2
  end
end
