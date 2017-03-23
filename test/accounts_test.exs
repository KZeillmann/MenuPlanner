defmodule MenuPlanner.AccountsTest do
  use MenuPlanner.DataCase

  alias MenuPlanner.Accounts
  alias MenuPlanner.Accounts.User

  @create_attrs %{email: "some email", name: "some name", password: "some password"}
  @invalid_attrs %{email: nil, name: nil, password_hash: nil}

  def fixture(:user, attrs \\ @create_attrs) do
    {:ok, user} = Accounts.create_user(attrs)
    %{ user | password: nil }
  end

  test "list_users/1 returns all users" do
    user = fixture(:user)
    assert Accounts.list_users() == [user]
  end

  test "get_user! returns the user with given id" do
    user = fixture(:user)
    assert Accounts.get_user!(user.id) == user
  end

  test "create_user/1 with valid data creates a user" do
    assert {:ok, %User{} = user} = Accounts.create_user(@create_attrs)
    assert user.email == "some email"
    assert user.name == "some name"
  end

  test "create_user/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
  end

  test "change_user/1 returns a user changeset" do
    user = fixture(:user)
    assert %Ecto.Changeset{} = Accounts.change_user(user)
  end
end
