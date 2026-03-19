local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.Parent.createProfileCTAStore);
local v3 = v1.createComputed(v2);
return {
    get = function() --[[ Line: 11 ]] --[[ Name: get ]]
        -- upvalues: v3 (copy)
        return v3(false);
    end
};