local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local v3 = require(script.Parent.Hooks.useIsGamepad);
return function(v4) --[[ Line: 12 ]] --[[ Name: withIsGamepadInput ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 13 ]]
        -- upvalues: v3 (ref), v1 (ref), v4 (copy), v2 (ref)
        local v6 = v3();
        return v1.createElement(v4, v2.join(v5, {
            isGamepadInput = v6
        }));
    end;
end;