#Instalação de pacotes
install.packages("dplyr")
library(diplyr)
remotes::install_github("cienciadedatos/dados")
dados::casas #base de dados
install.packages("magrittr") #pacote para o pipe rodar
library(magrittr)

#Exercícios

"1. Reescreva os códigos abaixo utilizando as funções across() e where()"

#Resposta

"1.
a)"
# casas <- dados::casas
# casas %>%
#  group_by(geral_qualidade) %>%
#  summarise(
#    acima_solo_area_media = mean(acima_solo_area, na.rm = TRUE),
#    garagem_area_media = mean(garagem_area, na.rm = TRUE),
#    valor_venda_medio = mean(venda_valor, na.rm = TRUE)
#  )

library(dplyr)
remotes::install_github("cienciadedatos/dados")
casas <- dados::casas
casas %>%
  group_by(geral_qualidade) %>%
  dplyr::summarise(across(
    .cols = c(acima_solo_area,garagem_area, venda_valor),
    .fns  = mean, na.rm = TRUE
  ))

"1.
b)"
# casas %>%
#  filter_at(
#   vars(porao_qualidade, varanda_fechada_area, cerca_qualidade),
#    ~!is.na(.x)
# )

casas %>%
  filter (across(
        c(porao_qualidade, varanda_fechada_area, cerca_qualidade),
        ~!is.na(.x)
         ))

"1.
c)"
#casas %>%
#mutate_if(is.character, ~tidyr::replace_na(.x, replace = "Não possui"))
casas %>%
  mutate(across(
    replace(character(~tidyr::replace_na(.x, replace = "Não possui")))
  ))
