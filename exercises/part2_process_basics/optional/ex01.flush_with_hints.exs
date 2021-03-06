# GOAL: understanding hwo the mailbox works and receiving messages

# Write a function which reads the mailbox of the current process
# and returns a list with these  messages

defmodule Mailbox do

  def flush() do
    collect_messages([])
  end

  defp collect_messages(messages) do
  end

end


ExUnit.start

defmodule MailboxTest do
   use ExUnit.Case

  test "flush returns the messages in order" do
    send self, :a
    send self, {:b, :c}
    send self, [:d]
    assert [:a, {:b, :c}, [:d]] == Mailbox.flush()
  end

  # Uncomment this test case when the first test passes
  # test "flush returns an empty list when the mailbox is empty" do
  #   assert [] == Mailbox.flush()
  # end

end
