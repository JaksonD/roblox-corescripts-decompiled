local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_withMappedNavigationParams_0 = require(l_Parent_0.AvatarExperienceNavigation).withMappedNavigationParams;
local l_AXPartialPageModal_0 = require(l_Parent_0.AvatarExperienceCommon).Components.AXPartialPageModal;
local v6 = require(l_Parent_0.UIBlox);
local l_getIconSize_0 = v6.App.ImageSet.getIconSize;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local v9 = require(l_Parent_0.Foundation);
local v10 = require(l_Parent_0.FoundationCloudAssets);
local l_View_0 = v9.View;
local l_Text_0 = v9.Text;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_InputSize_0 = v9.Enums.InputSize;
local l_Assets_0 = v10.Assets;
v10.preloadAsset("pictograms/makeup_look");
local v16 = l_Assets_0["pictograms/makeup_look"];
return (l_withMappedNavigationParams_0(function(v17) --[[ Line: 31 ]] --[[ Name: MakeupReleaseFtuxPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v9 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), v2 (copy), l_View_0 (copy), v16 (copy), l_Text_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v18 = l_useLocalization_0({
        viewButtonText = "CommonUI.Messages.Action.View", 
        dismissButtonText = "CommonUI.Messages.Action.Dismiss", 
        titleText = "Feature.Avatar.Title.MakeupIntroFtux", 
        bodyText = "Feature.Avatar.Description.MakeupIntroFtux"
    });
    local v19, v20 = v1.useState(false);
    local v21 = v9.Hooks.useTokens();
    local v22 = l_getIconSize_0(l_IconSize_0.XXLarge);
    local v23 = v1.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v17 (copy), v2 (ref)
        v17.navigation.dispatch(v2.Actions.back(nil));
    end, {
        v17.navigation
    });
    local v24 = v1.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v23 (copy), v17 (copy)
        v23();
        v17.onView();
    end, {
        v17.onView, 
        v23
    });
    local v25 = v1.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v23 (copy), v17 (copy)
        v23();
        v17.onDismiss();
    end, {
        v17.onDismiss, 
        v23
    });
    v1.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v20 (copy)
        v20(true);
    end, {});
    local v26 = v1.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), v22 (copy), v9 (ref), v16 (ref), v21 (copy), l_Text_0 (ref), v18 (copy)
        return {
            ViewFrame = v1.createElement(l_View_0, {
                tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
            }, {
                GraphicContainer = v1.createElement(l_View_0, {
                    tag = "position-center-center grow padding-bottom-small", 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, v22)
                }, {
                    MakeupCategoryArt = v1.createElement(v9.Image, {
                        tag = "size-full", 
                        Image = v16 and v16.assetId, 
                        ScaleType = Enum.ScaleType.Fit, 
                        imageStyle = v21.Color.Content.Emphasis
                    })
                }), 
                PromptBodyTitle = v1.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-small padding-top-medium text-align-x-left text-heading-small text-wrap", 
                    Text = v18.titleText, 
                    LayoutOrder = 3
                }), 
                PromptBodyText = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap", 
                    Text = v18.bodyText, 
                    LayoutOrder = 4
                })
            })
        };
    end, {
        v22, 
        v21, 
        v18, 
        v16
    });
    return v1.createElement(l_AXPartialPageModal_0, {
        visible = v19, 
        onBackgroundPress = v25, 
        buttonStackProps = {
            rowLayout = true, 
            buttons = {
                {
                    props = {
                        onActivated = v24, 
                        text = v18.viewButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium
                    }
                }, 
                {
                    props = {
                        onActivated = v25, 
                        text = v18.dismissButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, v26());
end));