local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v8 = require(l_Modules_0.LuaApp.AppPage);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v3.App.Constant.IconSize;
local v19 = l_Images_0["icons/status/imageunavailable"];
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return v7(function(v21) --[[ Line: 73 ]] --[[ Name: OpenExperienceTraversalPrompt ]]
    -- upvalues: v4 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v6 (copy), v8 (copy), l_useStyle_0 (copy), v19 (copy), l_IconSize_0 (copy), l_GameIconReducer_0 (copy), l_InteractiveAlert_0 (copy), l_ImageSetLabel_0 (copy), l_StyledTextLabel_0 (copy), l_LinkButton_0 (copy), l_CursorKind_0 (copy), l_ButtonType_0 (copy)
    local l_params_0 = v21.navigation.state.params;
    local v23 = v4({
        title = "Feature.Catalog.Heading.GoToExperience", 
        body = {
            "Feature.Catalog.Description.AttributionAlertBody"; 
            experienceName = v21.navigation.state.params.gameName or ""
        }, 
        confirmButtonText = "CommonUI.Features.Action.Go", 
        cancelButtonText = "CommonUI.Controls.Action.Cancel", 
        viewDetailsButtonText = "Feature.Catalog.Action.ViewExperienceDetails"
    });
    local v25 = l_useSelector_0(function(v24) --[[ Line: 88 ]]
        return v24.ScreenSize;
    end, l_getUseSelectorDeepEquals_0());
    local v26 = v2.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v6 (ref), v21 (copy)
        v6.closeOverlay(v21.navigation);
    end, {
        v21.navigation
    });
    local v27 = v2.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v6 (ref), v21 (copy), l_params_0 (copy)
        v6.closeOverlay(v21.navigation);
        l_params_0.onPlayButtonActivated();
    end, {
        v21.navigation
    });
    local v29 = v2.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v8 (ref), v6 (ref), v21 (copy), l_params_0 (copy)
        local l_GameDetail_0 = v8.GameDetail;
        v6.navigateFromOverlay(v21.navigation, l_GameDetail_0, {
            detail = l_params_0.gameUniverseId, 
            extraProps = {
                mountAsFullView = true
            }
        });
    end, {
        v21.navigation
    });
    local v30 = l_useStyle_0();
    local l_Theme_0 = v30.Theme;
    local l_Font_0 = v30.Font;
    local v33 = if l_params_0.thumbnailUrl then l_params_0.thumbnailUrl else v19;
    local v34 = if l_params_0.thumbnailUrl then UDim2.fromOffset(150, 150) else UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large);
    local v35, v36 = v2.useState(nil);
    local v37, v38 = v2.useState(nil);
    local v39 = nil;
    local v41 = l_useSelector_0(function(v40) --[[ Line: 128 ]]
        -- upvalues: l_GameIconReducer_0 (ref)
        return v40[l_GameIconReducer_0.key];
    end);
    v2.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: l_params_0 (copy), v41 (copy), v36 (copy), v38 (copy)
        if not l_params_0.thumbnailUrl then
            local v42 = v41[l_params_0.gameUniverseId];
            if v42 then
                v36(v42.url);
                v38(UDim2.fromOffset(150, 150));
            end;
        end;
    end, {
        v41
    });
    if l_params_0.hideConfirmationButton then
        v39 = {
            {
                props = {
                    onActivated = v26, 
                    text = v23.cancelButtonText, 
                    layoutOrder = 0
                }, 
                isDefaultChild = true
            }
        };
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        title = if l_params_0.overrideTitle then l_params_0.overrideTitle else v23.title, 
        middleContent = function() --[[ Line: 158 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), v35 (copy), v33 (copy), v37 (copy), v34 (copy), l_StyledTextLabel_0 (ref), l_params_0 (copy), v23 (copy), l_Font_0 (copy), l_LinkButton_0 (ref), v29 (copy), l_CursorKind_0 (ref)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                ExperienceThumbnailFrame = v2.createElement("Frame", {
                    Size = UDim2.fromOffset(150, 150), 
                    BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    ClipsDescendants = true
                }, {
                    ExperienceThumbnail = v2.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Image = if v35 then v35 else v33, 
                        Size = if v37 then v37 else v34, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        RoundCorner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    }), 
                    RoundCorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                BodyText = v2.createElement(l_StyledTextLabel_0, {
                    text = if l_params_0.overrideBody then l_params_0.overrideBody else v23.body, 
                    fontStyle = l_Font_0.Body, 
                    colorStyle = l_Theme_0.TextDefault, 
                    layoutOrder = 2, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.fromScale(1, 0), 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    lineHeight = 1
                }), 
                DetailsButton = v2.createElement(l_LinkButton_0, {
                    text = v23.viewDetailsButtonText, 
                    onActivated = v29, 
                    layoutOrder = 3, 
                    selectionCursorKind = l_CursorKind_0.RoundedRectNoInset
                })
            });
        end, 
        buttonStackInfo = {
            buttons = if v39 then v39 else {
                {
                    props = {
                        onActivated = v26, 
                        text = v23.cancelButtonText, 
                        layoutOrder = 0
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v27, 
                        text = v23.confirmButtonText, 
                        layoutOrder = 2
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        screenSize = v25, 
        defaultChildRef = v21.defaultChildRef, 
        isMiddleContentFocusable = true
    });
end);