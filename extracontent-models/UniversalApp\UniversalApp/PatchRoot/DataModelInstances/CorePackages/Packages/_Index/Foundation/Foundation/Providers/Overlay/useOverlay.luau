local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.OverlayContext);
return function() --[[ Line: 8 ]] --[[ Name: useOverlay ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useContext(v2);
    v1.useLayoutEffect(function() --[[ Line: 11 ]]
        -- upvalues: v3 (copy)
        v3.requestOverlay();
    end, {});
    return v3.instance;
end;