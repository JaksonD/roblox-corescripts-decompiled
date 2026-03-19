local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_ExperienceTileV3_0 = v3.App.Tile.ExperienceTileV3;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v7 = require(l_Modules_0.LuaApp.getCurrentPage);
local l_AspectRatioModeEnum_0 = v3.App.Tile.AspectRatioModeEnum;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local v15 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local v18 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useImpressionsTagger_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).useImpressionsTagger;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v23 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v24 = require(l_Modules_0.LuaApp.Util.joinGame);
local v25 = require(l_Modules_0.LuaApp.Analytics.Events.joinGameInPlacesList);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_GameTileConstants_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameTileConstants;
local function _(v28, v29, v30) --[[ Line: 44 ]] --[[ Name: reportProfilePeekOpen ]]
    v30:sendEventDeferred(v28, "joinYourFriendProfileViewOpen", {
        friendId = v29.friendUserId, 
        universeId = v29.universeId, 
        rootPlaceId = v29.rootPlaceId
    });
end;
local function v40(v32, v33, v34, v35, v36, v37, v38) --[[ Line: 55 ]] --[[ Name: createJoinButtonOverlay ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_GameTileConstants_0 (copy), l_StandardButtonSize_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v25 (copy), v24 (copy)
    local l_X_0 = v38.X;
    return v2.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.PrimaryContextual, 
        position = l_GameTileConstants_0.TileOverlay.BottomRightPosition, 
        anchorPoint = Vector2.new(1, 1), 
        text = v33, 
        fontStyle = v34.Font.CaptionHeader, 
        fitContent = true, 
        standardSize = l_StandardButtonSize_0.XSmall, 
        maxWidth = l_X_0 * 0.92, 
        isDisabled = false, 
        isLoading = false, 
        onActivated = function() --[[ Line: 69 ]] --[[ Name: onActivated ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v37 (copy), l_SessionType_0 (ref), v25 (ref), v36 (copy), v32 (copy), v35 (copy), v24 (ref)
            l_SetGamePlaySession_0(v37, l_SessionType_0.StructuralIdentifier.GamePlayFromJoinYourFriends, true);
            v25(v36, v32, v35, tonumber(v35), nil, nil, "JoinYourFriends");
            v24:ByUserAndPlaceId({
                id = v32
            }, v35, "JoinYourFriends");
        end
    });
end;
local function v44(v41, v42, v43) --[[ Line: 89 ]]
    -- upvalues: v2 (copy), l_LoadableImage_0 (copy)
    return v2.createElement(l_LoadableImage_0, {
        BackgroundTransparency = 1, 
        ImageTransparency = v42, 
        Image = v41, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        ScaleType = Enum.ScaleType.Fit, 
        cornerRadius = if v43 then v43.CornerRadius else nil
    });
end;
local function _(v45) --[[ Line: 101 ]] --[[ Name: getAvatarForUser ]]
    if v45 then
        return "rbxthumb://type=AvatarBust&id=" .. v45 .. "&w=150&h=150";
    else
        return "";
    end;
end;
local function _(v47) --[[ Line: 109 ]] --[[ Name: getThumbnailAsset ]]
    if v47 then
        return "rbxthumb://type=Asset&id=" .. v47 .. "&w=420&h=420";
    else
        return "";
    end;
end;
local function v56(v49, v50, v51, v52, v53, v54) --[[ Line: 117 ]] --[[ Name: getTextForBottomContent ]]
    -- upvalues: v2 (copy), l_StyledTextLabel_0 (copy)
    local v55 = v54.X - v53.Leading - v53.Trailing;
    return v2.createElement(l_StyledTextLabel_0, {
        text = v49, 
        size = UDim2.new(0, v55, 0, 20), 
        automaticSize = Enum.AutomaticSize.X, 
        fontStyle = v50, 
        colorStyle = v51, 
        textTruncate = Enum.TextTruncate.AtEnd, 
        lineHeight = 1, 
        fluidSizing = false, 
        layoutOrder = v52, 
        richText = false
    });
end;
local function v61(v57, v58, v59) --[[ Line: 134 ]] --[[ Name: getUsernameWithPresenceIcon ]]
    -- upvalues: v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v56 (copy)
    local l_Spacing_0 = v58.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        }), 
        PresenceIcon = v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = l_Images_0["component_assets/circle_25"], 
            ImageColor3 = v58.Theme.OnlineStatus.Color, 
            ImageTransparency = v58.Theme.OnlineStatus.Transparency, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(0, 12, 0, 12), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Visible = true
        }), 
        FriendName = v56(v57, v58.Font.Header2, v58.Theme.TextEmphasis, 2, l_Spacing_0, v59)
    });
end;
local function v65(v62) --[[ Line: 172 ]] --[[ Name: getStyleProps ]]
    local l_Spacing_1 = v62.Tokens.Component.VerticalTile.Base.ContentTop.Spacing;
    local l_Spacing_2 = v62.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing;
    return {
        backgroundColor = {
            Color = v62.Theme.BackgroundUIDefault.Color, 
            Transparency = 0
        }, 
        dropShadow = {}, 
        overlayColors = {}, 
        contentTitleFont = v62.Font.Header2, 
        border = {
            BorderColor = {
                Color = v62.Tokens.Component.VerticalTile.Base.Container.BorderColor.Color3, 
                Transparency = v62.Tokens.Component.VerticalTile.Base.Container.BorderColor.Transparency
            }, 
            CornerRadius = UDim.new(0, 12), 
            Width = v62.Tokens.Component.VerticalTile.Base.Container.BorderWidth
        }, 
        topContentPadding = {
            Left = l_Spacing_1.Leading, 
            Right = l_Spacing_1.Trailing, 
            Top = l_Spacing_1.Top, 
            Bottom = l_Spacing_1.Bottom
        }, 
        bottomContentPadding = {
            Left = 0, 
            Right = l_Spacing_2.Trailing, 
            Top = 3, 
            Bottom = l_Spacing_2.Bottom
        }, 
        selectionCursorPadding = {
            Left = 0, 
            Right = 0, 
            Top = 0, 
            Bottom = 0
        }, 
        contentTitlePadding = 8
    };
