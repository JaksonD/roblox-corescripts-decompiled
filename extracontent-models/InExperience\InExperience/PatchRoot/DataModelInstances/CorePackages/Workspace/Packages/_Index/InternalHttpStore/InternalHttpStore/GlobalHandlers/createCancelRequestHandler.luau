local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local v3 = require(l_Parent_0.HttpSessionTracker);
local _ = require(l_Parent_0.HttpStoreTypes);
return function(v5) --[[ Line: 11 ]] --[[ Name: createCancelRequestHandler ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v6 = v3.currentSession();
    return v2.createComputed(function(v7) --[[ Line: 13 ]]
        -- upvalues: v5 (copy), v6 (copy), v3 (ref)
        local v8 = v5(v7);
        if v6 ~= v3.currentSession() then
            return {
                status = "Failed", 
                config = v8.config, 
                cancelled = true
            };
        else
            return v8;
        end;
    end);
end;