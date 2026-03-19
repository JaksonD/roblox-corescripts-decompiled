local l_Parent_0 = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.DataHydration);
local l_LaunchErrorLocalizationKeys_0 = require(l_Parent_0.GameLaunch).LaunchErrorLocalizationKeys;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(script.Parent.InExperienceDetailsPromptPlayButton);
local v6 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v6.Sheet;
local l_View_0 = v6.View;
local l_Button_0 = v6.Button;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_IconName_0 = v6.Enums.IconName;
local l_Skeleton_0 = v6.Skeleton;
local l_Radius_0 = v6.Enums.Radius;
local l_Text_0 = v6.Text;
local l_useTokens_0 = v6.Hooks.useTokens;
local l_FFlagLuaAppIedpFixPlayButton_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpFixPlayButton;
return function(v17) --[[ Line: 29 ]] --[[ Name: InExperienceDetailsPromptActions ]]
    -- upvalues: l_useTokens_0 (copy), l_LaunchErrorLocalizationKeys_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_FFlagLuaAppIedpFixPlayButton_0 (copy), v5 (copy), l_Text_0 (copy), v2 (copy), l_Button_0 (copy), l_IconName_0 (copy), l_ButtonVariant_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v18 = l_useTokens_0();
    local v19 = if not (not v17.playability or v17.playability.isPlayable) and v17.playability.playabilityStatus then l_LaunchErrorLocalizationKeys_0[v17.playability.playabilityStatus] else nil;
    local v20 = l_useLocalization_0({
        playButtonUnavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        playabilityError = v19
    });
    return v1.createElement(l_Sheet_0.Actions, nil, {
        View = v1.createElement(l_View_0, {
            tag = "col gap-small size-full-0 auto-y"
        }, if l_FFlagLuaAppIedpFixPlayButton_0 then {
            PlayButton = v1.createElement(v5, {
                playability = v17.playability, 
                onJoin = v17.onJoin, 
                rootPlaceId = v17.rootPlaceId, 
                playabilityRetrievalStatus = v17.playabilityRetrievalStatus, 
                playButtonUnavailableText = v20.playButtonUnavailable
            }), 
            Text = if not (not v17.playability or v17.playability.isPlayable) and v20.playabilityError then v1.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v20.playabilityError, 
                tag = "text-body-small content-default text-truncate-split auto-xy"
            }) else nil
        } else if not v17.playability then {
            PlayButton = if v17.playabilityRetrievalStatus == v2.DataStatus.Failed then v1.createElement(l_Button_0, {
                LayoutOrder = 1, 
                width = UDim.new(1, 0), 
                icon = l_IconName_0.PlayLarge, 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = v17.onJoin
            }) else v1.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, v18.Size.Size_1000), 
                radius = l_Radius_0.Medium
            })
        } else {
            PlayButton = v1.createElement(l_Button_0, {
                LayoutOrder = 1, 
                width = UDim.new(1, 0), 
                text = if v17.playability.isPlayable then nil else v20.playButtonUnavailable, 
                icon = if v17.playability.isPlayable then l_IconName_0.PlayLarge else l_IconName_0.CircleSlash, 
                variant = if v17.playability.isPlayable then l_ButtonVariant_0.Emphasis else l_ButtonVariant_0.Standard, 
                onActivated = v17.onJoin, 
                isDisabled = not v17.playability.isPlayable
            }), 
            Text = if not v17.playability.isPlayable and v20.playabilityError then v1.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v20.playabilityError, 
                tag = "text-body-small content-default text-truncate-split auto-xy"
            }) else nil
        })
    });
end;