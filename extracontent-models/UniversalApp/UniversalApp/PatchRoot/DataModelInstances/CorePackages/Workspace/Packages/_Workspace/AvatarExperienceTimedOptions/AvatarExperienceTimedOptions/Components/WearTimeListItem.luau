local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Localization);
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_NumberLocalization_0 = v3.NumberLocalization;
local v7 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v7.Hooks.useTokens;
local l_Text_0 = v7.Text;
local l_View_0 = v7.View;
local l_Enums_0 = v7.Enums;
return (v2.forwardRef(function(v12, v13) --[[ Line: 23 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_useLocalization_0 (copy), l_View_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), v7 (copy), l_NumberLocalization_0 (copy)
    local v14 = l_useTokens_0();
    local v15 = v2.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: l_Localization_0 (ref), l_LocalizationService_0 (ref)
        return l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    end, {});
    local v16 = l_useLocalization_0({
        infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite", 
        xDay = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay"; 
            num = v12.days
        }, 
        xDays = {
            "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays"; 
            num = v12.days
        }
    });
    local v17 = nil;
    v17 = if v12.days == 0 then v16.infinite else if v12.days == 1 then v16.xDay else v16.xDays;
    return v2.createElement(l_View_0, {
        tag = "row align-y-center gap-medium padding-medium radius-medium size-full-0 auto-y", 
        ref = v13, 
        onActivated = v12.onActivated, 
        backgroundStyle = if v12.isActive then v14.Color.Shift.Shift_300 else nil, 
        LayoutOrder = v12.LayoutOrder, 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }, 
        selection = {
            Selectable = true
        }
    }, {
        ContentContainer = v2.createElement(l_View_0, {
            tag = "row align-y-center size-full-0 auto-y flex-x-between", 
            LayoutOrder = 1
        }, {
            DurationText = v2.createElement(l_Text_0, {
                tag = "auto-xy", 
                Text = v17, 
                textStyle = v14.Color.Content.Emphasis, 
                fontStyle = {
                    Font = v14.Typography.LabelMedium.Font, 
                    FontSize = v14.FontSize.FontSize_400
                }, 
                LayoutOrder = 1, 
                selection = {
                    Selectable = false
                }
            }), 
            PriceContainer = v2.createElement(l_View_0, {
                tag = "row align-y-center gap-xsmall auto-xy", 
                LayoutOrder = 2
            }, {
                RobuxIcon = v2.createElement(v7.Icon, {
                    name = l_Enums_0.IconName.Robux, 
                    variant = l_Enums_0.IconVariant.Regular, 
                    size = l_Enums_0.IconSize.Medium, 
                    style = v14.Color.Content.Default, 
                    LayoutOrder = 1
                }), 
                PriceText = v2.createElement(l_Text_0, {
                    tag = "auto-xy", 
                    Text = l_NumberLocalization_0.localize(v12.price, v15:GetLocale()), 
                    textStyle = v14.Color.Content.Default, 
                    fontStyle = {
                        Font = v14.Typography.LabelMedium.Font, 
                        FontSize = v14.FontSize.FontSize_400
                    }, 
                    LayoutOrder = 2, 
                    selection = {
                        Selectable = false
                    }
                })
            })
        })
    });
end));