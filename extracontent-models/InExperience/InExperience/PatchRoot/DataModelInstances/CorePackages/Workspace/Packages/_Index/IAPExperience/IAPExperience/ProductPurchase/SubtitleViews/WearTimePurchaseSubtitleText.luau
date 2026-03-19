local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_Icon_0 = v2.Icon;
local l_Enums_0 = v2.Enums;
return function(v8) --[[ Line: 18 ]] --[[ Name: WearTimePurchaseSubtitleText ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy)
    local l_timedOptionDays_0 = v8.timedOptionDays;
    local v10 = l_useLocalization_0({
        timedOptionText = {
            "Feature.Durables.UnifiedBuyModal.Subtitle.TimedOptionText"; 
            days = l_timedOptionDays_0 or 0
        }, 
        infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite"
    });
    return v1.createElement(l_View_0, {
        tag = "row auto-xy align-y-center gap-xsmall", 
        LayoutOrder = 2
    }, {
        ClockIcon = if l_timedOptionDays_0 then v1.createElement(l_Icon_0, {
            LayoutOrder = 1, 
            name = l_Enums_0.IconName.Clock, 
            size = l_Enums_0.IconSize.Small
        }) else nil, 
        DurationText = v1.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = if l_timedOptionDays_0 then v10.timedOptionText else v10.infinite, 
            tag = "auto-xy text-title-small content-default"
        })
    });
end;