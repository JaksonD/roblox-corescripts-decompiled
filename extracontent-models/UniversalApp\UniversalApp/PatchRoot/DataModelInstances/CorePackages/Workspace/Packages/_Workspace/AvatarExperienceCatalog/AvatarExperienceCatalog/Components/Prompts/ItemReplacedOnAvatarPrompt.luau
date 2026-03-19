local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.RoactNavigation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_withMappedNavigationParams_0 = require(l_Parent_0.AvatarExperienceNavigation).withMappedNavigationParams;
local v6 = require(l_Parent_0.AvatarExperienceCommon);
local l_AXPartialPageModal_0 = v6.Components.AXPartialPageModal;
local l_CatalogItemCard_0 = v6.Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v10 = require(l_Parent_0.Foundation);
local l_View_0 = v10.View;
local l_Text_0 = v10.Text;
local l_ButtonVariant_0 = v10.Enums.ButtonVariant;
local l_InputSize_0 = v10.Enums.InputSize;
local l_IconSize_0 = v10.Enums.IconSize;
local function _(v16, v17) --[[ Line: 34 ]]
    return (("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v17, v16));
end;
return (l_withMappedNavigationParams_0(function(v19) --[[ Line: 38 ]] --[[ Name: ItemReplacedOnAvatarPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v3 (copy), l_View_0 (copy), l_CatalogItemCard_0 (copy), l_ItemCardThumbnail_0 (copy), v10 (copy), v2 (copy), l_IconSize_0 (copy), l_Text_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v20 = l_useLocalization_0({
        confirmButtonText = "CommonUI.Controls.Action.OK", 
        titleText = "Feature.Catalog.Title.Checkout.ItemReplacedOnAvatarTitle", 
        bodyText = "Feature.Catalog.Label.Checkout.ItemReplacedOnAvatarBody"
    });
    local v21 = v1.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v19 (copy), v3 (ref)
        v19.navigation.dispatch(v3.Actions.back(nil));
    end, {
        v19.navigation
    });
    local v22 = v1.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v21 (copy), v19 (copy)
        v21();
        v19.onConfirm();
    end, {
        v19.onConfirm, 
        v21
    });
    local function v42() --[[ Line: 54 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), l_CatalogItemCard_0 (ref), l_ItemCardThumbnail_0 (ref), v19 (copy), v10 (ref), v2 (ref), l_IconSize_0 (ref), l_Text_0 (ref), v20 (copy)
        local v23 = {};
        local l_createElement_0 = v1.createElement;
        local l_l_View_0_0 = l_View_0;
        local v26 = {
            tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
        };
        local v27 = {};
        local l_createElement_1 = v1.createElement;
        local l_l_View_0_1 = l_View_0;
        local v30 = {
            tag = "row size-full-0 auto-y align-x-center padding-bottom-xxlarge", 
            LayoutOrder = 1
        };
        local v31 = {};
        local l_createElement_2 = v1.createElement;
        local l_l_CatalogItemCard_0_0 = l_CatalogItemCard_0;
        local v34 = {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Selectable = false
        };
        local l_createElement_3 = v1.createElement;
        local l_l_View_0_2 = l_View_0;
        local v37 = {
            Size = UDim2.fromOffset(80, 80)
        };
        local l_createElement_4 = v1.createElement;
        local l_l_ItemCardThumbnail_0_0 = l_ItemCardThumbnail_0;
        local v40 = {};
        local l_itemId_0 = v19.beforeItem.itemId;
        v40.url = ("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v19.beforeItem.thumbType, l_itemId_0);
        v34.presentationSlot = l_createElement_3(l_l_View_0_2, v37, l_createElement_4(l_l_ItemCardThumbnail_0_0, v40));
        v31.BeforeItem = l_createElement_2(l_l_CatalogItemCard_0_0, v34);
        v31.ReplaceIcon = v1.createElement(l_View_0, {
            Size = UDim2.fromOffset(60, 80), 
            LayoutOrder = 2, 
            tag = "row auto-x auto-y align-x-center align-y-center"
        }, v1.createElement(v10.Icon, {
            name = v2.Icon.TwoArrowsSpinClockwise, 
            size = l_IconSize_0.Large, 
            variant = v2.IconVariant.Regular
        }));
        l_createElement_2 = v1.createElement;
        l_l_CatalogItemCard_0_0 = l_CatalogItemCard_0;
        v34 = {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 3, 
            Selectable = false
        };
        l_createElement_3 = v1.createElement;
        l_l_View_0_2 = l_View_0;
        v37 = {
            Size = UDim2.fromOffset(80, 80)
        };
        l_createElement_4 = v1.createElement;
        l_l_ItemCardThumbnail_0_0 = l_ItemCardThumbnail_0;
        v40 = {};
        l_itemId_0 = v19.afterItem.itemId;
        v40.url = ("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v19.afterItem.thumbType, l_itemId_0);
        v34.presentationSlot = l_createElement_3(l_l_View_0_2, v37, l_createElement_4(l_l_ItemCardThumbnail_0_0, v40));
        v31.AfterItem = l_createElement_2(l_l_CatalogItemCard_0_0, v34);
        v27.GraphicContainer = l_createElement_1(l_l_View_0_1, v30, v31);
        v27.PromptBodyTitle = v1.createElement(l_Text_0, {
            tag = "auto-xy padding-bottom-small padding-top-large text-align-x-left text-heading-small text-wrap", 
            Text = v20.titleText, 
            LayoutOrder = 2
        });
        v27.PromptBodyText = v1.createElement(l_Text_0, {
            tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap", 
            Text = v20.bodyText, 
            LayoutOrder = 3
        });
        v23.ViewFrame = l_createElement_0(l_l_View_0_0, v26, v27);
        return v23;
    end;
    return v1.createElement(l_AXPartialPageModal_0, {
        onBackgroundPress = v22, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v22, 
                        text = v20.confirmButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, (v42()));
end));