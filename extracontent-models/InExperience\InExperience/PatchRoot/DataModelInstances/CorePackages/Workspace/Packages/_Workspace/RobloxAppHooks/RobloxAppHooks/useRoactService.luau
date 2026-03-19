local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local v1 = require(l_Parent_0.React);
local l_RoactServicesContext_0 = require(l_Parent_0.RoactServices).RoactServicesContext;
return function(v3) --[[ Line: 23 ]] --[[ Name: useRoactService ]]
    -- upvalues: v1 (copy), l_RoactServicesContext_0 (copy)
    local v4 = v1.useContext(l_RoactServicesContext_0);
    return (v3.get(v4));
end;