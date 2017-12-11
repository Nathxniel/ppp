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
  // print error code to file
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

// query date
var startDate = new Date(Date.now() - searchStartDate);
var cat = 3; // category is arts and entertainment
googleTrends.interestOverTime({ keyword: [searchQuery
                                         ,"George Harrison"]
                              //, startTime: startDate
                              , category: cat
                              })
.then(function(results) {
  // print result averages to file
  console.log(results);
})
.catch(function(err) {
  // print error code to file
});
