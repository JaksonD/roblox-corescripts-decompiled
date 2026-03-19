local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v12 = require(l_CoreGui_0.RobloxGui.Modules.Common.Hooks.useScreenSize);
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_Parent_0 = script.Parent.Parent;
local v15 = require(l_Parent_0.Actions.CloseOverlay);
return function(v16) --[[ Line: 31 ]] --[[ Name: AttributionTraversal ]]
    -- upvalues: l_useDispatch_0 (copy), v12 (copy), l_useStyle_0 (copy), v3 (copy), v15 (copy), l_ExperienceService_0 (copy), l_useSelector_0 (copy), l_InteractiveAlert_0 (copy), v11 (copy), l_ImageSetLabel_0 (copy), l_StyledTextLabel_0 (copy), l_ButtonType_0 (copy)
    local v17 = l_useDispatch_0();
    local v18 = v12();
    local v19 = l_useStyle_0();
    local v20 = v3.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v17 (copy), v15 (ref)
        v17(v15());
    end, {
        v17
    });
    local v22 = v3.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v16 (copy), l_ExperienceService_0 (ref), v17 (copy), v15 (ref)
        local v21 = {
            placeId = v16.rootPlaceId
        };
        l_ExperienceService_0:LaunchExperience(v21);
        v17(v15());
    end, {
        v17, 
        v16.rootPlaceId
    });
    local v24 = l_useSelector_0(function(v23) --[[ Line: 49 ]]
        return v23.locale;
    end);
    local l_Theme_0 = v19.Theme;
    local l_Font_0 = v19.Font;
    local v27 = v16.name or "";
    return v3.createElement(l_InteractiveAlert_0, {
        title = v11:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToExperience", v24), 
        middleContent = function() --[[ Line: 59 ]] --[[ Name: middleContent ]]
            -- upvalues: v3 (ref), v19 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), v16 (copy), l_StyledTextLabel_0 (ref), v11 (ref), v24 (copy), v27 (copy), l_Font_0 (copy)
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v19.Tokens.Global.Space_150)
                }), 
                ExperienceThumbnailFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(150, 150), 
                    BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    ClipsDescendants = true
                }, {
                    ExperienceThumbnail = v3.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Image = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", tostring(v16.universeId), 150, 150), 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        RoundCorner = v3.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v19.Tokens.Semantic.Radius.Medium)
                        })
                    })
                }), 
                BodyText = v3.createElement(l_StyledTextLabel_0, {
                    text = v11:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToDescription", v24, {
                        EXPERIENCE_NAME = v27
                    }), 
                    fontStyle = l_Font_0.Body, 
                    colorStyle = l_Theme_0.TextDefault, 
                    layoutOrder = 2, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.fromScale(1, 0), 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    lineHeight = 1
                })
            });
        end, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v20, 
                        text = v11:FormatByKeyForLocale("InGame.InspectMenu.Action.Cancel", v24), 
                        layoutOrder = 0
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v22, 
                        text = v11:FormatByKeyForLocale("InGame.InspectMenu.Action.Go", v24), 
                        layoutOrder = 2
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        isMiddleContentFocusable = false, 
        screenSize = v18
    });
end;