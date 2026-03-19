local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialProof");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local v4 = require(l_script_FirstAncestor_0.Rodux.ConnectionsByEntityId);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    return v2.combineReducers({
        NetworkStatus = v3.installReducer(), 
        ConnectionsByEntityId = v4
    });
end;