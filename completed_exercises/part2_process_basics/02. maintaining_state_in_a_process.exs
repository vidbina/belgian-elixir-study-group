#
# counter process example
#
# There's nothing for you to code here. Read and understand how you
# can use a process for keeping a state.
#
# You can think of this process as a mutable object in a OOP language:
# you can send messages to it and receive responses.

defmodule Counter do

  @doc "Creates a new counter, initialized to 0"
  def start do
    spawn_link(fn -> loop(0) end)
  end

  @doc "Increments the given counter by 1"
  def inc(counter) do
    send counter, {self, :inc}
  end

  @doc "Returns the current value of the given counter"
  def value(counter) do
    send counter, {self, :val}
    get_value counter
  end

  defp get_value(counter) do
    receive do
      {^counter, :ok, val} ->
        val
    end
  end

  defp loop(counter) do
    receive do
      {_, :inc} ->
        loop(counter + 1)
      {sender, :val} ->
        send sender, {self, :ok, counter}
        loop(counter)
    end
  end

end

ExUnit.start

defmodule CounterTest do
  use ExUnit.Case

  test "counter starts at 0" do
    pid = Counter.start
    assert 0 == Counter.value(pid)
  end

  test "incrementing" do
    pid = Counter.start
    Counter.inc(pid)
    Counter.inc(pid)
    Counter.inc(pid)
    assert 3 == Counter.value(pid)
  end

  test "multiple counters" do
    pid1 = Counter.start
    pid2 = Counter.start
    pid3 = Counter.start
    Counter.inc(pid1)
    Counter.inc(pid2)
    Counter.inc(pid2)
    assert 1 == Counter.value(pid1)
    assert 2 == Counter.value(pid2)
    assert 0 == Counter.value(pid3)
  end
end
