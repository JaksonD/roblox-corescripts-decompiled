local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_withMappedNavigationParams_0 = require(l_Parent_0.AvatarExperienceNavigation).withMappedNavigationParams;
local l_AXPartialPageModal_0 = require(l_Parent_0.AvatarExperienceCommon).Components.AXPartialPageModal;
local v6 = require(l_Parent_0.Foundation);
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_Checkbox_0 = v6.Checkbox;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
return (l_withMappedNavigationParams_0(function(v12) --[[ Line: 22 ]] --[[ Name: MakeupMax6LayersPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), l_Checkbox_0 (copy), l_InputSize_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy)
    local v13 = l_useLocalization_0({
        confirmButtonText = "Feature.Catalog.Action.Replace", 
        cancelButtonText = "Feature.Avatar.Action.Cancel", 
        titleText = "Feature.Catalog.Title.Makeup.MakeupMax6LayersPromptTitle", 
        bodyText = "Feature.Catalog.Label.Makeup.MakeupMax6LayersPromptBody", 
        checkboxText = "Feature.Catalog.Label.Checkout.DontWarnAgainText"
    });
    local v14, v15 = v1.useState(false);
    local v16 = v1.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v2 (ref)
        v12.navigation.dispatch(v2.Actions.back(nil));
    end, {
        v12.navigation
    });
    local v17 = v1.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v16 (copy), v12 (copy), v14 (copy)
        v16();
        v12.onConfirm(v14);
    end, {
        v12.onConfirm, 
        v16, 
        v14
    });
    local v18 = v1.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v16 (copy)
        v16();
    end, {
        v16
    });
    local v19 = v1.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), l_Text_0 (ref), v13 (copy), l_Checkbox_0 (ref), v14 (copy), v15 (copy), l_InputSize_0 (ref)
        return {
            ViewFrame = v1.createElement(l_View_0, {
                tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
            }, {
                PromptBodyTitle = v1.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap", 
                    Text = v13.titleText, 
                    LayoutOrder = 1
                }), 
                PromptBodyText = v1.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-xxlarge text-align-x-left text-truncate-end text-body-large text-wrap", 
                    Text = v13.bodyText, 
                    LayoutOrder = 2
                }), 
                DontWarnCheckbox = v1.createElement(l_Checkbox_0, {
                    isChecked = v14, 
                    onActivated = function() --[[ Line: 63 ]] --[[ Name: onActivated ]]
                        -- upvalues: v15 (ref), v14 (ref)
                        v15(not v14);
                    end, 
                    size = l_InputSize_0.Medium, 
                    label = v13.checkboxText, 
                    LayoutOrder = 3
                })
            })
        };
    end, {
        v13, 
        v14
    });
    return v1.createElement(l_AXPartialPageModal_0, {
        onBackgroundPress = v18, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v17, 
                        text = v13.confirmButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium
                    }
                }, 
                {
                    props = {
                        onActivated = v18, 
                        text = v13.cancelButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, v19());
end));