#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

BMI<-function(weight,height) {(weight*0.45)/((height*0.025)^2)}

diagnostic_f<-function(weight,height){
  BMI_value<-(weight*0.45)/((height*0.025)^2)
  ifelse(BMI_value<18.5,"underweight",ifelse(BMI_value<25,"normal weight",ifelse(BMI_value<30,"overweight","obesity")))
}

shinyServer(
  function(input, output) {
    
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({BMI(input$weight,input$height)})
    output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
  } 
)
