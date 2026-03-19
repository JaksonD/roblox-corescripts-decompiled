local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_AXPartialPageModal_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.AXPartialPageModal;
local v6 = require(l_CorePackages_0.Packages.Foundation);
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v12) --[[ Line: 19 ]] --[[ Name: EnhancedAvatarHeadsFtuxPrompt ]]
    -- upvalues: l_useNavigation_0 (copy), l_useLocalization_0 (copy), v2 (copy), v11 (copy), l_View_0 (copy), l_Text_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v13 = l_useNavigation_0();
    local v14 = l_useLocalization_0({
        confirmButtonText = "Feature.Avatar.Action.GotIt", 
        enhancedAvatarHeadsTitle = "Feature.Avatar.Title.EnhancedAvatarHeads", 
        enhancedAvatarHeadsMessage = "Feature.Avatar.Message.EnhancedAvatarHeads"
    });
    local v15 = v13.state.params or {};
    local v16 = v12.onConfirm or v15.onConfirm;
    local v17 = v2.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v11 (ref), v13 (copy)
        v11.closeOverlay(v13);
    end, {
        v13
    });
    local v18 = v2.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v17 (copy), v16 (copy)
        v17();
        if v16 then
            v16();
        end;
    end, {
        v16, 
        v17
    });
    local v19, v20 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v20 (copy)
        v20(true);
    end, {});
    local function v21() --[[ Line: 49 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_Text_0 (ref), v14 (copy)
        return {
            ViewFrame = v2.createElement(l_View_0, {
                tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
            }, {
                PromptBodyTitle = v2.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-small padding-top-medium text-align-x-left text-heading-small text-wrap", 
                    Text = v14.enhancedAvatarHeadsTitle, 
                    LayoutOrder = 1
                }), 
                PromptBodyText = v2.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left text-body-large text-wrap", 
                    Text = v14.enhancedAvatarHeadsMessage, 
                    LayoutOrder = 2
                })
            })
        };
    end;
    return v2.createElement(l_AXPartialPageModal_0, {
        visible = v19, 
        onBackgroundPress = v18, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v18, 
                        text = v14.confirmButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, (v21()));
end;