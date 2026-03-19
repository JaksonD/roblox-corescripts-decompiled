local l_Parent_0 = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.DataHydration);
local v3 = require(l_Parent_0.Foundation);
local l_Badge_0 = v3.Badge;
local l_Chip_0 = v3.Chip;
local l_Enums_0 = v3.Enums;
local l_BadgeVariant_0 = l_Enums_0.BadgeVariant;
local l_ScrollView_0 = v3.ScrollView;
local l_Visibility_0 = v3.Enums.Visibility;
local l_useTokens_0 = v3.Hooks.useTokens;
local v11 = game:DefineFastFlag("LuaAppIedpSwitchChipToBadge", false);
return function(v12) --[[ Line: 22 ]] --[[ Name: InExperienceDetailsPromptContent ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v11 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy), l_Chip_0 (copy), l_Enums_0 (copy)
    local v13 = l_useTokens_0();
    return v1.createElement(l_ScrollView_0, {
        tag = "size-full-0 auto-y", 
        ClipsDescendants = false, 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v13.Gap.Small)
        }, 
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.X, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            scrollBarVisibility = l_Visibility_0.None
        }
    }, {
        AgeRecommendation = if v12.ageRecommendation and v12.ageRecommendation.displayNameWithHeaderShort then if v11 then v1.createElement(l_Badge_0, {
            text = v12.ageRecommendation.displayNameWithHeaderShort, 
            LayoutOrder = 1, 
            variant = l_BadgeVariant_0.Neutral
        }) else v1.createElement(l_Chip_0, {
            text = v12.ageRecommendation.displayNameWithHeaderShort, 
            LayoutOrder = 1, 
            onActivated = function() --[[ Line: 49 ]] --[[ Name: onActivated ]]

            end, 
            Selectable = false
        }) else nil, 
        Rating = if v12.rating then if v11 then v1.createElement(l_Badge_0, {
            text = v12.rating, 
            LayoutOrder = 2, 
            variant = l_BadgeVariant_0.Neutral, 
            icon = {
                name = l_Enums_0.IconName.ThumbUp, 
                variant = l_Enums_0.IconVariant.Filled, 
                position = l_Enums_0.IconPosition.Left
            }
        }) else v1.createElement(l_Chip_0, {
            text = v12.rating, 
            LayoutOrder = 2, 
            leading = {
                iconName = l_Enums_0.IconName.ThumbUp, 
                iconVariant = l_Enums_0.IconVariant.Filled
            }, 
            onActivated = function() --[[ Line: 72 ]] --[[ Name: onActivated ]]

            end, 
            Selectable = false
        }) else nil
    });
end;