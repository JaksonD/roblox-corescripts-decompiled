local l_Parent_0 = script.Parent.Parent;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
return {
    ChatGames = "ChatGames", 
    Games = "Games", 
    HomeGames = "HomeGames", 
    GamesSeeAll = "GamesSeeAll", 
    GamesList = "GamesList", 
    UnifiedHomeSorts = "UnifiedHomeSorts", 
    SearchLandingPage = l_FFlagSearchOmniAutocompletePage_0 and "SearchLandingPage" or nil
};