local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.React);
local l_ControlState_0 = v2.Enums.ControlState;
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local v7 = require(l_Parent_0.Constants);
return function(v8) --[[ Line: 17 ]] --[[ Name: ReactionPicker ]]
    -- upvalues: v3 (copy), v7 (copy), l_Image_0 (copy), l_ControlState_0 (copy), l_View_0 (copy)
    local v14 = v3.useMemo(function() --[[ Line: 18 ]]
        -- upvalues: v7 (ref), v3 (ref), l_Image_0 (ref), l_ControlState_0 (ref), v8 (copy)
        local v9 = {};
        local v10 = 1;
        for v11, v12 in v7.ReactionIconMappings do
            v9[v11] = v3.createElement(l_Image_0, {
                Image = v12, 
                LayoutOrder = v10, 
                ZIndex = 2, 
                onStateChanged = function(v13) --[[ Line: 27 ]] --[[ Name: onStateChanged ]]
                    -- upvalues: l_ControlState_0 (ref), v8 (ref), v11 (copy)
                    if v13 == l_ControlState_0.Pressed then
                        v8.reactToContent(v11);
                    end;
                end, 
                tag = "anchor-center-center position-center-center size-900-900"
            });
            v10 = v10 + 1;
        end;
        return v9;
    end, {
        v8.reactToContent
    });
    return v3.createElement(l_View_0, {
        tag = "radius-medium bg-over-media-0 padding-medium gap-medium auto-xy row"
    }, v14);
end;