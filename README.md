# context_fp_gleam

[![Package Version](https://img.shields.io/hexpm/v/context_fp_gleam)](https://hex.pm/packages/context_fp_gleam)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/context_fp_gleam/)

![logo](logo.png)

Functional programming context for Gleam

```sh
gleam add context_fp_gleam
```

## Features

- 💉 Dependency injection without magic, only functions
- 🤌 Functions cached during workflow, no excess cost of CPU
- 💡 Smart type inference via generics
- ♻️ Unit tests friendly, feel free to pass mocked function in the Context

## How to

#### Basic example

```gleam
import context_fp_gleam.{cfp2}

let positive_numbers = fn(ns, _c) { list.filter(ns, fn(n) { n > 0 }) }
let numbers_prefix = fn(_ns, _c) { "Here is numbers: " }
let positive_numbers_as_string =
  cfp2(positive_numbers, numbers_prefix, fn(ns, prefix) {
    prefix
    <> list.map(ns, fn(n) { int.to_string(n) })
    |> string.join(",")
  })

// Here is numbers: 7,4
positive_numbers_as_string([-1, -5, 7, 0, 4], dict.new())
```

#### Calculations cached example

```gleam
import context_fp_gleam.{cfp1,cfp2}

let positive_numbers = fn(ns, _c) {
  // will be called only once
  list.filter(ns, fn(n) { n > 0 })
}
let positive_numbers_length =
  cfp1(positive_numbers, fn(ns) { list.length(ns) })
let positive_numbers_as_string =
  cfp2(positive_numbers, positive_numbers_length, fn(ns, length) {
    list.map(ns, fn(n) { int.to_string(n) })
    |> string.join(",")
    <> "; length - "
    <> int.to_string(length)
  })

// 7,4; length - 2
positive_numbers_as_string([-1, -5, 7, 0, 4], dict.new())
```

#### Dependency injection example

```gleam
import context_fp_gleam.{cfp1}

let fetch_user_from_db = fn() { User("Petya") }
let fetch_user = fn(fetch_user_mock, _c) {
  option.unwrap(fetch_user_mock, fetch_user_from_db)()
}
let hello_world_user =
  cfp1(fetch_user, fn(user) { "Hello world, " <> user.name })

// Hello world, Vasya
hello_world_user(option.Some(fn() { User("Vasya") }), dict.new())
```

## See also

- [context-fp](https://github.com/darky/context-fp) - Functional programming context for TypeScript
- [context-fp-go](https://github.com/darky/context-fp-go) - Functional programming context for Golang
