import gleam/list
import gleam/dict
import gleam/dynamic

type Cache =
  dict.Dict(dynamic.Dynamic, dynamic.Dynamic)

pub fn cfp1(dep1: fn(ctx, Cache) -> a, fun: fn(a, Cache) -> resp) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) = cfp_base([dynamic.from(dep1)], ctx, cache)
    let assert Ok(val1) = list.at(resp, 0)
    fun(dynamic.unsafe_coerce(val1), cache)
  }
}

pub fn cfp2(
  dep1: fn(ctx, Cache) -> a,
  dep2: fn(ctx, Cache) -> b,
  fun: fn(a, b, Cache) -> resp,
) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) =
      cfp_base([dynamic.from(dep1), dynamic.from(dep2)], ctx, cache)
    let assert Ok(val1) = list.at(resp, 0)
    let assert Ok(val2) = list.at(resp, 1)
    fun(dynamic.unsafe_coerce(val1), dynamic.unsafe_coerce(val2), cache)
  }
}

pub fn cfp3(
  dep1: fn(ctx, Cache) -> a,
  dep2: fn(ctx, Cache) -> b,
  dep3: fn(ctx, Cache) -> c,
  fun: fn(a, b, c, Cache) -> resp,
) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) =
      cfp_base(
        [dynamic.from(dep1), dynamic.from(dep2), dynamic.from(dep3)],
        ctx,
        cache,
      )
    let assert Ok(val1) = list.at(resp, 0)
    let assert Ok(val2) = list.at(resp, 1)
    let assert Ok(val3) = list.at(resp, 2)
    fun(
      dynamic.unsafe_coerce(val1),
      dynamic.unsafe_coerce(val2),
      dynamic.unsafe_coerce(val3),
      cache,
    )
  }
}

pub fn cfp4(
  dep1: fn(ctx, Cache) -> a,
  dep2: fn(ctx, Cache) -> b,
  dep3: fn(ctx, Cache) -> c,
  dep4: fn(ctx, Cache) -> d,
  fun: fn(a, b, c, d, Cache) -> resp,
) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) =
      cfp_base(
        [
          dynamic.from(dep1),
          dynamic.from(dep2),
          dynamic.from(dep3),
          dynamic.from(dep4),
        ],
        ctx,
        cache,
      )
    let assert Ok(val1) = list.at(resp, 0)
    let assert Ok(val2) = list.at(resp, 1)
    let assert Ok(val3) = list.at(resp, 2)
    let assert Ok(val4) = list.at(resp, 3)
    fun(
      dynamic.unsafe_coerce(val1),
      dynamic.unsafe_coerce(val2),
      dynamic.unsafe_coerce(val3),
      dynamic.unsafe_coerce(val4),
      cache,
    )
  }
}

pub fn cfp5(
  dep1: fn(ctx, Cache) -> a,
  dep2: fn(ctx, Cache) -> b,
  dep3: fn(ctx, Cache) -> c,
  dep4: fn(ctx, Cache) -> d,
  dep5: fn(ctx, Cache) -> e,
  fun: fn(a, b, c, d, e, Cache) -> resp,
) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) =
      cfp_base(
        [
          dynamic.from(dep1),
          dynamic.from(dep2),
          dynamic.from(dep3),
          dynamic.from(dep4),
          dynamic.from(dep5),
        ],
        ctx,
        cache,
      )
    let assert Ok(val1) = list.at(resp, 0)
    let assert Ok(val2) = list.at(resp, 1)
    let assert Ok(val3) = list.at(resp, 2)
    let assert Ok(val4) = list.at(resp, 3)
    let assert Ok(val5) = list.at(resp, 4)
    fun(
      dynamic.unsafe_coerce(val1),
      dynamic.unsafe_coerce(val2),
      dynamic.unsafe_coerce(val3),
      dynamic.unsafe_coerce(val4),
      dynamic.unsafe_coerce(val5),
      cache,
    )
  }
}

pub fn cfp6(
  dep1: fn(ctx, Cache) -> a,
  dep2: fn(ctx, Cache) -> b,
  dep3: fn(ctx, Cache) -> c,
  dep4: fn(ctx, Cache) -> d,
  dep5: fn(ctx, Cache) -> e,
  dep6: fn(ctx, Cache) -> f,
  fun: fn(a, b, c, d, e, f, Cache) -> resp,
) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) =
      cfp_base(
        [
          dynamic.from(dep1),
          dynamic.from(dep2),
          dynamic.from(dep3),
          dynamic.from(dep4),
          dynamic.from(dep5),
          dynamic.from(dep6),
        ],
        ctx,
        cache,
      )
    let assert Ok(val1) = list.at(resp, 0)
    let assert Ok(val2) = list.at(resp, 1)
    let assert Ok(val3) = list.at(resp, 2)
    let assert Ok(val4) = list.at(resp, 3)
    let assert Ok(val5) = list.at(resp, 4)
    let assert Ok(val6) = list.at(resp, 5)
    fun(
      dynamic.unsafe_coerce(val1),
      dynamic.unsafe_coerce(val2),
      dynamic.unsafe_coerce(val3),
      dynamic.unsafe_coerce(val4),
      dynamic.unsafe_coerce(val5),
      dynamic.unsafe_coerce(val6),
      cache,
    )
  }
}

