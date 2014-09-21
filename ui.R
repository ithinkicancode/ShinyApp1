
shinyUI ( pageWithSidebar (

    headerPanel("Tech Stock Dashboard"),

    sidebarPanel(
        wellPanel(
            p(strong("Companies")),
            checkboxInput(inputId = "stock_aapl", label = "Apple", value = TRUE),
            checkboxInput(inputId = "stock_goog", label = "Google", value = TRUE),
            checkboxInput(inputId = "stock_orcl", label = "Oracle", value = FALSE),
            checkboxInput(inputId = "stock_msft", label = "Microsoft", value = FALSE),
            checkboxInput(inputId = "stock_yhoo", label = "Yahoo", value = FALSE)
        ),

        wellPanel(
            span(strong('Time Period: '), textOutput ('time_num_value') ),

            sliderInput(inputId = "time_num",
                        label = "",
                        min = 1, max = 12, step = 1, value = 3),
            br(),

            selectInput(inputId = "time_unit",
                        label = "",
                        choices = c("Days" = "days",
                                    "Weeks" = "weeks",
                                    "Months" = "months",
                                    "Years" = "years"),
                        selected = "weeks")
        ),

        selectInput(inputId = "chart_type",
                    label = "Graph Style",
                    choices = c("Line" = "line",
                                "Candlestick" = "candlesticks",
                                "Bar" = "bars"),
                    selected = "line"
        )
    ),

    mainPanel(
        conditionalPanel(condition = "input.stock_aapl",
                         br(),
                         div(plotOutput(outputId = "plot_aapl"))),

        conditionalPanel(condition = "input.stock_goog",
                         br(),
                         div(plotOutput(outputId = "plot_goog"))),

        conditionalPanel(condition = "input.stock_orcl",
                         br(),
                         div(plotOutput(outputId = "plot_orcl"))),

        conditionalPanel(condition = "input.stock_msft",
                         br(),
                         div(plotOutput(outputId = "plot_msft"))),

        conditionalPanel(condition = "input.stock_yhoo",
                         br(),
                         plotOutput(outputId = "plot_yhoo"))
    )
))