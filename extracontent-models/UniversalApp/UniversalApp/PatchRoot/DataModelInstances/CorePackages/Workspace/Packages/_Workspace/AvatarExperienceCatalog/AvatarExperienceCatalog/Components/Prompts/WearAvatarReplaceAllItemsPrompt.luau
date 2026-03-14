local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_withMappedNavigationParams_0 = require(l_Parent_0.AvatarExperienceNavigation).withMappedNavigationParams;
local l_AXPartialPageModal_0 = require(l_Parent_0.AvatarExperienceCommon).Components.AXPartialPageModal;
local v7 = require(l_Parent_0.Foundation);
local l_View_0 = v7.View;
local l_Text_0 = v7.Text;
local l_Checkbox_0 = v7.Checkbox;
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_InputSize_0 = v7.Enums.InputSize;
local v13 = require(l_script_FirstAncestor_0.Hooks.useMultiItemShoppingFtux);
return (l_withMappedNavigationParams_0(function(v14) --[[ Line: 23 ]] --[[ Name: WearAvatarReplaceAllItemsPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v13 (copy), v2 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy), l_Checkbox_0 (copy), l_InputSize_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy)
    local v15 = l_useLocalization_0({
        confirmButtonText = "Feature.Catalog.Action.Checkout.Wear", 
        cancelButtonText = "Feature.Avatar.Action.Cancel", 
        titleText = "Feature.Catalog.Title.Checkout.WearAvatarReplaceAllItemsTitle", 
        bodyText = "Feature.Catalog.Label.Checkout.WearAvatarReplaceAllItemsBody", 
        checkboxText = "Feature.Catalog.Label.Checkout.DontWarnAgainText"
    });
    local v16 = v13();
    local v17, v18 = v2.useState(false);
    local v19 = v2.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v14 (copy), v3 (ref), v16 (copy)
        v14.navigation.dispatch(v3.Actions.back(nil));
        v16.incrementWearAvatarReplaceAllItemsPromptCount();
    end, {
        v14.navigation
    });
    local v20 = v2.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v19 (copy), v14 (copy), v17 (copy)
        v19();
        v14.onConfirm(v17);
    end, {
        v14.onConfirm, 
        v19, 
        v17
    });
    local v21 = v2.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v19 (copy)
        v19();
    end, {
        v19
    });
    local function v22() --[[ Line: 51 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_Text_0 (ref), v15 (copy), l_Checkbox_0 (ref), v17 (copy), v18 (copy), l_InputSize_0 (ref)
        return {
            ViewFrame = v2.createElement(l_View_0, {
                tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
            }, {
                PromptBodyTitle = v2.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap", 
                    Text = v15.titleText, 
                    LayoutOrder = 1
                }), 
                PromptBodyText = v2.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-xxlarge text-align-x-left text-truncate-end text-body-large text-wrap", 
                    Text = v15.bodyText, 
                    LayoutOrder = 2
                }), 
                DontWarnCheckbox = v2.createElement(l_Checkbox_0, {
                    isChecked = v17, 
                    onActivated = function() --[[ Line: 68 ]] --[[ Name: onActivated ]]
                        -- upvalues: v18 (ref), v17 (ref)
                        v18(not v17);
                    end, 
                    size = l_InputSize_0.Medium, 
                    label = v15.checkboxText, 
                    LayoutOrder = 3
                })
            })
        };
    end;
    return v2.createElement(l_AXPartialPageModal_0, {
        onBackgroundPress = v21, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v20, 
                        text = v15.confirmButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium
                    }
                }, 
                {
                    props = {
                        onActivated = v21, 
                        text = v15.cancelButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, (v22()));
end));