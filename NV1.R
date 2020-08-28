# colors
plot(x=1:10, y=rep(5,10), pch=19, cex = 3, col="dark red")

#hex
points(x=1:10, y=rep(6,10), pch=19, cex = 4, col="557799")

#RGB value
points(x=1:10, y=rep(4,10), pch=19, cex = 2, col=rgb(.25, .5, .3))

#Set opacity/transparency of an element using alpha
plot(x=1:5, y=rep(5,5), pch=19, cex =12, col=rgb(.25, .5, .3, alpha=.5))

#if you plan on using the built-in color names
colors()

#pattern matching
grep("blue", colors(), value=T)


# 5 colors from the heat palette, opaque
pal1 <- heat.colors(5, alpha=1)
plot(x=1:10, y=1:10, pch= 19,cex= 5, col=pal1)

# 5 colors from the heat palette, transparent
pal2 <- rainbow(5, alpha=.5)
plot(x=1:10, y=1:10, pch= 19,cex= 5, col=pal2)

#generating own gradients 
own_color <- colorRampPalette(c("gray80","dark red"))
plot(x=10:1, y=1:10, pch=19, cex =5, col=own_color(10))

