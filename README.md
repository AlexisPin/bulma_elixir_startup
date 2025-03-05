# BulmaExample

To start your Phoenix server:

  * Create an `.env` file in the root of the project with the following content:

    ```env
    DATABASE_URL=postgres://postgres:postgres@localhost/bulma_example_dev
    ```
  * Run `task docker:up` to start the database
  * Run `task mix -- setup` to install and setup dependencies
  * Start Phoenix endpoint with `task api:dev`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
