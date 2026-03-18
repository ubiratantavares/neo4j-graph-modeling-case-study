// Create Genres
MERGE (scifi:Genre {name: 'Sci-Fi'})
MERGE (action:Genre {name: 'Action'})
MERGE (drama:Genre {name: 'Drama'})
MERGE (horror:Genre {name: 'Horror'});

// Create Movies
CREATE (m1:Movie {id: 'm1', title: 'The Matrix', release_year: 1999, duration: 136})
CREATE (m2:Movie {id: 'm2', title: 'Inception', release_year: 2010, duration: 148})
CREATE (m3:Movie {id: 'm3', title: 'Interstellar', release_year: 2014, duration: 169})
CREATE (m4:Movie {id: 'm4', title: 'The Godfather', release_year: 1972, duration: 175});

// Connect Movies to Genres
MATCH (m:Movie {id: 'm1'}), (g:Genre {name: 'Sci-Fi'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 'm1'}), (g:Genre {name: 'Action'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 'm2'}), (g:Genre {name: 'Sci-Fi'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 'm3'}), (g:Genre {name: 'Sci-Fi'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 'm4'}), (g:Genre {name: 'Drama'}) MERGE (m)-[:IN_GENRE]->(g);

// Create People
CREATE (p1:Person {id: 'p1', name: 'Keanu Reeves'})
CREATE (p2:Person {id: 'p2', name: 'Lana Wachowski'})
CREATE (p3:Person {id: 'p3', name: 'Christopher Nolan'})
CREATE (p4:Person {id: 'p4', name: 'Leonardo DiCaprio'});

// Connect People to Movies
MATCH (p:Person {id: 'p1'}), (m:Movie {id: 'm1'}) MERGE (p)-[:ACTED_IN]->(m);
MATCH (p:Person {id: 'p2'}), (m:Movie {id: 'm1'}) MERGE (p)-[:DIRECTED]->(m);
MATCH (p:Person {id: 'p3'}), (m:Movie {id: 'm2'}) MERGE (p)-[:DIRECTED]->(m);
MATCH (p:Person {id: 'p3'}), (m:Movie {id: 'm3'}) MERGE (p)-[:DIRECTED]->(m);
MATCH (p:Person {id: 'p4'}), (m:Movie {id: 'm2'}) MERGE (p)-[:ACTED_IN]->(m);

// Create Users
CREATE (u1:User {id: 'u1', username: 'alice', name: 'Alice Smith'})
CREATE (u2:User {id: 'u2', username: 'bob', name: 'Bob Jones'});

// User interactions
MATCH (u:User {id: 'u1'}), (m:Movie {id: 'm1'}) MERGE (u)-[:WATCHED {rating: 5, timestamp: timestamp()}]->(m);
MATCH (u:User {id: 'u1'}), (m:Movie {id: 'm2'}) MERGE (u)-[:WATCHED {rating: 4, timestamp: timestamp()}]->(m);
MATCH (u:User {id: 'u2'}), (m:Movie {id: 'm2'}) MERGE (u)-[:WATCHED {rating: 5, timestamp: timestamp()}]->(m);
MATCH (u1:User {id: 'u1'}), (u2:User {id: 'u2'}) MERGE (u1)-[:FOLLOWS]->(u2);
