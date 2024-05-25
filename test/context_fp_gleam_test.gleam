import context_fp_gleam.{cfp1, cfp2, cfp3, cfp4, cfp5, cfp6, cfp7, cfp8, cfp9}
import gleam/dict
import gleam/dynamic
import gleam/int
import gleam/io
import gleam/list
import gleam/option
import gleam/string
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn cfp_basic_test() {
  let positive_numbers = fn(ns, _c) { list.filter(ns, fn(n) { n > 0 }) }
  let numbers_prefix = fn(_ns, _c) { "Here is numbers: " }
  let positive_numbers_as_string = {
    use ns, prefix, _c <- cfp2(positive_numbers, numbers_prefix)
    prefix
    <> list.map(ns, fn(n) { int.to_string(n) })
    |> string.join(",")
  }
  positive_numbers_as_string([-1, -5, 7, 0, 4], dict.new())
  |> should.equal("Here is numbers: 7,4")
}

type User {
  User(id: Int, name: String, age: Int)
}

pub fn cpf_di_test() {
  let fetch_user_from_db = fn() { User(1, "Petya", 30) }
  let fetch_user = fn(fetch_user_mock, _c) {
    option.unwrap(fetch_user_mock, fetch_user_from_db)()
  }
  let hello_world_user = {
    use user, _c <- cfp1(fetch_user)
    "Hello world, " <> user.name
  }
  hello_world_user(option.Some(fn() { User(2, "Vasya", 30) }), dict.new())
  |> should.equal("Hello world, Vasya")
}

type Ctx {
  Ctx1(n: Int)
  Ctx2(n: Int)
  Ctx3(n: Int)
  Ctx4(n: Int)
  Ctx5(n: Int)
  Ctx6(n: Int)
  Ctx7(n: Int)
  Ctx8(n: Int)
  Ctx9(n: Int)
}

pub fn cfp_generics1_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fun =
    cfp1(fn1, fn(c1, _c) {
      case c1 {
        Ctx1(n) -> 1 + n
        _ -> 0
      }
    })
  should.equal(fun(1, dict.new()), 2)
}

pub fn cfp_generics2_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fn2 = fn(n, _c) { Ctx2(n) }
  let fun =
    cfp2(fn1, fn2, fn(c1, c2, _c) {
      case c1, c2 {
        Ctx1(n1), Ctx2(n2) -> 1 + n1 + n2
        _, _ -> 0
      }
    })
  should.equal(fun(1, dict.new()), 3)
}

pub fn cfp_generics3_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fn2 = fn(n, _c) { Ctx2(n) }
  let fn3 = fn(n, _c) { Ctx3(n) }
  let fun =
    cfp3(fn1, fn2, fn3, fn(c1, c2, c3, _c) {
      case c1, c2, c3 {
        Ctx1(n1), Ctx2(n2), Ctx3(n3) -> 1 + n1 + n2 + n3
        _, _, _ -> 0
      }
    })
  should.equal(fun(1, dict.new()), 4)
}

pub fn cfp_generics4_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fn2 = fn(n, _c) { Ctx2(n) }
  let fn3 = fn(n, _c) { Ctx3(n) }
  let fn4 = fn(n, _c) { Ctx4(n) }
  let fun =
    cfp4(fn1, fn2, fn3, fn4, fn(c1, c2, c3, c4, _c) {
      case c1, c2, c3, c4 {
        Ctx1(n1), Ctx2(n2), Ctx3(n3), Ctx4(n4) -> 1 + n1 + n2 + n3 + n4
        _, _, _, _ -> 0
      }
    })
  should.equal(fun(1, dict.new()), 5)
}

pub fn cfp_generics5_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fn2 = fn(n, _c) { Ctx2(n) }
  let fn3 = fn(n, _c) { Ctx3(n) }
  let fn4 = fn(n, _c) { Ctx4(n) }
  let fn5 = fn(n, _c) { Ctx5(n) }
  let fun =
    cfp5(fn1, fn2, fn3, fn4, fn5, fn(c1, c2, c3, c4, c5, _c) {
      case c1, c2, c3, c4, c5 {
        Ctx1(n1), Ctx2(n2), Ctx3(n3), Ctx4(n4), Ctx5(n5) ->
          1 + n1 + n2 + n3 + n4 + n5
        _, _, _, _, _ -> 0
      }
    })
  should.equal(fun(1, dict.new()), 6)
}

pub fn cfp_generics6_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fn2 = fn(n, _c) { Ctx2(n) }
  let fn3 = fn(n, _c) { Ctx3(n) }
  let fn4 = fn(n, _c) { Ctx4(n) }
  let fn5 = fn(n, _c) { Ctx5(n) }
  let fn6 = fn(n, _c) { Ctx6(n) }
  let fun =
    cfp6(fn1, fn2, fn3, fn4, fn5, fn6, fn(c1, c2, c3, c4, c5, c6, _c) {
      case c1, c2, c3, c4, c5, c6 {
        Ctx1(n1), Ctx2(n2), Ctx3(n3), Ctx4(n4), Ctx5(n5), Ctx6(n6) ->
          1 + n1 + n2 + n3 + n4 + n5 + n6
        _, _, _, _, _, _ -> 0
      }
    })
  should.equal(fun(1, dict.new()), 7)
}

