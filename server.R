
if ( ! require (quantmod) ) {
    stop("Package quantmod is missing. Run 'install.packages(\"quantmod\")' to install the package.\n")
}

# Download if needed
require_symbol <- function(symbol, envir = parent.frame()) {

    if (is.null(envir[[symbol]])) {
        envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
    }
    envir[[symbol]]
}

shinyServer(function(input, output) {

    symbol_env <- new.env()

    make_chart <- function(symbol) {
        symbol_data <- require_symbol(symbol, symbol_env)

        chartSeries(symbol_data,
                    name = symbol,
                    type = input$chart_type,
                    subset = paste("last", input$time_num, input$time_unit),
                    theme = "white")
    }

    output$time_num_value <- renderText ( {paste ('Past ', input$time_num, ' ', input$time_unit)} )

    output$plot_aapl <- renderPlot({ make_chart("AAPL") })
    output$plot_msft <- renderPlot({ make_chart("MSFT") })
    output$plot_orcl <- renderPlot({ make_chart("ORCL") })
    output$plot_goog <- renderPlot({ make_chart("GOOG") })
    output$plot_yhoo <- renderPlot({ make_chart("YHOO") })
})