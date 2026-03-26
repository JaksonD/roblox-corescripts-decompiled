local l_Parent_0 = script:FindFirstAncestor("SduiCoreSystem").Parent;
local v1 = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.UniversalAppPolicy);
local function _() --[[ Line: 13 ]] --[[ Name: createSduiPolicyStore ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.createSignal(nil);
    return {
        getAppPolicy = v3, 
        setAppPolicy = v4
    };
end;
local v6 = nil;
return function() --[[ Line: 24 ]] --[[ Name: getSduiPolicyStore ]]
    -- upvalues: v6 (ref), v1 (copy)
    if v6 == nil then
        local v7, v8 = v1.createSignal(nil);
        v6 = {
            getAppPolicy = v7, 
            setAppPolicy = v8
        };
    end;
    return v6;
end;