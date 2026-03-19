local v0 = require(script.GraphQLError);
local v1 = require(script.formatError);
return {
    GraphQLError = v0.GraphQLError, 
    printError = v0.printError, 
    syntaxError = require(script.syntaxError).syntaxError, 
    locatedError = require(script.locatedError).locatedError, 
    formatError = v1.formatError
};