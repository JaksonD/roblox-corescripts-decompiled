local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.Types);
local v4 = {
    overlayType = nil, 
    overlayProps = {}
};
return function() --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v5, v6 = v2.createSignal(table.clone(v4));
    local v8 = v2.createComputed(function(v7) --[[ Line: 21 ]]
        -- upvalues: v5 (copy)
        return v5(v7).overlayType;
    end);
    return {
        getCurrentOverlay = v5, 
        setCurrentOverlay = function(v9, v10) --[[ Line: 27 ]] --[[ Name: setCurrentOverlay ]]
            -- upvalues: v6 (copy)
            v6({
                overlayType = v9, 
                overlayProps = v10
            });
        end, 
        getCurrentOverlayType = v8, 
        dismissCurrentOverlay = function() --[[ Line: 34 ]] --[[ Name: dismissCurrentOverlay ]]
            -- upvalues: v6 (copy), v4 (ref)
            v6(table.clone(v4));
        end
    };
end;