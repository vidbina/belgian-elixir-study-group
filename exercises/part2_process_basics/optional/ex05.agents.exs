# GOAL: Managing state with Agents

# Elixir offers high-level constructs around processes and OTP
# to simplify common use cases.
# The Agents module allows to simply manage state without having
# to write a GenServer, read the documentation at:
# http://elixir-lang.org/docs/v1.1/elixir/Agent.html

# Let's write a simple key-balue store
# - The test case below describes the expected behaviour
# - Uncomment the tests step by step as you progress


defmodule KeyValueStore do
  def start_link do
  end

  def set(key, value) do
  end

  def get(key) do
  end

  def key?(key) do
  end

  def keys() do
  end

  def delete(key) do
  end
end

ExUnit.start

defmodule KeyValueStoreTest do
  use ExUnit.Case

  setup do
    {:ok, %{pid: KeyValueStore.start_link}}
  end

  # Step 1
  test "set" do
    assert :ok == KeyValueStore.set(:foo, 1)
  end

  # Step 2
  test "get" do
    KeyValueStore.set(:foo, 1)
    KeyValueStore.set(:bar, 2)

    assert {:ok, 1} == KeyValueStore.get(:foo)
    assert {:ok, 2} == KeyValueStore.get(:bar)
    assert :error == KeyValueStore.get(:baz)
  end

  # Step 3
  # test "key?" do
  #   refute KeyValueStore.key?(:foo)

  #   KeyValueStore.set(:foo, 1)
  #   assert KeyValueStore.key?(:foo)
  # end

  # Step 4
  # test "keys" do
  #   assert [] == KeyValueStore.keys

  #   KeyValueStore.set(:foo, 1)
  #   assert [:foo] == KeyValueStore.keys

  #   KeyValueStore.set(:zzz, 2)
  #   KeyValueStore.set(:bar, 3)
  #   assert [:bar, :foo, :zzz] == KeyValueStore.keys
  # end

  # Step 5
  # test "delete" do
  #   assert :error == KeyValueStore.delete(:foo)
  #   KeyValueStore.set(:foo, 1)
  #   assert {:ok, 1} == KeyValueStore.delete(:foo)
  #   refute KeyValueStore.key?(:foo)
  # end

end
