# Despesas
Um aplicativo para visualização e organização de gastos
<div align="center">
<img src="https://user-images.githubusercontent.com/58363666/154751947-0823da66-94b6-4992-b22e-bf8d188e3b41.jpg " width="200px">
<img src="https://user-images.githubusercontent.com/58363666/154754299-012afa4a-f6fb-40bf-9a18-ff1820747c9e.jpg" width="200px">
<img src="https://user-images.githubusercontent.com/58363666/154754516-15e016fd-6554-4af4-9169-6e69ab54d115.jpg" width="200px">
</div>

## Visão geral
Este projeto foi desenvolvido ao longo das seções 4, 5 e 6 do curso de flutter "Aprenda Flutter e Desenvolva Apps Para Android e IOS 2021" na plataforma da Udemy. Os objetivos deste aplicativo foi aprender a utilizar mais widgets, entender mais sobre a estrutura dos projetos de flutter, aprender sobre o funcionamento do flutter internamente e maneiras de deixar o aplicativo responsivo.

## Recursos
- assets/
  
  Pasta que contém o arquivo da imagem "zzz" e os arquivos das fontes utilizadas. Esses arquivos foram disponibilizados para uso no arquivo pubspec.yaml

## Estrutura do projeto

- lib/components/
  
  Pasta que contém os componentes do aplicativo que são chamados conforme se utiliza o aplicativo.
  
  - chart.dart
    
    Arquivo onde está a estrutura principal do gráfico, ela o divide em 7 fileiras referentes aos últimos 7 dias.
  - chart_bar.dart
    
    Arquivo onde está a estrutura de cada barrinha do gráfico. Elas que mostram a intensidade dos gastos da última semana.
  - transaction_form.dart
    
    Arquivo que contém a estrutura do formulário para adicionar uma despesa
  - transaction_item.dart
    
    Arquivo que contém a estrutura do card de despesa que será visualizado dentro da lista
  - transaction_list.dart
    
    Arquivo que cria a estrutura da lista de despesas


- lib/src/
  
  Esta pasta contém o arquivo transaction.dart, ele é uma classe que define uma transação contendo um id, um titulo, um valor e uma data.

- lib/main.dart
  
  Este arquivo é o ponto de partida da aplicação. Nele está toda a estruturação e chamadas dos componentes do aplicativo.
  
