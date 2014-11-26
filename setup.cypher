  CREATE (person:Category {name: "People", path: "people"}),
    (politician:Category {name: "Politicians", path: "politicians"}),
    (country:Category {name: "Countries", path: "countries"}),
    (year:Category {name: "Years", path: "years"}),
    (election:Category {name: "Elections", path: "elections"}),
    (politicalOffice:Category {name: "Political offices", path: "political-offices"}),
    (appointments:Category {name: "Appointments", path: "appointments"}),
    (society:Category {name: "Societies", path: "societies"}),
    (dc:Thing {name: "David Cameron", description: "Old Etonian and current UK prime minster. Occasionally freelances for the Guardian", path: "david-cameron", contributorId: "profile/davidcameron", tagQuery: "politics/davidcameron", schemaName: "David Cameron"}),
    (gb:Thing {name: "Gordon Brown", path: "gordon-brown", schemaName: "Gordon Brown", tagQuery: "politics/gordon-brown"}),
    (uk:Thing {name: "United Kingdom", path: "uk", schemaName: "United Kingdom"}),
    (chancellor:Thing {name: "Chancellor of the Exchequer", path: "chancellor-of-the-exchequer"}),
    (primeMinister:Thing {name: "Prime Minister", path: "prime-minister"}),
    (bullingdonClub: Thing {name: "Bullingdon Club", path: "bullingdon-club", description: "A private student society in Oxford University"}),
    (twentyFourteen:Thing {name: "2014", year: 2014, path: "2014", tagQuery: "world/series/2014-in-review"}),
    (twentyThirteen:Thing {name: "2013", year: 2013, path: "2013", tagQuery: "world/series/2013-in-review"}),
    (twentyTwelve:Thing {name: "2012", year: 2012, path: "2012", tagQuery: "world/series/2012-in-review"}),
    (twentyEleven:Thing {name: "2011", year: 2011, path: "2011", tagQuery: "world/series/2011-in-review"}),
    (twentyTen:Thing {name: "2010", year: 2010, path: "2010", tagQuery: "world/series/2010-in-review"}),
    (nineteenNinetySeven:Thing {name: "1997", year: 1997, path: "1997"}),
    (ukElection2010:Thing {name: "2010 UK Election", path: "2010-uk-election", tagQuery: "theguardian/election-2010/election-2010"}),
    (dc)-[:IS_A]->(person),
    (dc)-[:IS_A]->(politician),
    (dc)-[:MEMBER_OF]->(bullingdonClub),
    (gb)-[:IS_A]->(person),
    (gb)-[:IS_A]->(politician),
    (gb)-[:SUCCEEDED_BY]->(dc),
    (db)-[:PREDECESSOR]->(gb),
    (uk)-[:IS_A]->(country),
    (twentyFourteen)-[:IS_A]->(year),
    (twentyThirteen)-[:IS_A]->(year),
    (twentyTwelve)-[:IS_A]->(year),
    (twentyEleven)-[:IS_A]->(year),
    (twentyTen)-[:IS_A]->(year),
    (nineteenNinetySeven)-[:IS_A]->(year),
    (twentyFourteen)-[:PREVIOUS]->(twentyThirteen),
    (twentyThirteen)-[:PREVIOUS]->(twentyTwelve),
    (twentyTwelve)-[:PREVIOUS]->(twentyEleven),
    (twentyEleven)-[:PREVIOUS]->(twentyTen),
    (twentyThirteen)-[:NEXT]->(twentyFourteen),
    (twentyTwelve)-[:NEXT]->(twentyThirteen),
    (twentyEleven)-[:NEXT]->(twentyTwelve),
    (twentyTen)-[:NEXT]->(twentyEleven),
    (chancellor)-[:IS_A]->(politicalOffice),
    (bullingdonClub)-[:IS_A]->(society),
    (gb)-[:HELD_OFFICE {from: 1997, to: 2007}]->(chancellor),
    (ukElection2010)-[:IS_A]->(election),
    (ukElection2010)-[:HELD_IN]->(uk),
    (ukElection2010)-[:WON_BY]->(dc),
    (dc)-[:CONTESTED_BY]->(ukElection2010),
    (gb)-[:CONTESTED_BY]->(ukElection2010),
    (ukElection2010)-[:HELD_ON]->(twentyTen),
    (twentyTen)-[:HELD]->(ukElection2010)
