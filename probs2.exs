list = IO.gets("list: ")
list = list |> String.replace("\n", "") |> String.split(" ", trim: true)

result = Enum.reduce(list, %{
    number: [],
    odd_number: [],
    even_number: [],
    text: []
}, fn value, acc ->
    case Integer.parse(value) do
        {int_value, ""} when rem(int_value, 2) == 1 ->
            Map.merge(acc, %{
                number: acc.number ++ [value],
                odd_number: acc.odd_number ++ [value]
            })
        {int_value, ""} when rem(int_value, 2) == 0 ->
            Map.merge(acc, %{
                number: acc.number ++ [value],
                even_number: acc.even_number ++ [value]
            })
        {_int_value, _} ->
            Map.put(acc, :text, acc.text ++ [value])

        :error -> 
            Map.put(acc, :text, acc.text ++ [value])
        end
    end
)

search = IO.gets("search: ")
find_element = Enum.find(list, fn x -> 
    {int_x, _} = Integer.parse(x)
    {int_search, _} = Integer.parse(search)
    int_x == int_search
end
)
IO.inspect result
IO.inspect find_element