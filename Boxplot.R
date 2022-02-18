# Estudo sobre cores boxplot: utilizando (iris)

# 1. Abrindo Diretório
# 2. Importando Dados

library(readr)
library(RColorBrewer)
library(ggplot2)
library(dplyr)
head(iris)
View(iris)
library(ggplot2)

# boxplot básico

A <- ggplot(iris, aes(x=Sepal.Length, y=Species)) +geom_boxplot()
A
# inverter o boxplot

A + coord_flip()

# pontos bopxplot

B <- ggplot(iris, aes(x=Sepal.Length, y=Species)) + geom_point()
B+ coord_flip()

# box plot color

c < - ggplot(iris, aes(x=Sepal.Length, y=Species)) +
  geom_boxplot(fill='#A4A4A4', color="darkred")
c+ coord_flip()

# pontos boxplot

d <- ggplot(iris, aes(x=Sepal.Length, y=Species)) + 
  geom_point(color='darkblue')
d + coord_flip()

# mudando a  cor 

E<-ggplot(iris, aes(x=Sepal.Length, y=Species, fill=Species)) +
  geom_boxplot()
E
# ponto boxplot

F <- ggplot(iris, aes(x=Sepal.Length, y=Species, color=Species)) +
       geom_point()
F + coord_flip()

# mudando a intensidade da cor

E + scale_fill_hue(l=40, c=35) + coord_flip()

F + scale_color_hue(l=40, c=35) + coord_flip()

# mudando a cor manualmente

E + scale_fill_manual(values=c("#D8BFD8", "#B0E0E6", "#FFE4E1")) + coord_flip()

F + scale_color_manual(values=c("#D8BFD8", "#B0E0E6", "#FFFF00")) + coord_flip()


# usando a palleta Rcolor brewer

E + scale_fill_brewer(palette="BuPu") + coord_flip()

F + scale_color_brewer(palette="PRGn") + coord_flip()


# escala de cinza

E + scale_fill_grey() + theme_classic() + coord_flip()

F + scale_color_grey() + theme_classic() + coord_flip()




# AJUSTANDO ESTÉTICAMENTE

library(extrafont) 

E<-ggplot(iris, aes(x=Sepal.Length, y=Species, fill=Species)) +
  geom_boxplot(show.legend=F) +
  theme_classic() +
  xlab("Comprimento da Sépala (mm)") + 
  ylab("Espécies") +
  theme(text=element_text(size=12,  family="Cambria")) +
  scale_fill_brewer(palette="BuPu") + coord_flip()
E

library(extrafont) 
png(filename="plotgrey.png")
teste<-ggplot(iris, aes(x=Sepal.Length, y=Species, fill=Species)) +
  geom_boxplot(show.legend=F) +
  theme_classic() +
  xlab("Comprimento da Sépala (mm)") + 
  ylab("Espécies") +
  theme(text=element_text(size=12,  family="Cambria")) +
  scale_fill_grey() + coord_flip()
teste 
dev.off()


