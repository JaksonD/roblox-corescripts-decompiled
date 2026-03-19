local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.CursorContext);
return function(v3) --[[ Line: 8 ]] --[[ Name: withCursorMigration ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Consumer, {
        render = function(v4) --[[ Line: 10 ]] --[[ Name: render ]]
            -- upvalues: v3 (copy)
            return v3(v4.getCursor);
        end
    });
end;