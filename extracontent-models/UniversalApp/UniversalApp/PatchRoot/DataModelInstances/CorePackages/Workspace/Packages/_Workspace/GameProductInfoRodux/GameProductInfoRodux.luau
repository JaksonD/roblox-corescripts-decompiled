local v0 = require(script.GameProductInfo);
return {
    FetchGamesProductInfo = require(script.FetchGamesProductInfo), 
    GameProductInfo = v0, 
    GamesProductInfoReducer = require(script.GamesProductInfoReducer), 
    useGameProductInfoSelector = require(script.useGameProductInfoSelector), 
    ["jest.config"] = script["jest.config"]
};