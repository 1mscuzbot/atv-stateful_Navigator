# StatefulWidget + Navigator  

## Atividade  
Descrição:


Nesta atividade, você deverá carregar o projeto Flutter no Firebase Studio e adaptar a aplica-
ção existente para incluir uma nova funcionalidade: uma lista de Pokémons. O projeto base já
possui uma estrutura com features, models, rotas, telas de listagem, telas de detalhes, cards e
BottomNavigationBar. Você deverá seguir o mesmo padrão já usado nas funcionalidades exis-
tentes, reaproveitando a arquitetura do projeto.  


Ao final, o usuário deverá conseguir:  
    • abrir o app;  
    • ver a nova opção “Pokémons” na BottomNavigationBar;  
    • acessar a tela de listagem de Pokémons;  
    • visualizar os Pokémons em cards;  
    • clicar em um card;  
    • navegar para a tela de detalhes do Pokémon selecionado.  

### Questão 1:  Estrutura da pasta 'lib'

models/: Responsável por armazenar as classes de dados da aplicação. Essas classes não contêm visual, apenas a estrutura da informação. É aqui que ficará a classe Pokemon, definindo que cada um possui atributos como nome e tipo.  
features/ ou screens/: Armazena as telas principais do aplicativo. Se uma tela tiver blocos visuais maiores ou for muito complexa, ela pode ter sua própria subpasta dentro deste diretório. Aqui ficarão armazenadas a tela de listagem de Pokémons e a tela de detalhes.  
widgets/ ou components/: Destinada aos elementos visuais menores e reutilizáveis da interface. Em vez de criar um código gigante em um arquivo só , os componentes individuais, como o PokemonCard que representa cada item da lista, ficam isolados aqui.  
routes/: Centraliza o gerenciamento da navegação do aplicativo. Esta pasta armazena as configurações que definem para onde o aplicativo deve ir quando o usuário clica em algo, além de gerenciar a passagem de argumentos (como enviar um objeto Pokémon para a tela de detalhes).  