end;
return function(v66) --[[ Line: 214 ]] --[[ Name: JoinYourFriendsTile ]]
    -- upvalues: l_useSelector_0 (copy), l_useDispatch_0 (copy), v7 (copy), v18 (copy), v15 (copy), l_AppSessionService_0 (copy), l_useStyle_0 (copy), v2 (copy), v61 (copy), v56 (copy), l_useLocalization_0 (copy), l_useImpressionsTagger_0 (copy), l_ExperienceTileV3_0 (copy), l_AspectRatioModeEnum_0 (copy), v44 (copy), v40 (copy), v23 (copy), v65 (copy)
    local l_friendUserId_0 = v66.friendUserId;
    local l_thumbnailAssetId_0 = v66.thumbnailAssetId;
    local l_experienceName_0 = v66.experienceName;
    local v71 = l_useSelector_0(function(v70) --[[ Line: 219 ]]
        -- upvalues: l_friendUserId_0 (copy)
        return v70.Users[l_friendUserId_0];
    end);
    local v72 = l_useDispatch_0();
    local v74 = l_useSelector_0(function(v73) --[[ Line: 225 ]]
        -- upvalues: v7 (ref)
        return v7(v73);
    end);
    local v75 = v18(v15);
    local v76 = v18(l_AppSessionService_0);
    local v77 = l_useStyle_0();
    local l_Spacing_3 = v77.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing;
    local v79 = v66.size or Vector2.new(0, 0);
    local function v80() --[[ Line: 237 ]]
        -- upvalues: v2 (ref), v61 (ref), v71 (copy), v77 (copy), v79 (copy), v56 (ref), l_experienceName_0 (copy), l_Spacing_3 (copy)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 2)
            }), 
            Title = v61(if v71 then v71.displayName else "", v77, v79), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4)
            }), 
            SubTitle = v56(l_experienceName_0, v77.Font.CaptionHeader, v77.Theme.TextDefault, 2, l_Spacing_3, v79)
        });
    end;
    local v81 = l_useLocalization_0({
        joinButtonText = "Feature.Home.Button.Join"
    });
    local v82 = v2.createRef();
    l_useImpressionsTagger_0(v82, v66.impressionsTag, v66.LayoutOrder);
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v79.X, 0, v79.Y), 
        BackgroundTransparency = 1, 
        LayoutOrder = v66.LayoutOrder, 
        ref = v82
    }, {
        Tile = v2.createElement(l_ExperienceTileV3_0, {
            tileWidth = v79.X, 
            hasBackground = false, 
            hasOutline = false, 
            isActive = true, 
            isHoverEnabled = false, 
            isExperienceActionRowEnabled = true, 
            thumbnailAspectRatioOverride = l_AspectRatioModeEnum_0.Wide, 
            contentTextLineCount = 1, 
            contentTitlePadding = 0, 
            renderTopContentOverlay = function(_, v84) --[[ Line: 287 ]] --[[ Name: renderTopContentOverlay ]]
                -- upvalues: v44 (ref), l_friendUserId_0 (copy), v40 (ref), v81 (copy), v77 (copy), v66 (copy), v75 (copy), v76 (copy), v79 (copy)
                local v85 = {
                    gradient = v44("rbxassetid://13074142871", 0.3, v84)
                };
                local l_v44_0 = v44;
                local l_l_friendUserId_0_0 = l_friendUserId_0;
                v85.avatar = l_v44_0(if l_l_friendUserId_0_0 then "rbxthumb://type=AvatarBust&id=" .. l_l_friendUserId_0_0 .. "&w=150&h=150" else "", 0, v84);
                v85.joinButton = v40(l_friendUserId_0, v81.joinButtonText, v77, v66.rootPlaceId, v75, v76, v79);
                return v85;
            end, 
            onActivated = function() --[[ Line: 302 ]] --[[ Name: onActivated ]]
                -- upvalues: v74 (copy), v66 (copy), v75 (copy), v72 (copy), v23 (ref), l_friendUserId_0 (copy)
                local l_v74_0 = v74;
                local l_v66_0 = v66;
                v75:sendEventDeferred(l_v74_0, "joinYourFriendProfileViewOpen", {
                    friendId = l_v66_0.friendUserId, 
                    universeId = l_v66_0.universeId, 
                    rootPlaceId = l_v66_0.rootPlaceId
                });
                v72(v23(l_friendUserId_0, {
                    source = "JoinYourFriends"
                }));
            end, 
            wideThumbnail = if l_thumbnailAssetId_0 then "rbxthumb://type=Asset&id=" .. l_thumbnailAssetId_0 .. "&w=420&h=420" else "", 
            renderBottomContent = v80, 
            styleProps = v65(v77)
        })
    });
end;