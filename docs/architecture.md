# Arquitetura do Modelo de Grafos - Streaming Service

Este projeto utiliza o Neo4j para modelar a rede de relacionamentos de um serviço de streaming de filmes.

## Modelo de Dados (Ontologia)

### Nós (Labels)

- **User**: Representa os usuários assinantes do serviço.
  - Propriedades: `id`, `username`, `name`.
- **Movie**: Representa as obras cinematográficas.
  - Propriedades: `id`, `title`, `release_year`, `duration`.
- **Genre**: Categorias de filmes (ex: Sci-Fi, Action).
  - Propriedades: `name`.
- **Person**: Indivíduos que participam da produção (Atores/Diretores).
  - Propriedades: `id`, `name`.

### Relacionamentos

- `(u:User)-[:WATCHED {rating, timestamp}]->(m:Movie)`: Interação principal de consumo.
- `(u:User)-[:FOLLOWS]->(u:User)`: Recurso social entre usuários.
- `(m:Movie)-[:IN_GENRE]->(g:Genre)`: Classificação do filme.
- `(p:Person)-[:ACTED_IN]->(m:Movie)`: Participação de elenco.
- `(p:Person)-[:DIRECTED]->(m:Movie)`: Direção da obra.

## Diagrama (Mental)

Atores e Diretores se conectam a Filmes. Filmes se conectam a Gêneros. Usuários se conectam a Filmes (consumo) e a outros Usuários (social).
