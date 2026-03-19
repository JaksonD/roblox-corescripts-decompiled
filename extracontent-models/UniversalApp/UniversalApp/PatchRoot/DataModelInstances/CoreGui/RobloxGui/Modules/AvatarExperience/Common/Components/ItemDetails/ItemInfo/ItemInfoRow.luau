local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_useSelectionCursor_0 = v9.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_FFlagAXUseTaxonomyInItemDetailsType_0 = v8.FFlagAXUseTaxonomyInItemDetailsType;
local v16 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v17 = l_Images_0["icons/navigation/pushRight_small"] or "LuaApp/icons/GameDetails/navigation/pushRight_small";
local v18 = Vector2.new(14, 14);
local v19 = l_Images_0["icons/actions/info_small"] or "LuaApp/icons/GameDetails/actions/info_small";
local v20 = Vector2.new(18, 18);
local function v22(v21) --[[ Line: 39 ]]
    return v21.ScreenSize;
end;
return (v2.forwardRef(function(v23, v24) --[[ Line: 59 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useSelector_0 (copy), v22 (copy), l_useStyle_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v16 (copy), v18 (copy), l_Focusable_0 (copy), l_FFlagAXUseTaxonomyInItemDetailsType_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), l_ImageSetLabel_0 (copy), v20 (copy), v19 (copy), v5 (copy), v17 (copy)
    local l_LayoutOrder_0 = v23.LayoutOrder;
    local l_infoName_0 = v23.infoName;
    local l_infoNameDetails_0 = v23.infoNameDetails;
    local l_infoData_0 = v23.infoData;
    local l_onActivate_0 = v23.onActivate;
    local l_hasVerifiedBadge_0 = v23.hasVerifiedBadge;
    local v31 = l_useNavigation_0();
    local v32 = l_useSelector_0(v22);
    local v33 = l_useStyle_0();
    local l_Theme_0 = v33.Theme;
    local l_Font_0 = v33.Font;
    local v36 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v37 = v16({
        name = l_infoName_0
    });
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local v39 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v40 = -11 - v18.X;
    local v41 = v24 ~= nil;
    local v42 = if v41 then l_Focusable_0.ImageButton else "ImageButton";
    local v43 = nil;
    if l_FFlagAXUseTaxonomyInItemDetailsType_0 then
        local v44 = v2.useCallback(function() --[[ Line: 88 ]]
            -- upvalues: v31 (copy), l_AvatarScreen_0 (ref), v32 (copy), l_infoNameDetails_0 (copy)
            v31.navigate(l_AvatarScreen_0.ItemInfoRowPrompt, {
                screenSize = v32, 
                message = l_infoNameDetails_0, 
                confirmButtonText = "CommonUI.Controls.Action.OK"
            });
        end, {
            v31, 
            v32, 
            l_infoNameDetails_0
        });
        v43 = if l_infoNameDetails_0 then v44 else nil;
    else
        v43 = if l_infoNameDetails_0 then v2.useCallback(function() --[[ Line: 98 ]]
            -- upvalues: v31 (copy), l_AvatarScreen_0 (ref), v32 (copy), l_infoNameDetails_0 (copy)
            v31.navigate(l_AvatarScreen_0.ItemInfoRowPrompt, {
                screenSize = v32, 
                message = l_infoNameDetails_0, 
                confirmButtonText = "CommonUI.Controls.Action.OK"
            });
        end, {
            v31, 
            v32, 
            l_infoNameDetails_0
        }) else nil;
    end;
    local function v45() --[[ Line: 108 ]] --[[ Name: renderLabelWithInfoIcon ]]
        -- upvalues: v2 (ref), v43 (ref), l_onActivate_0 (copy), l_Font_0 (copy), v37 (copy), l_Theme_0 (copy), v39 (copy), l_infoNameDetails_0 (copy), l_ImageSetLabel_0 (ref), v20 (ref), v19 (ref), l_Color_0 (copy)
        return v2.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.5, 0, 1, 0), 
            [v2.Event.Activated] = if v43 then v43 else l_onActivate_0
        }, {
            HorizontalLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            InfoNameTextLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                AutomaticSize = Enum.AutomaticSize.X, 
                Text = v37.name, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = v39, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            InfoIcon = l_infoNameDetails_0 and v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.fromOffset(v20.X, v20.Y), 
                Image = v19, 
                ImageColor3 = l_Color_0, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            })
        });
    end;
    return v2.createElement(v42, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, v23.hideDivider and 52 or 53), 
        [v2.Event.Activated] = l_onActivate_0, 
        NextSelectionUp = v23.NextSelectionUp, 
        NextSelectionDown = v23.NextSelectionDown, 
        NextSelectionLeft = v23.NextSelectionLeft, 
        NextSelectionRight = v23.NextSelectionRight, 
        ref = v24, 
        SelectionImageObject = v41 and v36 or nil
    }, {
        Container = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, v23.hideDivider and 0 or -1)
        }, {
            InfoNameTextLabelContainer = v45(), 
            InfoDataWithEmoji = l_hasVerifiedBadge_0 and v2.createElement(v5.EmojiWrapper, {
                emoji = v5.emoji.verified, 
                font = if l_onActivate_0 then l_Font_0.Header2.Font else l_Font_0.Body.Font, 
                anchorPoint = Vector2.new(1, 0), 
                position = UDim2.new(1, if l_onActivate_0 then v40 else 0, 0, 0), 
                size = UDim2.new(0.5, 0, 1, 0), 
                automaticSize = Enum.AutomaticSize.None, 
                horizontalAlignment = Enum.HorizontalAlignment.Right, 
                verticalAlignment = Enum.VerticalAlignment.Center
            }, {
                InfoDataTextLabel = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = l_onActivate_0 and l_Font_0.Header2.Font or l_Font_0.Body.Font, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    Text = v37.data or l_infoData_0, 
                    TextColor3 = if l_onActivate_0 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                    TextSize = v39, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextScaled = v23.TextScaled, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            InfoDataTextLabel = not l_hasVerifiedBadge_0 and v2.createElement("TextLabel", {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, if l_onActivate_0 then v40 else 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = if l_onActivate_0 then l_Font_0.Header2.Font else l_Font_0.Body.Font, 
                Size = UDim2.new(0.5, 0, 1, 0), 
                Text = v37.data or l_infoData_0, 
                TextColor3 = if l_onActivate_0 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                TextSize = v39, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextScaled = v23.TextScaled, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Center
            }, {
                TextSizeConstraint = v23.TextScaled and v2.createElement("UITextSizeConstraint", {
                    MaxTextSize = v39
                })
            }), 
            LinkIcon = l_onActivate_0 and v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.fromOffset(v18.X, v18.Y), 
                Image = v17, 
                ImageColor3 = l_Color_0, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            })
        }), 
        Divider = not v23.hideDivider and v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, -1)
        })
    });
end));