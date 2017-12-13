/*
 * getData.js
 *
 * collects google trends data 
 * for given input
 * 
 */

var queryIndex = 3;

// check program arguments
var argc = process.argv.length;
if (argc <= queryIndex) {
  console.log("ERROR");
  throw("no input");
}

// rebuild input
var searchStartDate = process.argv[queryIndex - 1];
var searchQuery = process.argv[queryIndex];
for (var i = queryIndex + 1; i < argc; i++) {
  searchQuery += " ";
  searchQuery += process.argv[i];
}

// create api object
const googleTrends = require('google-trends-api');

// query arguments
var cat = 0; // category is "all"
var queryArgs;
if (searchStartDate == 0) {
  queryArgs = { keyword: [ searchQuery
                         , "George Harrison"
                         ]
              , category: cat
              }
} else {
  var startDate = new Date(Date.now() - searchStartDate);
  queryArgs = { keyword: [ searchQuery
                         , "George Harrison"
                         ]
              , startTime: startDate
              , category: cat
              } 
}

googleTrends.interestOverTime(queryArgs)
.then(function(results) {
  console.log(results);
})
.catch(function(err) {
  console.log("ERROR");
});
