local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local v3 = require(l_Parent_0.HttpSessionTracker);
local _ = require(l_Parent_1.InternalHttpStore);
return function(v5) --[[ Line: 11 ]] --[[ Name: createCancelRequestHandler ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v6) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v5 (copy), v3 (ref)
        return v2.createComputed(function(v7) --[[ Line: 13 ]]
            -- upvalues: v6 (copy), v5 (ref), v3 (ref)
            local v8 = v6(v7);
            if v5 ~= v3.currentSession() then
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
end;