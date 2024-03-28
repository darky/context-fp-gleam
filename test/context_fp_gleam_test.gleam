import gleeunit
import gleeunit/should
import gleam/list
import context_fp_gleam.{cfp2}
import gleam/string
import gleam/int

pub fn main() {
  gleeunit.main()
}

pub fn cfp_basic_test() {
  let positive_numbers = fn(ns) { list.filter(ns, fn(n) { n > 0 }) }
  let numbers_prefix = fn(_ns) { "Here is numbers: " }
  let positive_numbers_as_string =
    cfp2(positive_numbers, numbers_prefix, fn(ns, prefix) {
      prefix <> string.join(list.map(ns, fn(n) { int.to_string(n) }), ",")
    })
  should.equal(
    positive_numbers_as_string([-1, -5, 7, 0, 4]),
    "Here is numbers: 7,4",
  )
}
