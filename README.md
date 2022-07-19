## run 
  iex -S mix phx.server


## cài đặt
  # add deps in mix.exs
  # add finch in application.ex (xem thêm trong file)

  == > {Finch, name: MyFinch}

## cú pháp finch
  Finch.build(__menthod__, __url__, __header__, __jason_encode_for_body__) 
  |> Finch.request(__MODULE_da_dat_ten_trong_appication.ex__)

## get
  header = 
    [
      {"content-type", "application/json"}
    ]

  # bước 1 encode params map
  params = %{a: 1, b: 2}
  query = URI.encode_query(params)
  # bước 2 gọi finch

  Finch.build(:get, "http://localhost:4000/get?{query}", header) |> Finch.request(MyFinch)


## post (hoặc các dạng đặt params in body)
  header = 
    [
      {"content-type", "application/json"}
    ]

  # bước 1 encode params map TO JSON body
  params = %{a: 1, b: 2}
  body = Jason.encode!(params)
  # bước 2 gọi finch
  Finch.build(:post, "http://localhost:4000/post", header, body) |> Finch.request(MyFinch)

## call example
Example.get()
Example.post()