pub fn cfp7(
  dep1: fn(ctx, Cache) -> a,
  dep2: fn(ctx, Cache) -> b,
  dep3: fn(ctx, Cache) -> c,
  dep4: fn(ctx, Cache) -> d,
  dep5: fn(ctx, Cache) -> e,
  dep6: fn(ctx, Cache) -> f,
  dep7: fn(ctx, Cache) -> g,
  fun: fn(a, b, c, d, e, f, g, Cache) -> resp,
) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) =
      cfp_base(
        [
          dynamic.from(dep1),
          dynamic.from(dep2),
          dynamic.from(dep3),
          dynamic.from(dep4),
          dynamic.from(dep5),
          dynamic.from(dep6),
          dynamic.from(dep7),
        ],
        ctx,
        cache,
      )
    let assert Ok(val1) = list.at(resp, 0)
    let assert Ok(val2) = list.at(resp, 1)
    let assert Ok(val3) = list.at(resp, 2)
    let assert Ok(val4) = list.at(resp, 3)
    let assert Ok(val5) = list.at(resp, 4)
    let assert Ok(val6) = list.at(resp, 5)
    let assert Ok(val7) = list.at(resp, 6)
    fun(
      dynamic.unsafe_coerce(val1),
      dynamic.unsafe_coerce(val2),
      dynamic.unsafe_coerce(val3),
      dynamic.unsafe_coerce(val4),
      dynamic.unsafe_coerce(val5),
      dynamic.unsafe_coerce(val6),
      dynamic.unsafe_coerce(val7),
      cache,
    )
  }
}

pub fn cfp8(
  dep1: fn(ctx, Cache) -> a,
  dep2: fn(ctx, Cache) -> b,
  dep3: fn(ctx, Cache) -> c,
  dep4: fn(ctx, Cache) -> d,
  dep5: fn(ctx, Cache) -> e,
  dep6: fn(ctx, Cache) -> f,
  dep7: fn(ctx, Cache) -> g,
  dep8: fn(ctx, Cache) -> h,
  fun: fn(a, b, c, d, e, f, g, h, Cache) -> resp,
) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) =
      cfp_base(
        [
          dynamic.from(dep1),
          dynamic.from(dep2),
          dynamic.from(dep3),
          dynamic.from(dep4),
          dynamic.from(dep5),
          dynamic.from(dep6),
          dynamic.from(dep7),
          dynamic.from(dep8),
        ],
        ctx,
        cache,
      )
    let assert Ok(val1) = list.at(resp, 0)
    let assert Ok(val2) = list.at(resp, 1)
    let assert Ok(val3) = list.at(resp, 2)
    let assert Ok(val4) = list.at(resp, 3)
    let assert Ok(val5) = list.at(resp, 4)
    let assert Ok(val6) = list.at(resp, 5)
    let assert Ok(val7) = list.at(resp, 6)
    let assert Ok(val8) = list.at(resp, 7)
    fun(
      dynamic.unsafe_coerce(val1),
      dynamic.unsafe_coerce(val2),
      dynamic.unsafe_coerce(val3),
      dynamic.unsafe_coerce(val4),
      dynamic.unsafe_coerce(val5),
      dynamic.unsafe_coerce(val6),
      dynamic.unsafe_coerce(val7),
      dynamic.unsafe_coerce(val8),
      cache,
    )
  }
}

pub fn cfp9(
  dep1: fn(ctx, Cache) -> a,
  dep2: fn(ctx, Cache) -> b,
  dep3: fn(ctx, Cache) -> c,
  dep4: fn(ctx, Cache) -> d,
  dep5: fn(ctx, Cache) -> e,
  dep6: fn(ctx, Cache) -> f,
  dep7: fn(ctx, Cache) -> g,
  dep8: fn(ctx, Cache) -> h,
  dep9: fn(ctx, Cache) -> i,
  fun: fn(a, b, c, d, e, f, g, h, i, Cache) -> resp,
) {
  fn(ctx: ctx, cache: Cache) {
    let #(resp, cache) =
      cfp_base(
        [
          dynamic.from(dep1),
          dynamic.from(dep2),
          dynamic.from(dep3),
          dynamic.from(dep4),
          dynamic.from(dep5),
          dynamic.from(dep6),
          dynamic.from(dep7),
          dynamic.from(dep8),
          dynamic.from(dep9),
        ],
        ctx,
        cache,
      )
    let assert Ok(val1) = list.at(resp, 0)
    let assert Ok(val2) = list.at(resp, 1)
    let assert Ok(val3) = list.at(resp, 2)
    let assert Ok(val4) = list.at(resp, 3)
    let assert Ok(val5) = list.at(resp, 4)
    let assert Ok(val6) = list.at(resp, 5)
    let assert Ok(val7) = list.at(resp, 6)
    let assert Ok(val8) = list.at(resp, 7)
    let assert Ok(val9) = list.at(resp, 8)
    fun(
      dynamic.unsafe_coerce(val1),
      dynamic.unsafe_coerce(val2),
      dynamic.unsafe_coerce(val3),
      dynamic.unsafe_coerce(val4),
      dynamic.unsafe_coerce(val5),
      dynamic.unsafe_coerce(val6),
      dynamic.unsafe_coerce(val7),
      dynamic.unsafe_coerce(val8),
      dynamic.unsafe_coerce(val9),
      cache,
    )
  }
}

fn cfp_base(deps, ctx, cache: Cache) {
  list.fold(deps, #([], cache), fn(acc, dep) {
    let #(resp, cache) = acc
    let from_cache = dict.get(cache, dep)
    case from_cache {
      Ok(val) -> #(list.append(resp, [val]), cache)
      Error(Nil) -> {
        let val =
          dynamic.unsafe_coerce(dep)(ctx, cache)
          |> dynamic.from
        let cache = dict.insert(cache, dep, val)
        #(list.append(resp, [val]), cache)
      }
    }
  })
}
