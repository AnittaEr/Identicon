defmodule Identicon do

  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  def save_image(image, input) do
    File.write("#{input}.png", image)
  end
  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end
    :egd.render(image)
  end

  def build_pixel_map(%Identicon.Image{grid: grid}= image) do
    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50
      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}
      {top_left, bottom_right}
    end

    %Identicon.Image{image | pixel_map: pixel_map}

  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code,2) == 0
    end


    %Identicon.Image{image | grid: grid}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
    |> Enum.chunk_every(3, 3, :discard)
    |> Enum.map(&mirror_row/1)
    |> Enum.filter(&(&1 != []))
    |> List.flatten
    |> Enum.with_index
    # Enum.chunk_every(hex,3)

    %Identicon.Image{image | grid: grid}
  end

  @spec mirror_row([...]) :: [...]
  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
    # [145,46,200]
    # [145,46,200,46,145]
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r,g,b}}

  end

  # pick_color: function(image){
  #   image.color ={
  #     r: image.hex[0],
  #     g: image.hex[1],
  #     b: image.hex[2]
  #   }
  #   return image
  # }

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
    # this is exactly like
    #hash = :crypto.hash(:md5, input)
    #:binary.bin_to_list(hash)
  end
end
