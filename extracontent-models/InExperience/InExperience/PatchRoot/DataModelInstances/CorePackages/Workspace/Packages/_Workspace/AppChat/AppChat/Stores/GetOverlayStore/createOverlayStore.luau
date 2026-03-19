local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = {
    overlayType = nil, 
    overlayProps = {}
};
return function() --[[ Line: 32 ]] --[[ Name: createOverlayStore ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.createSignal(table.clone(v2));
    local v5, v6 = v1.createSignal({});
    return {
        getCurrentOverlay = v3, 
        showOverlay = function(v7, v8) --[[ Line: 38 ]] --[[ Name: showOverlay ]]
            -- upvalues: v4 (copy)
            v4({
                overlayType = v7, 
                overlayProps = v8
            });
        end, 
        dismissOverlay = function() --[[ Line: 44 ]] --[[ Name: dismissOverlay ]]
            -- upvalues: v4 (copy), v2 (ref)
            v4(table.clone(v2));
        end, 
        getOverlayDefaultProps = v5, 
        setOverlayDefaultProps = v6
    };
end;