local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_withMappedNavigationParams_0 = require(l_Parent_0.AvatarExperienceNavigation).withMappedNavigationParams;
local l_AXPartialPageModal_0 = require(l_Parent_0.AvatarExperienceCommon).Components.AXPartialPageModal;
local v6 = require(l_Parent_0.Foundation);
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
return (l_withMappedNavigationParams_0(function(v11) --[[ Line: 21 ]] --[[ Name: CartUnavailableItemsPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v12 = l_useLocalization_0({
        confirmButtonText = "Feature.Catalog.Action.Checkout.UnavailableItems", 
        titleText = "Feature.Catalog.Title.Checkout.UnavailableItems", 
        bodyText = "Feature.Catalog.Message.Checkout.UnavailableItems"
    });
    local v13 = v1.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v11 (copy), v2 (ref)
        v11.navigation.dispatch(v2.Actions.back(nil));
    end, {
        v11.navigation
    });
    local v14 = v1.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v13 (copy), v11 (copy)
        v13();
        if v11.onConfirm then
            v11.onConfirm();
        end;
    end, {
        v11.onConfirm, 
        v13
    });
    local function v15() --[[ Line: 39 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), l_Text_0 (ref), v12 (copy)
        return {
            ViewFrame = v1.createElement(l_View_0, {
                tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
            }, {
                PromptBodyTitle = v1.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap", 
                    Text = v12.titleText, 
                    LayoutOrder = 1
                }), 
                PromptBodyText = v1.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-xxlarge text-align-x-left text-truncate-end text-body-large text-wrap", 
                    Text = v12.bodyText, 
                    LayoutOrder = 2
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
                        onActivated = v14, 
                        text = v12.confirmButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, (v15()));
end));