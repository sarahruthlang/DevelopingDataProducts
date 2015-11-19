shinyServer(function(input, output) {
  output$help1 <- renderUI({
    str1 <- paste("<b>User Interface</b>")   
    str2 <- paste("The data is displayed in the following tabs:")
    str3 <- paste("<ul><li>Documentation</li><li>Selected Values</li><li>Grid</li><li>Plot</li></ul>")
    str4 <- paste("<b>Filtering</b>")
    str5 <- paste("Determine if you would like to filter the data:")
    str6 <- paste("<ul><li>Filter Data? Yes/No</li><li>Class</li><li>Sex</li><li>Age</li></ul><b>Click the Submit Button</b><br/>")
    str7 <- paste("<b>Grid Navigation</b>")
    str8 <- paste("Utilize the following items to filter further or view the data")
    str9 <- paste("<ul><li>Top left - Choose entries from dropdown</li><li>Top right - Search within the Grid</li><li>Grid Bottom - Filter by any of the columns in the grid</li><li>Grid Bottom Right - Paging</li></ul>")   
    str10 <- paste("<b>Plot</b>")
    str11 <- paste("A MosaicPlot is utilized to display the filtered data.")
    HTML(paste(str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, sep = '<br/>'))
  })
  
  output$selected1 <- renderUI({
    str1 <- paste("Class: ", input$rbtnClass)
    str2 <- paste("Sex: ", input$ddSex)
    str3 <- paste("Age: ", input$ddAge)
    HTML(paste(str1, str2, str3, sep = '<br/>'))
  })
  
  output$table1 <- renderDataTable({    
    titanic = data.frame(Titanic)
    br()
    if ( is.null(input$rbtnClass) ) { return(titanic) }
    if ( length(input$rbtnClass) == 0 ) { return(titanic) }
    if ( is.null(input$ddSex) ) { return(titanic) }
    if ( length(input$ddSex) == 0 ) { return(titanic) }
    if ( is.null(input$ddAge) ) { return(titanic) }
    if ( length(input$ddAge) == 0 ) { return(titanic) }   
    if ( input$rbtnFilterData == "No" )
    { return (titanic) }
    else
    {
      titanic[(titanic$Class == input$rbtnClass
               & titanic$Sex == input$ddSex
               & titanic$Age == input$ddAge),]
    }
  })
  
  output$plot1 <- renderPlot({
    titanic = data.frame(Titanic)
    br()
    if ( is.null(input$rbtnClass) ) { return(titanic) }
    if ( length(input$rbtnClass) == 0 ) { return(titanic) }
    if ( is.null(input$ddSex) ) { return(titanic) }
    if ( length(input$ddSex) == 0 ) { return(titanic) }
    if ( is.null(input$ddAge) ) { return(titanic) }
    if ( length(input$ddAge) == 0 ) { return(titanic) }   
    if ( input$rbtnFilterData == "No" )
    {
      filtered <- titanic
      mosaicplot(filtered, main = "Survival on the Titanic", color=TRUE, shade=TRUE)
    }
    else
    {
      filtered <- titanic[(titanic$Class == input$rbtnClass
                           & titanic$Sex == input$ddSex
                           & titanic$Age == input$ddAge),]
      mosaicplot(filtered, main = "Survival on the Titanic", color=TRUE, shade=TRUE)
    }
  })
}
)
