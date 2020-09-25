library(networkD3)

EDGES <- read.csv("~/Downloads/Dataset1-Media-Example-EDGES.csv")
NODES <- read.csv("~/Downloads/Dataset1-Media-Example-NODES.csv")

links.d3 <- data.frame(from=as.numeric(factor(EDGES$from)) - 1,
                       to = as.numeric(factor(EDGES$to)) - 1)

nodes.d3 <- cbind(idn=factor(NODES$media, levels = NODES$media), NODES)

#The Group parameter in it is used to color the nodes.
#Nodesize is not the size of the node, but the number of the column in the node data
#that should be used for sizing.
#The charge parameter controls node repulsion (if negative) or attraction (if positive)
forceNetwork(Links = links.d3, Nodes = nodes.d3, Source = "from", Target = "to",
             NodeID = "idn", Group = "type.label", linkWidth = 1, linkColour
             = "#afafaf", fontSize = 12, zoom = T, legend = T, Nodesize=6,
             opacity = 1, charge = -600, width = 600, height=600)
