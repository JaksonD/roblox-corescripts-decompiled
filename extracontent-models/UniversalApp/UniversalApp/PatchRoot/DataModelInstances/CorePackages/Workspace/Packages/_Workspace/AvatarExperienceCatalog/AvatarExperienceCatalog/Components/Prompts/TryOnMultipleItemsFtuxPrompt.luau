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
local l_Chip_0 = v9.Chip;
local l_Assets_0 = v10.Assets;
v10.preloadAsset("pictograms/customize");
local v17 = l_Assets_0["pictograms/customize"];
return (l_withMappedNavigationParams_0(function(v18) --[[ Line: 31 ]] --[[ Name: TryOnMultipleItemsFtuxPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v9 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), v1 (copy), v2 (copy), l_View_0 (copy), v17 (copy), l_Chip_0 (copy), l_Text_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v19 = l_useLocalization_0({
        confirmButtonText = "Feature.Avatar.Action.GotIt", 
        titleText = "Feature.Catalog.Title.Checkout.TryOnMultipleItemsFtuxTitle", 
        bodyText = "Feature.Catalog.Title.Checkout.TryOnMultipleItemsFtuxBody", 
        newText = "Feature.Catalog.Label.New"
    });
    local v20 = v9.Hooks.useTokens();
    local v21 = l_getIconSize_0(l_IconSize_0.XXLarge);
    local v22 = v1.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v18 (copy), v2 (ref)
        v18.navigation.dispatch(v2.Actions.back(nil));
    end, {
        v18.navigation
    });
    local v23 = v1.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v22 (copy), v18 (copy)
        v22();
        v18.onConfirm();
    end, {
        v18.onConfirm, 
        v22
    });
    local v24, v25 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v25 (copy)
        v25(true);
    end, {});
    local function v26() --[[ Line: 58 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), v21 (copy), v9 (ref), v17 (ref), v20 (copy), l_Chip_0 (ref), v19 (copy), l_Text_0 (ref)
        return {
            ViewFrame = v1.createElement(l_View_0, {
                tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
            }, {
                GraphicContainer = v1.createElement(l_View_0, {
                    tag = "position-center-center grow padding-bottom-small", 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, v21)
                }, {
                    ClothingCategoryArt = v1.createElement(v9.Image, {
                        tag = "size-full", 
                        Image = v17 and v17.assetId, 
                        ScaleType = Enum.ScaleType.Fit, 
                        imageStyle = v20.Color.System.Contrast
                    })
                }), 
                Chip = v1.createElement(l_Chip_0, {
                    text = v19.newText, 
                    onActivated = function() --[[ Line: 77 ]] --[[ Name: onActivated ]]

                    end, 
                    LayoutOrder = 2, 
                    Selectable = false
                }), 
                PromptBodyTitle = v1.createElement(l_Text_0, {
                    tag = " auto-xy padding-bottom-small padding-top-medium text-align-x-left text-heading-small text-wrap", 
                    Text = v19.titleText, 
                    LayoutOrder = 3
                }), 
                PromptBodyText = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap", 
                    Text = v19.bodyText, 
                    LayoutOrder = 4
                })
            })
        };
    end;
    return v1.createElement(l_AXPartialPageModal_0, {
        visible = v24, 
        onBackgroundPress = v23, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v23, 
                        text = v19.confirmButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, (v26()));
end));