  CREATE (person:Category {name: "People", path: "people"}),
    (politician:Category {name: "Politicians", path: "politicians"}),
    (author:Category {name: "Authors", path: "authors"}),
    (band:Category {name: "Bands", path: "bands"}),
    (actor:Category {name: "Actors", path: "actors"}),
    (director:Category {name: "Directors", path: "directors"}),
    (country:Category {name: "Countries", path: "countries"}),
    (year:Category {name: "Years", path: "years"}),
    (election:Category {name: "Elections", path: "elections"}),
    (politicalOffice:Category {name: "Political offices", path: "political-offices"}),
    (appointments:Category {name: "Appointments", path: "appointments"}),
    (society:Category {name: "Societies", path: "societies"}),
    (culturalWork:Category {name: "Cultural Work", path: "works-of-culture"}),
    (film:Category {name: "Film", path: "film"}),
    (book:Category {name: "Book", path: "book"}),
    (dc:Thing {name: "David Cameron", description: "Old Etonian and current UK prime minster. Occasionally freelances for the Guardian", path: "david-cameron", contributorId: "profile/davidcameron", tagQuery: "politics/davidcameron", schemaName: "David Cameron"}),
    (gb:Thing {name: "Gordon Brown", path: "gordon-brown", schemaName: "Gordon Brown", tagQuery: "politics/gordon-brown", contributorId: "profile/gordonbrown"}),
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
    (dwj:Thing {name: "Diana Wynne-Jones", path: "diana-wynne-jones", schemaUrl: "http://www.leemac.freeserve.co.uk/", schemaDeathDate: "2011-03-26", tagQuery: "books/dianawynnejones", image: "http://i.guim.co.uk/static/w-620/h--/q-95/sys-images/Guardian/Pix/pictures/2014/2/17/1392652123198/Diana-Wynne-Jones-008.jpg", wikipedia: "http://en.wikipedia.org/wiki/Diana_Wynne_Jones"}),
    (slipknot:Thing {name: "Slipknot", path: "slipknot", schemaName: "Slipknot", schemaUrl: "http://www.slipknot1.com/", image: "http://www.slipknot1.com/home/img/bg_group.jpg", tagQuery: "music/slipknot", interviewable: "true"}),
    (bradpitt:Thing {name: "Brad Pitt", path: "brad-pitt", schemaName: "Brad Pitt",
    schemaSpouse: "http://www.theguardian.com/film/angelinajolie"}),
    (aj:Thing {name: "Angelina Jolie", path: "angelina-jolie", schemaName: "Angelina Jolie", schemaSpouse: "http://www.theguardian.com/film/bradpitt"}),
    (unbroken:Thing {name: "Unbroken", path: "film-unbroken", schemaName: "Unbroken", schemaUrl: "http://www.unbrokenfilm.com/"}),
    (fury:Thing {name: "Fury", path: "film-fury", schemaName: "Fury", schemaUrl: "http://www.unbrokenfilm.com/"}),
    (author)-[:IS_A]->(person),
    (politician)-[:IS_A]->(person),
    (actor)-[:IS_A]->(person),
    (director)-[:IS_A]->(person),
    (dc)-[:IS_A]->(person),
    (dc)-[:IS_A]->(politician),
    (dc)-[:MEMBER_OF]->(bullingdonClub),
    (gb)-[:IS_A]->(person),
    (gb)-[:IS_A]->(politician),
    (gb)-[:SUCCEEDED_BY]->(dc),
    (dc)-[:PREDECESSOR]->(gb),
    (dwj)-[:IS_A]->(person),
    (dwj)-[:IS_A]->(author),
    (dwj)-[:DIED_IN]->(twentyEleven),
    (slipknot)-[:IS_A]->(band),
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
    (twentyTen)-[:HELD]->(ukElection2010),
    (bradpitt)-[:IS_A]->(actor),
    (bradpitt)-[:IS_A]->(director),
    (aj)-[:IS_A]->(actor),
    (aj)-[:IS_A]->(director),
    (bradpitt)-[:IS_MARRIED_TO]->(aj),
    (aj)-[:IS_MARRIED_TO]->(bradpitt),
    (bradpitt)-[:APPEARS_IN]->(fury),
    (bradpitt)-[:DIRECTED]->(fury)
