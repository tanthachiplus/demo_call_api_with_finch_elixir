defmodule DemoCallApiWithFinchElixirWeb.Router do
  use DemoCallApiWithFinchElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DemoCallApiWithFinchElixirWeb do
    pipe_through :api
  end

  scope "/", DemoCallApiWithFinchElixirWeb do
    pipe_through :api
    get "/get", Api, :get
    post "/post", Api, :post
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
