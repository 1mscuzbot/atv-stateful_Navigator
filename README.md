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

1. Pasta app/ (Configurações Globais)O que armazena: O coração da inicialização do aplicativo.Funcionalidade: Contém as configurações principais e as rotas globais do sistema. É aqui que fica o widget raiz (geralmente o MaterialApp), a definição do tema central (cores em tons de verde que o professor mencionou) e o arquivo de mapeamento por onde o Navigator sabe qual tela abrir.  
2. Pasta core/ (Núcleo do Sistema)O que armazena: A infraestrutura técnica que faz o app funcionar por baixo dos panos.Funcionalidade: Guarda lógicas que não são visuais e que não pertencem a nenhuma funcionalidade específica. Inclui integrações com banco de dados, clientes HTTP para requisições de API, tratamento de erros genéricos e constantes. É o "motor" do app.  
3. Pasta features/ (Funcionalidades de Negócio)O que armazena: Onde o trabalho real acontece. O projeto base já possui essa estrutura.  Funcionalidade: Divide o aplicativo pelas suas funcionalidades práticas. Em vez de agrupar todos os arquivos por tipo (todas as telas juntas), agrupa por contexto. Você terá uma pasta pokemons/ aqui dentro, e dentro dela ficarão estritamente as telas de listagem, as telas de detalhes, os cards e as rotas específicas da Pokédex.  
4. Pasta shared/ (Componentes Compartilhados)O que armazena: Elementos reutilizáveis por todo o aplicativo.Funcionalidade: Tudo o que pode ser usado em mais de uma feature vem para cá. Se o botão de "favoritar" for usado tanto na Pokédex quanto em uma futura tela de "Meus Favoritos", o código desse botão mora no shared. O mesmo vale para a BottomNavigationBar, fontes de texto padronizadas ou modelos de dados genéricos. Isso evita duplicação de código.