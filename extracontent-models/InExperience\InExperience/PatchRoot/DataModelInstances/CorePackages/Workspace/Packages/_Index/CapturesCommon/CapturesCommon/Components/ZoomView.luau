local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.React);
local l_View_0 = v2.View;
local v5 = require(l_Parent_0.Hooks.useZoomController);
return function(v6) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), v3 (copy), l_View_0 (copy)
    local v7 = v6.active == nil or v6.active;
    local v8, v9 = v5(v7);
    v3.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy), v8 (copy)
        if v6.onZoomStatusChanged then
            v6.onZoomStatusChanged(v8);
        end;
    end, {
        v8, 
        v6.onZoomStatusChanged
    });
    return v3.createElement(l_View_0, {
        ref = v9, 
        tag = "anchor-center-center position-center-center size-full bg-action-subtle", 
        ZIndex = 1
    }, {
        ZoomItem = v3.createElement(v3.Fragment, nil, v6.children)
    });
end;