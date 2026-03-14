local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_AXPartialPageModal_0 = require(l_Parent_0.AvatarExperienceCommon).Components.AXPartialPageModal;
local v5 = require(l_Parent_0.Foundation);
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_InputSize_0 = v5.Enums.InputSize;
return function(v10) --[[ Line: 20 ]] --[[ Name: GoToCustomizeToEditPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v11 = l_useLocalization_0({
        confirmButtonText = "Feature.Catalog.Action.Checkout.GoToCustomize", 
        cancelButtonText = "Feature.Avatar.Action.Stay", 
        titleText = "Feature.Catalog.Title.Checkout.GoToCustomizeTitle", 
        bodyText = "Feature.Catalog.Label.Checkout.GoToCustomizeBody"
    });
    local v12 = v1.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v10 (copy), v2 (ref)
        v10.navigation.dispatch(v2.Actions.back(nil));
    end, {
        v10.navigation
    });
    local v13 = v1.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v12 (copy), v10 (copy)
        v12();
        v10.onConfirm();
    end, {
        v10.onConfirm, 
        v12
    });
    local v14 = v1.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy)
        v12();
    end, {
        v12
    });
    local function v15() --[[ Line: 41 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), l_Text_0 (ref), v11 (copy)
        return {
            ViewFrame = v1.createElement(l_View_0, {
                tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
            }, {
                PromptBodyTitle = v1.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap", 
                    Text = v11.titleText, 
                    LayoutOrder = 2
                }), 
                PromptBodyText = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap", 
                    Text = v11.bodyText, 
                    LayoutOrder = 3
                })
            })
        };
    end;
    return v1.createElement(l_AXPartialPageModal_0, {
        onBackgroundPress = v14, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v13, 
                        text = v11.confirmButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium
                    }
                }, 
                {
                    props = {
                        onActivated = v14, 
                        text = v11.cancelButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, (v15()));
end;