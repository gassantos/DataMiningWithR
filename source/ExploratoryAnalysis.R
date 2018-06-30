# Carregando as bibliotecas
loadlibrary <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x, repos='http://cran.fiocruz.br', dep=TRUE)
    loadlibrary(x)
  }
}

loadlibrary("ggplot2")
loadlibrary("scales")

# Criando uma função gráfica
plot.series <- function(series, label_series = "", label_x = "", label_y = "", colors = NULL) {
  grf <- ggplot(data=series, aes(x = x, y = value, colour=variable))
  grf <- grf + geom_line() + geom_point(data=series, aes(x = x, y = value, colour=variable), size=0.5)
  if (!is.null(colors)) {
    grf <- grf + scale_color_manual(values=colors)
  }
  grf <- grf + labs(color=label_series)
  grf <- grf + xlab(label_x)
  grf <- grf + ylab(label_y)
  grf <- grf + theme_bw(base_size = 10)
  grf <- grf + theme(panel.grid.major = element_blank()) + theme(panel.grid.minor = element_blank()) 
  grf <- grf + theme(legend.position = "bottom") + theme(legend.key = element_blank()) 
  return(grf)
}

# Carregando o dataset em formato RData
load(file = "vra-wu.RData", "dataset" )
head(dataset)







