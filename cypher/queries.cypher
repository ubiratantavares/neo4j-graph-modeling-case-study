// 1. Recomendar filmes assistidos por amigos (que o usuário ainda não viu)
MATCH (u:User {username: 'alice'})-[:FOLLOWS]->(friend)-[:WATCHED]->(m:Movie)
WHERE NOT (u)-[:WATCHED]->(m)
RETURN m.title, friend.username, count(*) as count
ORDER BY count DESC;

// 2. Encontrar filmes do mesmo gênero que o usuário gosta (baseado em avaliações altas)
MATCH (u:User {username: 'alice'})-[:WATCHED {rating: 5}]->(:Movie)-[:IN_GENRE]->(g:Genre)<-[:IN_GENRE]-(rec:Movie)
WHERE NOT (u)-[:WATCHED]->(rec)
RETURN rec.title, g.name, count(*) as common_genres
ORDER BY common_genres DESC;

// 3. Listar atores que trabalharam em mais de um filme do gênero 'Sci-Fi'
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)-[:IN_GENRE]->(g:Genre {name: 'Sci-Fi'})
WITH p, count(m) as movie_count
WHERE movie_count > 1
RETURN p.name, movie_count;

// 4. Filmes mais populares por gênero
MATCH (g:Genre)<-[:IN_GENRE]-(m:Movie)<-[w:WATCHED]-()
RETURN g.name, m.title, count(w) as views
ORDER BY g.name, views DESC;
