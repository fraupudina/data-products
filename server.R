library(shiny)

Server <- function(input, output) {
  
  datasim <- reactive({rexp(input$num_sample*input$num_sims,input$num_lambda)})
  data_matrix <- reactive({matrix(datasim(),input$num_sims)})
  data_means <- reactive({rowMeans(data_matrix())})
  dfm_means <- reactive({data.frame(data_means())})
  
  sample_means <- reactive({mean(data_means())}) 
  sample_sd <- reactive({sd(data_means())})
  t_mean <- reactive({1/input$num_lambda})
  t_sd <- reactive({(1/input$num_lambda) * (1/sqrt(input$num_sample))})
  
  
  output$graph <- renderPlot({hist(data_means(),col="pink",border = "blue")})
  output$table <- renderTable({dfm_means()})
}

#shinyApp(ui = ui, server = server)