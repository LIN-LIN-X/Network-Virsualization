library(igraph)

# Read in the data:
EDGES <- read.csv("~/Downloads/Dataset1-Media-Example-EDGES.csv")
NODES <- read.csv("~/Downloads/Dataset1-Media-Example-NODES.csv")


# Converting the data to an igraph object:
# The graph_from_data_frame() function takes two data frames: 'd' and 'vertices'.
# 'd' describes the edges of the network - it should start with two columns 
# containing the source and target node IDs for each network tie.
# 'vertices' should start with a column of node IDs.
# Any additional columns in either data frame are interpreted as attributes.
net <- graph_from_data_frame(d=EDGES, vertices=NODES, directed=T) 

# Generate colors based on media type:
colrs <- c("gray50", "tomato", "gold")
V(net)$color <- colrs[V(net)$media.type]

# Using the audience.size value to set node size:
deg <- degree(net, mode="all")
V(net)$size <- deg*2

# Setting label of nodes as NA
V(net)$label <- NA

# Set edge width based on Weight:
E(net)$width <- E(net)$weight/6

# Change arrow size size and edge color:
E(net)$arrow.size <- .2
E(net)$edge.color <- "gray80"

# We can exen set the network layout
graph_attr(net,"layout") <- layout_with_lgl
plot(net)

#One way to approach this is to see if we can sparsify the network, keeping only the most
#important ties and discarding the rest.
hist(EDGES$weight)
mean(EDGES$weight)
sd(EDGES$weight)

#Keep ones that have weight higher than the mean for the network. 
cut.off <- mean(EDGES$weight)
net.plot <- delete_edges(net, E(net)[weight<cut.off])
plot(net.plot, layout=layout_with_kk)

# Highlight a path in the network
news.path <- shortest_paths(net, from = V(net)[media=="MSNBC"],
                            to = V(net)[media=="New York Post"],
                            output = "both") #both path nodes and edges

# Generate edge color variable to plot the path:
ecol <- rep("gray80", ecount(net))
ecol[unlist(news.path$epath)]<- "orange"
# Generate edge width variable to plot the path:
ew <- rep(2,ecount(net))
ew[unlist(news.path$epath)] <- 4
# Generate node color variable to plot the path:
vcol <- rep("gray40", vcount(net))
vcol[unlist(news.path$vpath)] <-"gold"

plot(net, vertex.color = vcol, edge.color=ecol, edge.width=ew, edge.arrow.mode=0)

# Highilght the edges going into or out of a vertex
# eg: WSJ.

inc.edges <- incident(net, V(net)[media=="Wall Street Journal"], mode = "all")
# for a single node, use incident(), for multiple modes use incident_edges()

# Set colors to plot the selected edges
ecol <- rep("gray80", ecount(net))
ecol[inc.edges] <- "orange"
#
vcol <- rep("grey40", vcount(net))
vcol[V(net)$media=="Wall Street Journal"] <- "gold"
# 
plot(net,vertex.color = vcol, edge.color=ecol )
