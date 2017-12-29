/*
 * getInput.js
 *
 * collects topic data
 * to give to getData.js as input
 * 
 */

/*
 * args
 *
 * 0 - bin location
 * 1 - program location
 *
 * 2 - beginning of query name (e.g. "Taylor)
 * ... rest of query name (e.g. Swift")
 *
 */

var queryIndex = 2;

// check program arguments
var argc = process.argv.length;
if (argc <= queryIndex) {
  console.log("ERROR");
  throw("no input");
}

// rebuild input
var searchQuery = process.argv[queryIndex];
for (var i = queryIndex + 1; i < argc; i++) {
  searchQuery += " ";
  searchQuery += process.argv[i];
}

// create api object
const googleTrends = require('google-trends-api');

// make topics query
googleTrends.autoComplete({keyword: searchQuery})
.then((res) => {
  console.log(res);
})
.catch((err) => {
  console.log("ERROR");
});
