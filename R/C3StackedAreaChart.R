#' C3StackedAreaChart
#'
#' Creat a stacked area chart
#'
#' @param dataset the data to be plotted, a list containing the different data series,
#'  each as a vector of numeric values.
#' @param colors vector of colors for the bars.
#' @param width,height size of figure output
#'
#' @import htmlwidgets
#'
#' @export
C3StackedAreaChart <- function(dataset, colors, width = NULL, height = NULL) {

  groups        <- setdiff(names(dataset),"Time")
  types         <- list()
  types[groups] <-"area-spline"

  # forward options using x
  x = list(
    dataset = dataset,
    colors  = colors,
    groups  = groups,
    types   = types
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'C3StackedAreaChart',
    x,
    width = width,
    height = height,
    package = 'rc3'
  )
}

#' Shiny bindings for C3StackedAreaChart
#'
#' Output and render functions for using C3StackedAreaChart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a C3StackedAreaChart
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name C3StackedAreaChart-shiny
#'
#' @export
C3StackedAreaChartOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'C3StackedAreaChart', width, height, package = 'rc3')
}

#' @rdname C3StackedAreaChart-shiny
#' @export
renderC3StackedAreaChart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, C3StackedAreaChartOutput, env, quoted = TRUE)
}
