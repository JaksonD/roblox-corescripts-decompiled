local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(script.Parent.DisplayOptions);
local v3 = require(script.Parent.ScreenSize);
local v4 = require(script.Parent.Settings);
local v5 = require(script.Parent.GameStats);
local v6 = require(script.Parent.Teams);
local v7 = require(script.Parent.TeamNames);
local v8 = require(script.Parent.TeamColors);
local v9 = require(script.Parent.Players);
local v10 = require(script.Parent.PlayerStats);
local v11 = require(script.Parent.PlayerTeam);
local v12 = require(script.Parent.PlayerIconInfo);
local v13 = require(script.Parent.PlayerRelationship);
local v14 = require(script.Parent.PlayerDropDown);
local v15 = require(script.Parent.PlayerKeys);
local v16 = v1.combineReducers({
    displayOptions = v2, 
    screenSize = v3, 
    settings = v4, 
    gameStats = v5, 
    teams = v6, 
    teamNames = v7, 
    teamColors = v8, 
    players = v9, 
    playerStats = v10, 
    playerTeam = v11, 
    playerIconInfo = v12, 
    playerRelationship = v13, 
    playerDropDown = v14
});
return function(v17, v18) --[[ Line: 42 ]]
    -- upvalues: v16 (copy), v15 (copy)
    local v19 = v16(v17, v18);
    v19.playerKeys = v15(v17 and v17.playerKeys or nil, v18, v19);
    return v19;
end;