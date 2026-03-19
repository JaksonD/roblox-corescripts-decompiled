local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Signals);
return function() --[[ Line: 13 ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal(false);
    local v4, v5 = v1.createSignal(false);
    return {
        getLoggedinUsingSavedPassword = v2, 
        setLoggedinUsingSavedPassword = v3, 
        getSavedPasswordAfterLogin = v4, 
        setSavedPasswordAfterLogin = v5
    };
end;