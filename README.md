# Latentester

Latency tester towards a specific endpoint that is giving a OAuth2 token.

## Installation

Install Elixir (https://elixir-lang.org/blog/categories.html#Releases).

Edit the `mix.exs`file. There's a section under `application` -> `env` that needs to be edited before running the application.

**basic_auth** - This is where you put the basic_auth token that is used for the exchange
**endpoint** - Endpoint that is used for the exchange (ex. http://my-site/oauth2/token)

## Running the application

After finishing the *Installation*-step you need to start elixir with the application:

```
$ iex -S mix

Erlang/OTP 25 [erts-13.1.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns]

Compiling 1 file (.ex)
Generated latentester app
Interactive Elixir (1.14.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>

```

Type into the console:
`Latentester.run_tests(100)` - This will send 100 requests to the endpoint and measuring the round-trip time. The result of this will show the minimum RTT and max RTT in milliseconds;

```16:11:33.226 [info] Testing is started
16:22:46.953 [info] Testing done. Presenting results.
16:22:46.953 [info] =================================
16:22:46.953 [info] Fastest request took 37ms to complete
16:22:46.953 [info] Slowest request took 853ms to complete
16:22:46.953 [info] 12103 request was totally sent against server```
