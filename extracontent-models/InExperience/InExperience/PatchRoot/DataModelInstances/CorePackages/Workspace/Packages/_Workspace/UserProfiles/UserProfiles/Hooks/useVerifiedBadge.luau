local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserProfiles");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SignalsReact);
local v3 = require(l_script_FirstAncestor_0.Stores.VerifiedBadgeDisplayStore).get();
return function(v4) --[[ Line: 13 ]] --[[ Name: useVerifiedBadge ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3.getBadgeVisibilitySignal(v4.UserId);
    return (v2.useSignalState(v5));
end;