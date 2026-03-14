local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local l_AXPartialPageModal_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Components.AXPartialPageModal;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_ThemeName_0 = v7.App.Style.Constants.ThemeName;
local l_useStyleMetadata_0 = v7.Core.Style.useStyleMetadata;
local l_getIconSize_0 = v7.App.ImageSet.getIconSize;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local v12 = require(l_CorePackages_0.Packages.Foundation);
local l_View_0 = v12.View;
local l_Text_0 = v12.Text;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
return (v4(function(v16) --[[ Line: 27 ]] --[[ Name: SlotsCustomizeFtuxPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyleMetadata_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_ThemeName_0 (copy), v2 (copy), v6 (copy), l_View_0 (copy), v12 (copy), l_Text_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonType_0 (copy)
    local v17 = l_useLocalization_0({
        confirmButtonText = "Feature.Avatar.Action.GotIt", 
        customizeIntroTitle = "Feature.Avatar.Title.NewCustomizeLook", 
        customizeIntroMessage = "Feature.Avatar.Message.NewCustomize"
    });
    local v18 = l_useStyleMetadata_0();
    local v19 = l_getIconSize_0(l_IconSize_0.XXLarge);
    local v20 = v18.ThemeName == l_ThemeName_0.Dark and "icons/graphic/clothes_category_art_dark" or "icons/graphic/clothes_category_art_light";
    local v21 = v2.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v6 (ref), v16 (copy)
        v6.closeFocusedScreen(v16.navigation);
    end, {
        v16.navigation
    });
    local function v22() --[[ Line: 44 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), v19 (copy), v12 (ref), v20 (copy), l_Text_0 (ref), v17 (copy)
        return {
            ViewFrame = v2.createElement(l_View_0, {
                tag = "auto-y padding-bottom-medium col align-x-left align-y-top", 
                Size = UDim2.fromScale(1, 0)
            }, {
                GraphicContainer = v2.createElement(l_View_0, {
                    tag = "position-center-center grow padding-bottom-small", 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, v19)
                }, {
                    ClothingCategoryArt = v2.createElement(v12.Image, {
                        tag = "size-full", 
                        Image = v20, 
                        ScaleType = Enum.ScaleType.Fit
                    })
                }), 
                PromptBodyTitle = v2.createElement(l_Text_0, {
                    tag = " auto-xy padding-y-small text-align-x-left text-truncate-end text-heading-small text-wrap", 
                    Text = v17.customizeIntroTitle, 
                    LayoutOrder = 2
                }), 
                PromptBodyText = v2.createElement(l_Text_0, {
                    tag = "auto-xy padding-y-small text-align-x-left text-truncate-end text-body-large text-wrap", 
                    Text = v17.customizeIntroMessage, 
                    LayoutOrder = 3
                })
            })
        };
    end;
    return v2.createElement(l_AXPartialPageModal_0, {
        screenSize = v16.screenSize, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = function() --[[ Line: 82 ]] --[[ Name: onActivated ]]
                            -- upvalues: v21 (copy), v16 (copy)
                            v21();
                            v16.onConfirm();
                        end, 
                        text = v17.confirmButtonText
                    }
                }
            }
        }
    }, (v22()));
end));