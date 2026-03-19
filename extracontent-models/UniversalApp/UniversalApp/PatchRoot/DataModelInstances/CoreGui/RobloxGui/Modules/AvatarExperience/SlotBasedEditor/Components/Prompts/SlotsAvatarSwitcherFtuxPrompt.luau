local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AXPartialPageModal_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Components.AXPartialPageModal;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_IconOnlyMenu_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar).IconOnlyMenu;
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local v12 = require(l_CorePackages_0.Packages.Foundation);
local l_Text_0 = v12.Text;
local l_useTokens_0 = v12.Hooks.useTokens;
local l_View_0 = v12.View;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_useStyleMetadata_0 = v11.Core.Style.useStyleMetadata;
local l_ThemeName_0 = v11.App.Style.Constants.ThemeName;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Icon_0 = v12.Icon;
local l_IconSize_0 = v12.Enums.IconSize;
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local function v24(v23) --[[ Line: 37 ]] --[[ Name: selectUserId ]]
    return v23.LocalUserId;
end;
return (v6(function(v25) --[[ Line: 41 ]] --[[ Name: SlotsAvatarSwitcherFtuxPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), v24 (copy), v2 (copy), v7 (copy), l_useStyleMetadata_0 (copy), l_ThemeName_0 (copy), l_View_0 (copy), l_IconOnlyMenu_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonType_0 (copy)
    local v26 = l_useLocalization_0({
        confirmButtonText = "Feature.Avatar.Action.GotIt", 
        avatarSwitcherTitle = "Feature.Avatar.Title.SavedAvatarsLocation", 
        avatarSwitcherMessageProfile = "Feature.Avatar.Message.NewControlLocationProfile", 
        avatarSwitcherMessageBundles = "Feature.Avatar.Message.NewControlLocationFullBody", 
        profilePhoto = "Feature.Avatar.Label.Title.ProfilePhoto"
    });
    local v27 = l_useTokens_0();
    local v28 = l_useSelector_0(v24);
    local v29 = v2.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v7 (ref), v25 (copy)
        v7.closeFocusedScreen(v25.navigation);
    end, {
        v25.navigation
    });
    local v30 = l_useStyleMetadata_0().ThemeName == l_ThemeName_0.Dark and v27.Color.Surface.Surface_200 or v27.Color.Extended.Gray.Gray_400;
    local function v31() --[[ Line: 60 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), v30 (copy), v27 (copy), l_IconOnlyMenu_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v28 (copy), l_AvatarHeadShot_0 (ref), v26 (copy), l_Text_0 (ref), l_Icon_0 (ref), l_IconSize_0 (ref)
        return {
            ViewFrame = v2.createElement(l_View_0, {
                tag = "auto-y grow size-full-0 col align-x-left align-y-top"
            }, {
                ControlBarDiagram = v2.createElement(l_View_0, {
                    tag = "auto-y position-center-center self-center grow radius-medium size-full-0", 
                    LayoutOrder = 1, 
                    backgroundStyle = v30, 
                    padding = {
                        top = UDim.new(0, v27.Margin.Large), 
                        bottom = UDim.new(0, v27.Margin.Large)
                    }
                }, {
                    IconOnlyMenu = v2.createElement(l_IconOnlyMenu_0, {
                        direction = "vertical", 
                        activeItemId = "", 
                        Position = UDim2.fromScale(0.3, 0), 
                        items = {
                            {
                                type = "image", 
                                id = "1", 
                                thumbnailUrl = l_getRbxthumbWithTypeSizeAndOptions_0(v28, l_AvatarHeadShot_0, 150, true, true)
                            }, 
                            {
                                type = "icon", 
                                id = "2", 
                                icon = "icons/menu/customize"
                            }, 
                            {
                                type = "icon", 
                                id = "3", 
                                icon = "icons/common/hamburgermenu", 
                                toolTipConfig = {
                                    bodyText = v26.profilePhoto, 
                                    open = true
                                }
                            }
                        }
                    })
                }), 
                PromptBodyTitle = v2.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-small padding-top-xxlarge text-align-x-left text-truncate-end text-heading-small text-wrap", 
                    Text = v26.avatarSwitcherTitle, 
                    LayoutOrder = 2
                }), 
                PromptBodyText1 = v2.createElement(l_View_0, {
                    tag = "auto-y row align-x-left align-y-center size-full-0", 
                    LayoutOrder = 3
                }, {
                    BodyText = v2.createElement(l_Text_0, {
                        tag = "auto-xy padding-y-small text-align-x-left text-truncate-end text-body-large text-wrap", 
                        Text = v26.avatarSwitcherMessageProfile, 
                        LayoutOrder = 1
                    }), 
                    MenuIcon = v2.createElement(l_Icon_0, {
                        name = "icons/common/hamburgermenu", 
                        size = l_IconSize_0.Medium, 
                        LayoutOrder = 2
                    })
                }), 
                PromptBodyText2 = v2.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-xxlarge text-align-x-left text-truncate-end text-body-large text-wrap", 
                    Text = v26.avatarSwitcherMessageBundles, 
                    LayoutOrder = 4
                })
            })
        };
    end;
    return v2.createElement(l_AXPartialPageModal_0, {
        screenSize = v25.screenSize, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = function() --[[ Line: 143 ]] --[[ Name: onActivated ]]
                            -- upvalues: v29 (copy), v25 (copy)
                            v29();
                            v25.onConfirm();
                        end, 
                        text = v26.confirmButtonText
                    }
                }
            }
        }
    }, (v31()));
end));