defmodule DawdleDB.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: DawdleDB.Repo

  alias DawdleDB.{Data, EmbedData}
  alias Faker.Lorem

  def data_factory do
    %Data{
      text: Lorem.sentence(),
      single_embed: embed_data_factory(),
      multi_embed: [
        embed_data_factory(),
        embed_data_factory()
      ]
    }
  end

  def embed_data_factory do
    %EmbedData{
      key: Lorem.word(),
      value: Lorem.word(),
      inception: %EmbedData{
        key: Lorem.word(),
        value: Lorem.word()
      }
    }
  end
end
