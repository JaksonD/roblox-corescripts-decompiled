local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FFlagAvatarSwitcherExpiredItemsWarning_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning;
return function(v6) --[[ Line: 21 ]] --[[ Name: AvatarCompatibilityWarning ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), l_FFlagAvatarSwitcherExpiredItemsWarning_0 (copy), v1 (copy), v2 (copy)
    local v7 = l_useTokens_0();
    local v8 = l_useLocalization_0({
        partiallyUnsupported = if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then nil else "Feature.AvatarSwitcher.Message.PartiallyUnsupported", 
        message = if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then v6.message else nil
    });
    return v1.createElement(v2.View, {
        tag = "size-full-0 auto-y", 
        LayoutOrder = v6.LayoutOrder
    }, {
        InfoIcon = v1.createElement(v2.Image, {
            Image = "icons/actions/info", 
            Size = UDim2.fromOffset(v7.Size.Size_500, v7.Size.Size_500), 
            LayoutOrder = 1
        }), 
        CompatibilityWarning = v1.createElement(v2.Text, {
            tag = "auto-y position-top-right anchor-top-right text-caption-small text-wrap text-align-x-left padding-top-xsmall", 
            Size = UDim2.new(1, -v7.Size.Size_500 - v7.Gap.Small, 0, 0), 
            Text = if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then v8.message else v8.partiallyUnsupported, 
            LayoutOrder = 2
        })
    });
end;