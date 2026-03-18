# Neo4j Graph Modeling Case Study - Streaming Service

## 📌 Problema

O desafio consiste em modelar a complexa rede de relacionamentos de um serviço de **Streaming de Filmes**, onde usuários interagem com conteúdos e entre si. O objetivo é permitir recomendações personalizadas e análises de catálogo eficientes.

## 🤔 Por que grafos?

Grafos são ideais para este cenário devido à natureza altamente conectada dos dados:

- **Recomendações Recursivas**: Encontrar amigos de amigos ou filmes de gêneros similares.
- **Relacionamentos N:N**: Atores participam de vários filmes, e filmes têm vários atores.
- **Traversal Eficiente**: Consultar caminhos de recomendação em milissegundos, algo caro em bancos relacionais.

## 🧠 Modelagem

- **Labels**: `User`, `Movie`, `Genre`, `Person`.
- **Relacionamentos**: `WATCHED`, `FOLLOWS`, `IN_GENRE`, `ACTED_IN`, `DIRECTED`.
- **Propriedades**: Títulos, nomes, anos de lançamento e avaliações (ratings).

## 🗂️ Dataset

- Uma amostra sintética está disponível em `cypher/load_data.cypher`.
- Estrutura: Arquivos Cypher que criam nós de Filmes, Pessoas, Gêneros e Usuários com suas conexões.

## ⚙️ Como rodar

1. Subir uma instância Neo4j (via Docker ou Desktop).
2. Executar os scripts na ordem:
   - `cypher/constraints.cypher`
   - `cypher/indexes.cypher`
   - `cypher/load_data.cypher`
3. Rodar as consultas em `cypher/queries.cypher`.

## 🔍 Queries de negócio

- Recomendações baseadas em amigos.
- Recomendação por similaridade de gênero e avaliação.
- Análise de atores por nicho de gênero.
- Ranking de popularidade por gênero.

## 📊 Resultados

Consulte a pasta `queries/results/` para insights detalhados e documentação das respostas.

## 🚧 Troubleshooting

Problemas comuns como duplicidade de dados foram resolvidos com o uso de `MERGE` e `CONSTRAINTS` de unicidade.

## 🚀 Melhorias futuras

- Implementar algoritmos de GDS (Graph Data Science) para similaridade de cosseno.
- Integrar com uma API em Python para visualização em tempo real.
