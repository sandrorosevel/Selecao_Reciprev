library(shiny)
library(shinydashboard)
source("data.R")
library(plotly)
library(ggplot2)


plot.histogram <- function(df, var, xlab, ylab) {
  out <- ggplot(df, aes_string(x = var)) +
    geom_histogram(bins = 15, fill = "#42c2f5", color = "white", alpha = 0.7) +
    labs(x = xlab, y = ylab)
  return(out)
}



server <- function(input, output) {
  output$hist_salario_base <- renderPlotly({
    data <- df[df$JobTitle == input$seleciona_emprego,]
    plot <- plot.histogram(data, "BasePay", "Salario base","Quantidade de profissionais")
    ggplotly(plot)
  })
  
  output$hist_hora_extra <- renderPlotly({
    data <- df[df$JobTitle == input$seleciona_emprego,]
    plot <- plot.histogram(data, "OvertimePay", "Hora extra","Quantidade de profissionais")
    ggplotly(plot)
  })
  
  output$hist_outros <- renderPlotly({
    data <- df[df$JobTitle == input$seleciona_emprego,]
    plot <- plot.histogram(data, "OtherPay", "Outros pagamentos","Quantidade de profissionais")
    ggplotly(plot)
  })
  
  output$hist_salario_total <- renderPlotly({
    data <- df[df$JobTitle == input$seleciona_emprego,]
    plot <- plot.histogram(data, "TotalPay", "Total recebido","Quantidade de profissionais")
    ggplotly(plot)
  })
  
  
  output$Quantidade_analisada <- renderValueBox({
    valueBox(
      nrow(df[df$JobTitle == input$seleciona_emprego, ]), "Salarios Observados", icon = icon("list"),
      color = "blue"
    )
  })
  
  
}
