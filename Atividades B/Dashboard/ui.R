library(shiny)
library(shinydashboard)
source("data.R")
library(plotly)
library(ggplot2)

ui <- dashboardPage(skin = "black",
  
  dashboardHeader(title = "Salarios"),
  
  dashboardSidebar(sidebarMenu(
    menuItem("Graficos", tabName = "Graficos", icon = icon("chart-bar")))),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "Graficos", 
              fluidRow(
                box(width = 8,
                selectInput(inputId = "seleciona_emprego", label = "Escolha uma profissao",
                    choices = unique(df$JobTitle)), 
                valueBoxOutput(width = 4, outputId = "Quantidade_analisada"))
              ),
              fluidRow(box(width = 6, plotlyOutput(outputId = "hist_salario_base")),
                       box(width = 6, plotlyOutput(outputId = "hist_hora_extra")),
                       box(width = 6, plotlyOutput(outputId = "hist_outros")),
                       box(width = 6, plotlyOutput(outputId = "hist_salario_total"))),
    
    )
   )
  )
)