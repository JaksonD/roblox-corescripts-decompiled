local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local v3 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local _ = require(l_script_FirstAncestor_0.Types.TimedOptionType);
local v6 = require(script.Parent.WearTimeListItem);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v2.CombinedFFlagShouldUseLegacyGamepadFocus;
return function(v8) --[[ Line: 22 ]] --[[ Name: WearTimeList ]]
    -- upvalues: v3 (copy), v6 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), l_View_0 (copy)
    local v9 = {};
    for v10, v11 in v8.options do
        v9["WearTimeListItem_" .. tostring(v10)] = v3.createElement(v6, {
            days = v11.days, 
            price = v11.price, 
            isActive = v11.selected ~= nil and v11.selected, 
            onActivated = v8.onOptionActivated and function() --[[ Line: 31 ]]
                -- upvalues: v8 (copy), v10 (copy)
                v8.onOptionActivated(v10);
            end or nil, 
            LayoutOrder = v10, 
            ref = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v10 == 1 and v8.firstItemRef then v8.firstItemRef else nil
        });
    end;
    return v3.createElement(l_View_0, {
        tag = "col gap-small size-full-0 auto-y padding-small radius-medium stroke-default stroke-thick", 
        LayoutOrder = v8.LayoutOrder
    }, v9);
end;