library(shiny)
library(shinydashboard)

# User Interface

ui <-
  
  dashboardPage(
    
    dashboardHeader(title = "Basic Use of JavaScript"),
    
    dashboardSidebar(),
    
    dashboardBody(
      
      
      
      # Javasript Code
      
      singleton(tags$head(HTML("
                               
                               <script type='text/javascript'>
                               
                               function demojs() {
                               
                               var elem = document.getElementById('sampleanimation'); 
                               
                               var position = 0;
                               
                               var id = setInterval(frame, 10);
                               
                               function frame() {
                               
                               if (position == 350) {
                               
                               clearInterval(id);
                               
                               } else {
                               
                               position++;
                               
                               elem.style.top = position + 'px';
                               
                               elem.style.left = position + 'px';
                               
                               }
                               
                               }
                               
                               }
                               
                               </script>"))),
      
      
      
      # CSS Code
      
      singleton(tags$head(HTML("
                               
                               <style type='text/css'>
                               
                               #sampleanimation {
                               
                               width: 50px;
                               
                               height: 50px;
                               
                               position: absolute;
                               
                               background-color: blue;
                               
                               }
                               
                               </style>"))),
      
      # HTML Code   
      
      box(tags$body(HTML("<p>
                         <button onclick='demojs()'>Click Me</button> 
                          </p>
                         <div id ='sampleanimation'>
                         </div>
                         ")), height = 400)
      
      ))

server = function(input, output) { }

runApp(list(ui = ui, server = server), launch.browser =T)