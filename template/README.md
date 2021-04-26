# Projeto de Automação - Fefrancopro.com - ruby 2021
###### versão: 1.0.0

04/2021
## Documentação para explicação de uso de gems no processo de desenvolvimento da automação.

### Manual de Instalação do ambiente Ruby:
https://medium.com/qaninja/instalando-ruby-cucumber-e-capybara-no-windows-10-acb1fe833a95

### Gems utilizadas:

#### Rspec
  Utilizada no projeto para realizar a comparação de valores descritos na documentação gherkin com os valores obtidos no html da aplicação.
#### Site_prism
  Utilizada no projeto para realizar a organização do código referente ao instanciamento de elementos html para a interação e execução de eventos. Facilita a utilização do Page Objects.
#### Faker
  Utilizado para a geração de massas de dados estáticas e dinâmicas.
#### Faker-cpf
  Utilizado como complemento do Faker.
#### Report_builder
  Utilizado para a geração e customização de reports gerados pelos testes automatizados.
#### Cucumber
  Utilizado na interpretação e execução do gherkin e geração de metodos (steps).
#### Selenium-webdriver
  Utilizado na configuração do navegador que foi utilizado nos testes.
#### Nokogiri
  Utilizado para instânciar elementos html para variaveis ruby.
#### Parallel_tests
  Utilizado para a execução de testes em paralelo simultâneamente.

## Estrutura do projeto

O projeto foi construído com base em um template. A estrutura do template consiste em:
#### Features
Pasta raiz contendo Page objects, Specs e Step definitions.

                                Features
                                    |
            Page objects |  Specs  | Step definitions | Support

#### Support
Pasta que contém as Factorys de massa de dados, configuração de CSS para Report Builder, Page Helpers com metodos para facilitar a interação com elementos html, Spec Helper para centralizar o instanciamento de objetos dos Page Objects e Env para configurar qual URL será algo do teste automatizado.

#### Page Objects
Pasta que contém o opcional de trazer projetos web, mobile e etc... No caso, estamos tratando de um projeto web.

                        Page objects
                              |
                             Web
##### Page Objects - Web
Na pasta web contém todas as pastas referentes a páginas html acessadas pela automação. Local onde ficam os arquivos ruby que contém a codificação de mapeamento de elementos html e metodos de interação.

                                  Web
                                   |
    Autenticação | Carrinho | Home | Meus Dados | Produto | Sections

#### Specs
Pasta que também contém o opcional de trazer projetos web, mobile e etc...

                            Specs
                              |
                             Web
##### Specs - Web
A pasta Web de Specs contém toda a documentação gherkin, igualmente separada por pastas com nome da funcionalidade especifica.

                                                    Web
                                                     |
    Acesso | Alterar Acesso | Autênticação | Dados Cadastrais | Gerenciar Endereços | Listagem | Produto
#### Step Definitions
Pasta que também contém o opcional de trazer projetos web, mobile e etc...

                      Step Definitions
                              |
                             Web
##### Step Definitions - Web
A pasta Web de Step Definitions contém os arquivos ruby com os métodos gerados via cucumber na interpretação da documentação gherkin.

                                                    Web
                                                     |
    Acesso | Alterar Acesso | Autênticação | Dados Cadastrais | Gerenciar Endereços | Listagem | Produto

### Como executar o teste automatizado e acessar os reports gerados automaticamente
#### Pre-requisitos:
É necessário que o ambiente, descrito no inicio com tutorial no link, esteja corretamente instalado.
É necessário também que possua o template salvo no computador.
#### Execução do teste:
Usando o Cmder, acesse a pasta onde o template está localizado e execute o seguinte comando:

              cucumber -t

Esse comando fará o cucumber executar todas as features que estiverem contidas no template.

              cucumber -t @tag_da_feature_desejada

Esse comando fará o cucumber executar apenas as features com a tag associada.
#### Acessando os reports gerados:
Para acessar os reports gerados é necessário acessar a pasta reports

                Template
                    |
          Features  |  Reports

Ao acessar a pasta, após o teste, será gerado um arquivo de report chamado 'cucumber_web_report'.
