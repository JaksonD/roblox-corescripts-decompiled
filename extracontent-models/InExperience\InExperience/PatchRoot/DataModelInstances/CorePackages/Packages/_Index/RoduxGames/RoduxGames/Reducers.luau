local l_Parent_0 = script:FindFirstAncestor("RoduxGames").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Games.playabilityByGameId);
local v3 = require(script.Games.productInfoByGameId);
local v4 = require(script.Games.byGameId);
local v5 = require(script.Games.mediaByGameId);
return function(v6) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v1.combineReducers({
        playabilityByGameId = v2(v6), 
        productInfoByGameId = v3(v6), 
        byGameId = v4(v6), 
        mediaByGameId = v5(v6)
    });
end;