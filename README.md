# Identicon

Generate a unique, symmetric 5×5 “identicon” PNG from any input string, using Elixir and Erlang’s EGD library.

## About

Identicon turns any text—like a name or email—into a small, colorful 5×5 image. It first hashes the text with MD5, then uses that hash to build a symmetrical grid, filling in even‑numbered squares and leaving the others blank. The end result is a unique, consistent icon you can use for avatars or identification—no image uploads needed.

## Prerequisites

- Elixir
- Erlang
- You can download from here as well: https://elixir-lang.org/install.html

## Installation

### From Hex

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `identicon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/identicon](https://hexdocs.pm/identicon).

### From Source

#### Clone this repository

- Open your terminal
- go to the directory that you want to clone this project
- Run the following command to clone this project

```
git clone https://github.com/your‑username/identicon.git
```

Replace **your-username** with your github username.

#### Install dependencies

go to the project's root directory

```
cd Identicon
```

fetch and compile dependencies

```
mix dept.get
mix dep.compile
```

#### Generate Identicon

Start an interactive Elixir shell

```
iex -S mix
```

Inside the IEX shell you can call the Identicon function with your own string

```
iex> Identicon.main("blue")
```

Your identicon will be generated based on your string and will be saved as a PNG file in the project's root directory.

You can also see some Identicon sample in your project root.

---

> > > > > > > 45f21a7 (Identicon project)
