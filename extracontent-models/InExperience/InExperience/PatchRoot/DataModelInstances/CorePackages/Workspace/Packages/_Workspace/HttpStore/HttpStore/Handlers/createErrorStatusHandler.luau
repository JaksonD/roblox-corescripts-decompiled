local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local _ = require(l_Parent_1.InternalHttpStore);
local _ = require(l_Parent_0.Types);
return function(v5) --[[ Line: 11 ]] --[[ Name: createErrorStatusHandler ]]
    -- upvalues: v2 (copy)
    return function(v6) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v5 (copy)
        return v2.createComputed(function(v7) --[[ Line: 13 ]]
            -- upvalues: v6 (copy), v5 (ref)
            local v8 = v6(v7);
            if v8.status == "Success" then
                local l_StatusCode_0 = v8.response.StatusCode;
                if v5[l_StatusCode_0] ~= nil then
                    v5[l_StatusCode_0](v8);
                end;
            end;
            return v8;
        end);
    end;
end;