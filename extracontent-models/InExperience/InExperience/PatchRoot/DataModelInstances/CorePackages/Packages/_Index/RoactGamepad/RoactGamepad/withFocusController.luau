local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.FocusContext);
local function v6(v3) --[[ Line: 9 ]] --[[ Name: FocusControllerConsumer ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Consumer, {
        render = function(v4) --[[ Line: 11 ]] --[[ Name: render ]]
            -- upvalues: v3 (copy)
            local v5 = nil;
            v5 = if v4 then v4.focusNode.focusController else nil;
            return v3.render(v5);
        end
    });
end;
return function(v7) --[[ Line: 24 ]] --[[ Name: withFocusController ]]
    -- upvalues: v1 (copy), v6 (copy)
    return v1.createElement(v6, {
        render = v7
    });
end;