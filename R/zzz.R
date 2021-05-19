.onLoad <- function(libname, pkgname){
  op <- options()
  op.episphereR <- list(
    episphereR.box_cid = "627lww8un9twnoa8f9rjvldf7kb56q1m",
    episphereR.box_cls = "gSKdYKLd65aQpZGrq9x4QVUNnn5C8qqm"
  )
  toset <- !(names(op.episphereR) %in% names(op))
  if(any(toset)) options(op.episphereR[toset])
  invisible()
}
