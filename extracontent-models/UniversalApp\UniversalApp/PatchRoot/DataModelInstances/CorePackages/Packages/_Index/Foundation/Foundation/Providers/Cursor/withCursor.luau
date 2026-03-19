local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.CursorContext);
return function(v3) --[[ Line: 8 ]] --[[ Name: withCursor ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Consumer, {
        render = v3
    });
end;