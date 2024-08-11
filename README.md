# Server Basico Ruby



```markdown
## Usando WEBrick

Este README documenta um servidor web básico escrito em Ruby para fins de aprendizagem. Ele exibe páginas HTML estáticas em resposta a solicitações HTTP.
Este código Ruby demonstra como criar um servidor HTTP básico utilizando a biblioteca WEBrick.

```

**Pré-requisitos**

- Ruby instalado (verifique a versão com `ruby -v`)
- Gem `webrick` (instale com `gem install webrick`)

**Estrutura do Código**

- **`routes.rb`**
    - Define módulos separados (`HomeRoutes` e `AboutRoutes`) para lidar com diferentes rotas:
        - `/index.html`: Exibe o conteúdo do arquivo `index.html`.
        - `/about.html`: Exibe o conteúdo do arquivo `about.html`.
    - Cada módulo possui a função `call` que recebe um objeto `request` (representando a solicitação do cliente) e um objeto `response` (para construir a resposta do servidor).
    - A função `call` define o código de status HTTP (`200` para OK), o tipo de conteúdo (`text/html`) e lê o conteúdo do arquivo HTML correspondente usando `File.read('../index.html')` ou `File.read('../about.html')`.
- **`server.rb`**
    - Define uma variável `name` com o texto "Server CLOSE!" (pode ser útil para testes de desligamento).
    - Imprime o valor de `name`.
    - Requer a biblioteca `webrick` e um arquivo `route.rb` (que não está incluído neste exemplo).
    - Cria um servidor HTTP `WEBrick::HTTPServer` na porta 3000.
    - Define um manipulador de interrupção (`trap 'INT' do server.shutdown end`) para encerrar o servidor de forma limpa ao receber o sinal SIGINT (geralmente Ctrl+C).
    - Monta manipuladores de processo (proc) para as rotas `/index.html` e `/about.html`:
        - Cada manipulador chama a função `call` do módulo `HomeRoutes` ou `AboutRoutes` correspondente, passando os objetos `request` e `response`.

**Executando o Servidor**

1. Salve os arquivos `routes.rb` e `server.rb` no mesmo diretório.
2. Certifique-se de que possui os arquivos `index.html` e `about.html` na pasta atual ou em um diretório acessível (ajustando o caminho do arquivo em `File.read` se necessário).
3. Abra um terminal no diretório do projeto e execute:
    
    **Bash**
    
    `ruby server.rb`
    
4. O servidor iniciará na porta 3000.
5. Acesse `http://localhost:3000/index.html` e `http://localhost:3000/about.html` no seu navegador para ver o conteúdo das páginas HTML.

**Encerrando o Servidor**

Pressione Ctrl+C no terminal onde o servidor está em execução.

**Observações**

- Este é um exemplo simplificado para fins de demonstração. Um servidor web real provavelmente implementaria recursos adicionais, como roteamento mais complexo, processamento de formulários, bancos de dados etc.
- Considere usar estruturas Rails ou Sinatra para desenvolvimento web Ruby mais avançado.

**Contribuições**

Sinta-se à vontade para sugerir melhorias ou reportar problemas!