# load libraries
library(reshape)
library(ggplot2)
library(viridis)
library(hrbrthemes)
library(tidyverse)
library(gridExtra)

# Read kimura table
KimuraDistance <- read.csv("tes_sten.kimura.txt",sep = " ")

# add here the genome size in bp
genomes_size=2300000000

# melt table
kd_melt = melt(KimuraDistance,id="Div")
# select column
kd_melt$norm = kd_melt$value/genomes_size * 100

kd_melt=kd_melt[!kd_melt['variable']=='X',]

# set the plot size to its full size
options(jupyter.plot_scale=1)

# plot
ggplot(kd_melt, aes(fill=variable, y=norm, x=Div)) + 
  geom_bar(position="stack", stat="identity",color="black") +
  scale_fill_viridis(discrete = T,option = 'turbo') +
  theme_classic() +
  xlab("Kimura substitution level") +
  ylab("Percent of the genome") + 
  labs(fill = "") +
  coord_cartesian(xlim = c(0, 55)) +
  theme(axis.text=element_text(size=11),axis.title =element_text(size=12))

# Save last generated plot
ggsave('teste.png',dpi=600,width = 12)
