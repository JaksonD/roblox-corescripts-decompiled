local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.createTelemetryEmitter);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy)
        assert(type(v4) == "function", "Expect renderCallback to be a function.");
        local function v7(v5) --[[ Line: 11 ]]
            -- upvalues: v2 (ref), v4 (copy)
            local v6 = v2(v5);
            return v4(v6);
        end;
        return v1.createElement(v3.Consumer, {
            render = v7
        });
    end;
end;