local l_Parent_0 = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.DataHydration);
local v3 = require(l_Parent_0.Foundation);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_IconName_0 = v3.Enums.IconName;
local l_Skeleton_0 = v3.Skeleton;
local l_Radius_0 = v3.Enums.Radius;
local l_useTokens_0 = v3.Hooks.useTokens;
return function(v10) --[[ Line: 22 ]] --[[ Name: InExperienceDetailsPromptPlayButton ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v1 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Button_0 (copy), l_IconName_0 (copy), l_ButtonVariant_0 (copy)
    local v11 = l_useTokens_0();
    if not v10.rootPlaceId or not v10.playability and v10.playabilityRetrievalStatus ~= v2.DataStatus.Failed then
        return v1.createElement(l_Skeleton_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, v11.Size.Size_1000), 
            radius = l_Radius_0.Medium
        });
    elseif not v10.playability then
        return v1.createElement(l_Button_0, {
            LayoutOrder = 1, 
            width = UDim.new(1, 0), 
            icon = l_IconName_0.PlayLarge, 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = v10.onJoin
        });
    else
        return v1.createElement(l_Button_0, {
            LayoutOrder = 1, 
            width = UDim.new(1, 0), 
            text = if v10.playability.isPlayable then nil else v10.playButtonUnavailableText, 
            icon = if v10.playability.isPlayable then l_IconName_0.PlayLarge else l_IconName_0.CircleSlash, 
            variant = if v10.playability.isPlayable then l_ButtonVariant_0.Emphasis else l_ButtonVariant_0.Standard, 
            onActivated = v10.onJoin, 
            isDisabled = not v10.playability.isPlayable
        });
    end;
end;