/*
 * getData.js
 *
 * collects google trends data 
 * for given input
 * 
 */

/*
 * arguments:
 *
 * 0 - bin location
 * 1 - program location
 *
 * 2 - start date
 * 3 - end date 
 * 4 - input name code from getInput (e.g. /m/adnoa)
 *
 */

var queryIndex = 4;

// check program arguments
var argc = process.argv.length;
if (argc <= queryIndex) {
  console.log("ERROR");
  throw("no input");
}

// rebuild input
var searchStartDate = process.argv[queryIndex - 2];
var searchEndDate   = process.argv[queryIndex - 1];

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
var fameControlVar = "/m/03bnv"; //George Harrison, Guitarist
if (searchStartDate == 0) {
  // go back one year
  var oneYear = 31556952000;
  var oneYearAgo = new Date(Date.now() - oneYear);
  queryArgs = { keyword: [ searchQuery
                         , fameControlVar
                         ]
              , startTime: oneYearAgo
              , category: cat
              }
} else {
  // go back number of milliseconds for start and end
  var startDate = new Date(Date.now() - searchStartDate);
  var endDate   = new Date(Date.now() - searchEndDate);
  queryArgs = { keyword: [ searchQuery
                         , fameControlVar
                         ]
              , startTime: startDate
              , endTime: endDate
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
