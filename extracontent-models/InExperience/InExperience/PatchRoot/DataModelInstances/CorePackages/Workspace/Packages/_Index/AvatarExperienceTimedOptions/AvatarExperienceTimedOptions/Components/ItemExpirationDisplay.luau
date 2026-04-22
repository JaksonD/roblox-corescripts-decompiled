local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Enums_0 = v3.Enums;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local function _(v9) --[[ Line: 23 ]] --[[ Name: formatExpirationDateTime ]]
    -- upvalues: l_LocalizationService_0 (copy)
    local v10 = DateTime.fromIsoDate(v9);
    if not v10 then
        return v9;
    else
        return v10:FormatLocalTime("MMM DD, LT", l_LocalizationService_0.RobloxLocaleId);
    end;
end;
return function(v12) --[[ Line: 34 ]] --[[ Name: ItemExpirationDisplay ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_View_0 (copy), v3 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_LocalizationService_0 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_useLocalization_0({
        itemExpires = "Feature.Durables.Label.ItemExpires"
    });
    local l_createElement_0 = v1.createElement;
    local l_l_View_0_0 = l_View_0;
    local v17 = {
        tag = "row align-y-center padding-large radius-medium flex-between size-full-0", 
        backgroundStyle = v13.Color.Surface.Surface_100, 
        LayoutOrder = v12.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y
    };
    local v18 = {
        LeftContent = v1.createElement(l_View_0, {
            tag = "row align-y-center gap-small auto-xy", 
            LayoutOrder = 1
        }, {
            Icon = v1.createElement(v3.Icon, {
                name = l_Enums_0.IconName.Clock, 
                variant = l_Enums_0.IconVariant.Regular, 
                size = l_Enums_0.IconSize.Small, 
                LayoutOrder = 1
            }), 
            Label = v1.createElement(l_Text_0, {
                tag = "auto-xy text-label-medium content-emphasis", 
                Text = v14.itemExpires, 
                LayoutOrder = 2
            })
        })
    };
    local l_createElement_1 = v1.createElement;
    local l_l_View_0_1 = l_View_0;
    local v21 = {
        tag = "auto-xy", 
        LayoutOrder = 2
    };
    local v22 = {};
    local l_createElement_2 = v1.createElement;
    local l_l_Text_0_0 = l_Text_0;
    local v25 = {
        tag = "auto-xy text-body-medium content-emphasis"
    };
    local l_expirationTime_0 = v12.expirationTime;
    local v27 = DateTime.fromIsoDate(l_expirationTime_0);
    v25.Text = if not v27 then l_expirationTime_0 else v27:FormatLocalTime("MMM DD, LT", l_LocalizationService_0.RobloxLocaleId);
    v22.ExpirationText = l_createElement_2(l_l_Text_0_0, v25);
    v18.RightContent = l_createElement_1(l_l_View_0_1, v21, v22);
    return l_createElement_0(l_l_View_0_0, v17, v18);
end;