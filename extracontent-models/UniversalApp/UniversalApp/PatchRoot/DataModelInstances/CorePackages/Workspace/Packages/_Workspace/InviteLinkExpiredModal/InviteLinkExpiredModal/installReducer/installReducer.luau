local l_script_FirstAncestor_0 = script:FindFirstAncestor("InviteLinkExpiredModal");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_RoduxGames_0 = v1.RoduxGames;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
return function() --[[ Line: 8 ]]
    -- upvalues: l_Rodux_0 (copy), l_RoduxGames_0 (copy), l_RoduxNetworking_0 (copy)
    return l_Rodux_0.combineReducers({
        Games = l_RoduxGames_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer()
    });
end;