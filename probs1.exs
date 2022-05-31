name = IO.gets("name: ")
name = String.replace(name, "\n", "")
text = "Hello" <> name
IO.puts("Hello #{name}")