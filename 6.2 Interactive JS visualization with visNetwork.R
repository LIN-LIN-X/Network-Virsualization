library(visNetwork)

EDGES <- read.csv("~/Downloads/Dataset1-Media-Example-EDGES.csv")
NODES <- read.csv("~/Downloads/Dataset1-Media-Example-NODES.csv")

visNetwork(NODES, EDGES)

# We will start by adding new node and edge attributes to our dataframes.
vis.nodes <- NODES
vis.links <- EDGES

vis.nodes$shape <- "dot"
vis.nodes$shadow <- TRUE #Nodes will drop shadow
vis.nodes$title <- vis.nodes$media #Text on click
vis.nodes$label <- vis.nodes$type.label #Node label
vis.nodes$size <- vis.nodes$audience.size #Node size
vis.nodes$borderWidth <- 2 #Node border width

vis.nodes$color.background <- c("slategery", "tomato", "gold")[NODES$media.type]
vis.nodes$color.border <-"black"
vis.nodes$color.highlight.background <- "orange"
vis.nodes$color.hightlight.border <- "darkred"

visNetwork(vis.nodes, vis.links)

#
NODES$group <- NODES$type.label
visnet3 <- visNetwork(NODES,EDGES)

visnet3 <- visGroups(visnet3, groupname = "Newspaper", shape= "square",
                     color = list(background = "gray", border = "black"))
visnet3 <- visGroups(visnet3, groupname = "TV", shape= "dot",
                     color = list(background = "tomato", border = "black"))
visnet3 <- visGroups(visnet3, groupname = "Online", shape= "diamond",
                     color = list(background = "orange", border = "black"))

# we can add an automatically generated group legend with visLegend().
visLegend(visnet3, main = "Legend", position = "right", ncol=1)