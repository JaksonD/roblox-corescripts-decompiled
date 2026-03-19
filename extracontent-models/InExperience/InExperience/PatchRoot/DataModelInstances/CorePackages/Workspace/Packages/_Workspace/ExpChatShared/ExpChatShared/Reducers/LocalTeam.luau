local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Actions.ClientAppLoaded);
local v4 = require(l_script_FirstAncestor_0.Actions.LocalTeamChanged);
return v2.createReducer(nil, {
    [v4.name] = function(_, v6) --[[ Line: 9 ]]
        return v6.team;
    end, 
    [v3.name] = function(_, v8) --[[ Line: 13 ]]
        return v8.team;
    end
});