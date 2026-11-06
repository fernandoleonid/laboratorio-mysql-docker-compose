# Laboratório MySQL com Docker

## Sobre o laboratório

Este projeto apresenta a configuração de um ambiente MySQL utilizando Docker Compose. A proposta é permitir que diferentes desenvolvedores utilizem a mesma configuração de banco de dados, facilitando a reprodução do ambiente em suas máquinas.

## Vídeo do laboratório
* [Passo a passo da configuração e execução deste laboratório](https://youtu.be/oL9_P8jOjYg?si=zdqgwTvuRNul0zdl)
* [Como configurar WSL e Docker Desktop](https://www.youtube.com/watch?v=qrvx6ivyrQw)

## Tecnologias utilizadas

- Docker
- Docker Compose
- MySQL 8.4
- MySQL Workbench
- SQL

## Estrutura do projeto

```text
laboratorio-mysql-docker/
├── compose.yaml
├── .env.example
├── .gitignore
├── README.md
└── sql/
    └── init.sql
```

## Pré-requisitos

- Windows 11
- WSL2 habilitado
- Docker Desktop instalado e em execução
- Git instalado
- MySQL Workbench (opcional, para acessar o banco visualmente)

## 1. Clonar o repositório

```bash
git clone URL_DO_REPOSITORIO
cd laboratorio-mysql-docker
```

## 2. Configurar as variáveis de ambiente

Crie o arquivo `.env` a partir do modelo disponibilizado no projeto.

No PowerShell, execute

```powershell
Copy-Item .env.example .env
```

Abra o arquivo `.env` e configure as credenciais de acesso ao banco.

Exemplo

```env
MYSQL_ROOT_PASSWORD=RootLab123!
MYSQL_DATABASE=gestao_contatos
MYSQL_USER=aluno
MYSQL_PASSWORD=Aluno123!
```

**Importante** — O arquivo `.env` contém informações locais e não deve ser enviado ao GitHub. O `.gitignore` já está configurado para ignorá-lo.

## 3. Iniciar o ambiente

Na pasta do projeto, execute

```bash
docker compose up -d
```

Verifique se o container está em execução

```bash
docker ps
```

Para acompanhar a inicialização do MySQL

```bash
docker logs -f mysql-lab
```

Aguarde a mensagem indicando que o servidor está pronto para receber conexões.

## 4. Acessar o banco de dados

Utilize o MySQL Workbench ou outra ferramenta de gerenciamento de banco de dados.

Configurações de conexão

| Parâmetro | Valor |
|---|---|
| Hostname | localhost |
| Port | 3307 |
| Username | aluno |
| Password | Valor de MYSQL_PASSWORD no arquivo .env |
| Database | gestao_contatos |

## 5. Inicialização do banco

O arquivo `sql/init.sql` contém os comandos SQL responsáveis por

- Selecionar o banco `gestao_contatos`.
- Criar a tabela `contatos`.
- Inserir os registros iniciais para testes.

O Docker configura esse arquivo para execução automática durante a primeira inicialização do banco, quando o diretório de dados está vazio.

**Atenção** — Alterações no arquivo `init.sql` não são executadas automaticamente em um banco que já possui dados armazenados no volume.

## 6. Persistência dos dados

O projeto utiliza um volume Docker para manter os dados do MySQL mesmo quando o container é removido.

Para remover o container sem apagar os dados

```bash
docker compose down
```

Para iniciar novamente

```bash
docker compose up -d
```

Os dados anteriores continuarão disponíveis.

## 7. Reinicializar o banco de dados

Para remover o container e também o volume que armazena os dados, execute

```bash
docker compose down -v
```

Em seguida, inicie novamente

```bash
docker compose up -d
```

**Atenção** — O comando `docker compose down -v` remove o volume e apaga permanentemente os dados armazenados nele. O MySQL será inicializado novamente e executará o arquivo `init.sql`.

## 8. Desafio proposto — MariaDB

Reproduza este laboratório utilizando MariaDB no lugar do MySQL.

O desafio consiste em adaptar a configuração do Docker Compose, executar a inicialização do banco, conectar utilizando uma ferramenta gráfica e testar a persistência dos dados.

Documente as alterações realizadas e publique sua solução em um repositório próprio.

## Objetivo educacional

Com este laboratório, você terá contato com conceitos de conteinerização, configuração de ambientes, persistência de dados e inicialização automatizada de bancos de dados.

A proposta também demonstra como o GitHub pode ser utilizado para compartilhar uma configuração padronizada, permitindo que diferentes integrantes de uma equipe reproduzam a mesma estrutura de banco de dados em suas máquinas.
