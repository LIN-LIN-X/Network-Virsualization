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

# Plot with curved edges and reduce arrow size:
# Note: using curved edges will allow you to see multiple links between two nodes
plot(net, edge.arrow.size=.4, edge.curved= .1)

# Set edge color to blue
# Replace the vertex label with the node names stored in "media" with black color
plot(net, edge.arrow.size=.2, edge.color="blue", vertex.size = 15,vertex.label=V(net)$media, vertax.label.color="black",
     vertax.label.cex=0.00001, vertax.label.dist = 0.01)


# Generate colors based on media type:
colrs <- c("gray50", "tomato", "gold")
V(net)$color <- colrs[V(net)$media.type]

# Using the audience.size value to set node size:
V(net)$size <- V(net)$audience.size*0.6

# Setting label of nodes as NA
V(net)$label <- NA

# Set edge width based on Weight:
E(net)$weight <- E(net)$weight/6

# Change arrow size size and edge color:
E(net)$arrow.size <- .2
E(net)$edge.color <- "gray80"

# We can exen set the network layout
graph_attr(net,"layout") <- layout_with_lgl()
plot(net)

# We can also override the attributes explicity in the plot:
plot(net, edge.color="blue", vertex.color="gray50")

# Sometimes, especially with semantic networkd, we may be interested in plotting only the labels of the nodes:
plot(net, vertex.shape="none",vertex.label=V(net)$media,vertex.label.font=2, vertex.label.color="gray40"
     , vertex.label.cex=.7, edge.color="gray85")