pub fn cfp_generics7_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fn2 = fn(n, _c) { Ctx2(n) }
  let fn3 = fn(n, _c) { Ctx3(n) }
  let fn4 = fn(n, _c) { Ctx4(n) }
  let fn5 = fn(n, _c) { Ctx5(n) }
  let fn6 = fn(n, _c) { Ctx6(n) }
  let fn7 = fn(n, _c) { Ctx7(n) }
  let fun =
    cfp7(fn1, fn2, fn3, fn4, fn5, fn6, fn7, fn(c1, c2, c3, c4, c5, c6, c7, _c) {
      case c1, c2, c3, c4, c5, c6, c7 {
        Ctx1(n1), Ctx2(n2), Ctx3(n3), Ctx4(n4), Ctx5(n5), Ctx6(n6), Ctx7(n7) ->
          1 + n1 + n2 + n3 + n4 + n5 + n6 + n7
        _, _, _, _, _, _, _ -> 0
      }
    })
  should.equal(fun(1, dict.new()), 8)
}

pub fn cfp_generics8_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fn2 = fn(n, _c) { Ctx2(n) }
  let fn3 = fn(n, _c) { Ctx3(n) }
  let fn4 = fn(n, _c) { Ctx4(n) }
  let fn5 = fn(n, _c) { Ctx5(n) }
  let fn6 = fn(n, _c) { Ctx6(n) }
  let fn7 = fn(n, _c) { Ctx7(n) }
  let fn8 = fn(n, _c) { Ctx8(n) }
  let fun =
    cfp8(
      fn1,
      fn2,
      fn3,
      fn4,
      fn5,
      fn6,
      fn7,
      fn8,
      fn(c1, c2, c3, c4, c5, c6, c7, c8, _c) {
        case c1, c2, c3, c4, c5, c6, c7, c8 {
          Ctx1(n1),
            Ctx2(n2),
            Ctx3(n3),
            Ctx4(n4),
            Ctx5(n5),
            Ctx6(n6),
            Ctx7(n7),
            Ctx8(n8)
          -> 1 + n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8
          _, _, _, _, _, _, _, _ -> 0
        }
      },
    )
  should.equal(fun(1, dict.new()), 9)
}

pub fn cfp_generics9_test() {
  let fn1 = fn(n, _c) { Ctx1(n) }
  let fn2 = fn(n, _c) { Ctx2(n) }
  let fn3 = fn(n, _c) { Ctx3(n) }
  let fn4 = fn(n, _c) { Ctx4(n) }
  let fn5 = fn(n, _c) { Ctx5(n) }
  let fn6 = fn(n, _c) { Ctx6(n) }
  let fn7 = fn(n, _c) { Ctx7(n) }
  let fn8 = fn(n, _c) { Ctx8(n) }
  let fn9 = fn(n, _c) { Ctx9(n) }
  let fun =
    cfp9(
      fn1,
      fn2,
      fn3,
      fn4,
      fn5,
      fn6,
      fn7,
      fn8,
      fn9,
      fn(c1, c2, c3, c4, c5, c6, c7, c8, c9, _c) {
        case c1, c2, c3, c4, c5, c6, c7, c8, c9 {
          Ctx1(n1),
            Ctx2(n2),
            Ctx3(n3),
            Ctx4(n4),
            Ctx5(n5),
            Ctx6(n6),
            Ctx7(n7),
            Ctx8(n8),
            Ctx9(n9)
          -> 1 + n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + n9
          _, _, _, _, _, _, _, _, _ -> 0
        }
      },
    )
  should.equal(fun(1, dict.new()), 10)
}

pub fn cpf_cache_test() {
  let positive_numbers = fn(ns, _c) {
    io.debug("cache call")
    list.filter(ns, fn(n) { n > 0 })
  }
  let positive_numbers_length = {
    use ns, _c <- cfp1(positive_numbers)
    list.length(ns)
  }
  let positive_numbers_as_string = {
    use ns, length, _c <- cfp2(positive_numbers, positive_numbers_length)
    list.map(ns, fn(n) { int.to_string(n) })
    |> string.join(",")
    <> "; length - "
    <> int.to_string(length)
  }
  positive_numbers_as_string([-1, -5, 7, 0, 4], dict.new())
  |> should.equal("7,4; length - 2")
}

pub fn transaction_test() {
  let fetch_user_from_db = fn(id, _c) {
    case id {
      1 -> option.Some(User(1, "Petya", 30))
      _ -> option.None
    }
  }
  let user_birthday = {
    use user, _c <- cfp1(fetch_user_from_db)
    option.map(user, fn(user) { User(..user, age: user.age + 1) })
  }
  let save_to_db = {
    use _, cache <- cfp1(user_birthday)
    let db_entities = dict.values(cache)
    let queries =
      list.flat_map(db_entities, fn(user) {
        case dynamic.unsafe_coerce(user) {
          option.Some(User(_, _, _) as user) -> [
            #("update users set age = $1 where id = $2; ", [user.age, user.id]),
          ]
          _ -> []
        }
      })
    let transaction_sql = case list.length(queries) > 0 {
      True ->
        list.fold(queries, "begin; ", fn(acc, query) { acc <> query.0 })
        <> "commit;"
      False -> ""
    }
    transaction_sql
    |> should.equal("begin; update users set age = $1 where id = $2; commit;")
    let assert Ok(query) = list.first(queries)
    query.1
    |> should.equal([31, 1])
  }
  save_to_db(1, dict.new())
}
