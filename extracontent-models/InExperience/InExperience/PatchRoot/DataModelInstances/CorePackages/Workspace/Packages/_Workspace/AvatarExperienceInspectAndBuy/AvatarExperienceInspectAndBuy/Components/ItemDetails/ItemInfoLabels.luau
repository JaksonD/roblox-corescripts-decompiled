local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.Common.TwoPanelLabelWithDivider);
return function(v5) --[[ Line: 39 ]] --[[ Name: ItemInfoLabels ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v6 = {};
    for v7, v8 in v5.itemInfoLabels do
        if v8.isVisible then
            v6[v8.key] = v2.createElement(v4, {
                LayoutOrder = v7, 
                labelProps = v8.labelProps, 
                showDivider = true
            });
        end;
    end;
    return v2.createElement(v3.View, {
        tag = "auto-y size-full-0 padding-top-medium col align-x-left align-y-top gap-small", 
        LayoutOrder = v5.LayoutOrder or 4
    }, {
        v6
    });
end;