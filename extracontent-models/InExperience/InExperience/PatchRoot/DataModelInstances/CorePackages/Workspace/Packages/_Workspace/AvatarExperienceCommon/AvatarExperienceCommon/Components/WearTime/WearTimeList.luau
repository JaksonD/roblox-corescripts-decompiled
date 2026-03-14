local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.AvatarExperienceFlags);
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v4 = require(script.Parent.WearTimeListItem);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v1.CombinedFFlagShouldUseLegacyGamepadFocus;
return function(v6) --[[ Line: 27 ]] --[[ Name: WearTimeList ]]
    -- upvalues: v2 (copy), v4 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), l_View_0 (copy)
    local v7 = {};
    for v8, v9 in v6.options do
        v7["WearTimeListItem_" .. tostring(v8)] = v2.createElement(v4, {
            days = v9.days, 
            price = v9.price, 
            isActive = v9.selected ~= nil and v9.selected, 
            onActivated = v6.onOptionActivated and function() --[[ Line: 36 ]]
                -- upvalues: v6 (copy), v8 (copy)
                v6.onOptionActivated(v8);
            end or nil, 
            LayoutOrder = v8, 
            ref = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v8 == 1 and v6.firstItemRef then v6.firstItemRef else nil
        });
    end;
    return v2.createElement(l_View_0, {
        tag = "col gap-small size-full-0 auto-y padding-small radius-medium stroke-default stroke-thick", 
        LayoutOrder = v6.LayoutOrder
    }, v7);
end;