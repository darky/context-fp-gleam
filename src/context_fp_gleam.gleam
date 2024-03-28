pub fn cfp1(dep1, fun) {
  fn(ctx) { fun(dep1(ctx)) }
}

pub fn cfp2(dep1, dep2, fun) {
  fn(ctx) { fun(dep1(ctx), dep2(ctx)) }
}

pub fn cfp3(dep1, dep2, dep3, fun) {
  fn(ctx) { fun(dep1(ctx), dep2(ctx), dep3(ctx)) }
}

pub fn cfp4(dep1, dep2, dep3, dep4, fun) {
  fn(ctx) { fun(dep1(ctx), dep2(ctx), dep3(ctx), dep4(ctx)) }
}

pub fn cfp5(dep1, dep2, dep3, dep4, dep5, fun) {
  fn(ctx) { fun(dep1(ctx), dep2(ctx), dep3(ctx), dep4(ctx), dep5(ctx)) }
}

pub fn cfp6(dep1, dep2, dep3, dep4, dep5, dep6, fun) {
  fn(ctx) {
    fun(dep1(ctx), dep2(ctx), dep3(ctx), dep4(ctx), dep5(ctx), dep6(ctx))
  }
}

pub fn cfp7(dep1, dep2, dep3, dep4, dep5, dep6, dep7, fun) {
  fn(ctx) {
    fun(
      dep1(ctx),
      dep2(ctx),
      dep3(ctx),
      dep4(ctx),
      dep5(ctx),
      dep6(ctx),
      dep7(ctx),
    )
  }
}

pub fn cfp8(dep1, dep2, dep3, dep4, dep5, dep6, dep7, dep8, fun) {
  fn(ctx) {
    fun(
      dep1(ctx),
      dep2(ctx),
      dep3(ctx),
      dep4(ctx),
      dep5(ctx),
      dep6(ctx),
      dep7(ctx),
      dep8(ctx),
    )
  }
}

pub fn cfp9(dep1, dep2, dep3, dep4, dep5, dep6, dep7, dep8, dep9, fun) {
  fn(ctx) {
    fun(
      dep1(ctx),
      dep2(ctx),
      dep3(ctx),
      dep4(ctx),
      dep5(ctx),
      dep6(ctx),
      dep7(ctx),
      dep8(ctx),
      dep9(ctx),
    )
  }
}
