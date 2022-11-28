defmodule Chat.ChatStoreTest do
  use Chat.DataCase

  alias Chat.ChatStore

  describe "messages" do
    alias Chat.ChatStore.Message

    import Chat.ChatStoreFixtures

    @invalid_attrs %{body: nil, name: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert ChatStore.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert ChatStore.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{body: "some body", name: "some name"}

      assert {:ok, %Message{} = message} = ChatStore.create_message(valid_attrs)
      assert message.body == "some body"
      assert message.name == "some name"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ChatStore.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{body: "some updated body", name: "some updated name"}

      assert {:ok, %Message{} = message} = ChatStore.update_message(message, update_attrs)
      assert message.body == "some updated body"
      assert message.name == "some updated name"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = ChatStore.update_message(message, @invalid_attrs)
      assert message == ChatStore.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = ChatStore.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> ChatStore.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = ChatStore.change_message(message)
    end
  end
end
