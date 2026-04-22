local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Common_0 = l_Modules_0.Common;
local l_LuaApp_0 = l_Modules_0.LuaApp;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v5 = require(l_LuaApp_0.Constants);
local v6 = require(l_LuaApp_0.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v8 = require(l_LuaApp_0.Components.GameButton);
local v9 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v10 = require(l_CorePackages_0.Packages.Roact);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local v12 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v16 = require(l_LuaApp_0.Enum.FeatureContext);
local l_ConvertUniverseIdToString_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).ConvertUniverseIdToString;
local l_FFlagPeopleListContextualMenuFixFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPeopleListContextualMenuFixFocusNavigation;
local l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel;
local v20 = require(l_Common_0.Text);
local v21 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local l_VIEW_GAME_DETAILS_FROM_ICON_0 = v5.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_ICON;
local l_VIEW_GAME_DETAILS_FROM_TITLE_0 = v5.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_TITLE;
local v25 = v10.PureComponent:extend("UserActiveGame");
local function v30(v26) --[[ Line: 54 ]] --[[ Name: Separator ]]
    -- upvalues: v10 (copy)
    local l_layoutOrder_0 = v26.layoutOrder;
    local l_color_0 = v26.color;
    local l_transparency_0 = v26.transparency;
    return v10.createElement("Frame", {
        BackgroundColor3 = l_color_0, 
        BackgroundTransparency = l_transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 1)
    });
end;
local function _(v31, v32) --[[ Line: 70 ]] --[[ Name: getGameName ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy)
    local v33 = v32 and v32.lastLocation;
    if v33 then
        return v33;
    elseif v31 then
        if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then
            return v31.name or "";
        else
            return v31.name;
        end;
    else
        return "";
    end;
end;
v25.init = function(v35) --[[ Line: 85 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), l_ConvertUniverseIdToString_0 (copy), v16 (copy), v20 (copy)
    v35.createOpenGameDetailsProps = function() --[[ Line: 86 ]]
        -- upvalues: v35 (copy)
        return {
            onClose = v35.props.onCloseGameDetails
        };
    end;
    v35.openGameDetails = function(v36) --[[ Line: 92 ]]
        -- upvalues: v35 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (ref), l_ConvertUniverseIdToString_0 (ref), v16 (ref)
        local l_universePlaceInfo_0 = v35.props.universePlaceInfo;
        if not l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 and not l_universePlaceInfo_0 then
            return;
        else
            local l_analytics_0 = v35.props.analytics;
            local l_friend_0 = v35.props.friend;
            local l_index_0 = v35.props.index;
            local l_absolutePosition_0 = v35.props.absolutePosition;
            local l_dismissContextualMenu_0 = v35.props.dismissContextualMenu;
            local l_featureContext_0 = v35.props.featureContext;
            local v44 = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_0.universeRootPlaceId or -1 else l_universePlaceInfo_0.universeRootPlaceId;
            local v45 = l_ConvertUniverseIdToString_0(v35.props.universeId);
            if l_featureContext_0 == v16.PeopleList then
                l_analytics_0.reportViewProfileFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, v44, v36);
                l_analytics_0.reportOpenGameDetailFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, v44, v45, v36, "GameDetailFromUserActiveGame");
            end;
            if l_dismissContextualMenu_0 then
                l_dismissContextualMenu_0();
            end;
            v35.props.openGameDetails(v45, v35.createOpenGameDetailsProps());
            return;
        end;
    end;
    v35.getGameTitleHeight = function(v46, v47, v48, v49) --[[ Line: 136 ]]
        -- upvalues: v20 (ref)
        return (math.min(40, v20.GetTextHeight(v46, v47, v48, v49) - 2));
    end;
end;
v25.createGameNameButton = function(v50, v51, v52, v53, v54, v55) --[[ Line: 147 ]] --[[ Name: createGameNameButton ]]
    -- upvalues: v10 (copy), l_VIEW_GAME_DETAILS_FROM_TITLE_0 (copy)
    local l_Theme_0 = v55.Theme;
    local l_Font_0 = v55.Font;
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local l_Transparency_0 = l_Theme_0.TextEmphasis.Transparency;
    local v60 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_Font_1 = l_Font_0.Header2.Font;
    return v10.createElement("TextButton", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Font = l_Font_1, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, v51), 
        Text = v52, 
        TextColor3 = l_Color_0, 
        TextTransparency = l_Transparency_0, 
        TextSize = v60, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextWrapped = true, 
        TextXAlignment = v53, 
        TextYAlignment = v54, 
        [v10.Event.Activated] = function() --[[ Line: 170 ]]
            -- upvalues: v50 (copy), l_VIEW_GAME_DETAILS_FROM_TITLE_0 (ref)
            v50.openGameDetails(l_VIEW_GAME_DETAILS_FROM_TITLE_0, v50.createOpenGameDetailsProps());
        end
    });
end;
v25.renderPhone = function(v62, v63) --[[ Line: 176 ]] --[[ Name: renderPhone ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v10 (copy), v6 (copy), v9 (copy), l_VIEW_GAME_DETAILS_FROM_ICON_0 (copy), v8 (copy), v30 (copy)
    local l_layoutOrder_1 = v62.props.layoutOrder;
    local l_width_0 = v62.props.width;
    local l_universeId_0 = v62.props.universeId;
    local l_friend_1 = v62.props.friend;
    local l_index_1 = v62.props.index;
    local l_absolutePosition_1 = v62.props.absolutePosition;
    local l_dismissContextualMenu_1 = v62.props.dismissContextualMenu;
    local l_featureContext_1 = v62.props.featureContext;
    local l_gameThumbnail_0 = v62.props.gameThumbnail;
    local l_universePlaceInfo_1 = v62.props.universePlaceInfo;
    local l_forwardRef_0 = v62.props.forwardRef;
    local l_Theme_1 = v63.Theme;
    local l_Font_2 = v63.Font;
    local v77 = l_Font_2.BaseSize * l_Font_2.Header2.RelativeSize;
    local l_Font_3 = l_Font_2.Header2.Font;
    local v79 = l_friend_1 and l_friend_1.lastLocation;
    local v80 = if v79 then v79 else if l_universePlaceInfo_1 then if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_1.name or "" else l_universePlaceInfo_1.name else "";
    v79 = l_Theme_1.BackgroundUIDefault.Color;
    local l_Transparency_1 = l_Theme_1.BackgroundUIDefault.Transparency;
    local v82 = l_gameThumbnail_0 and v79 or l_Theme_1.PlaceHolder.Color;
    local v83 = l_gameThumbnail_0 and l_Transparency_1 or l_Theme_1.PlaceHolder.Transparency;
    local v84 = l_width_0 - 30;
    local v85 = v62.getGameTitleHeight(v80, l_Font_3, v77, v84);
    return v10.createElement(v6.FitImageButton, {
        BackgroundTransparency = 1, 
        fitAxis = v6.FitAxis.Height, 
        LayoutOrder = l_layoutOrder_1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutoButtonColor = false, 
        [v10.Ref] = l_forwardRef_0
    }, {
        GameContent = v10.createElement(v6.FitFrame, {
            BackgroundTransparency = 1, 
            fitAxis = v6.FitAxis.Height, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Layout = v10.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            GameIcon = v10.createElement("Frame", {
                BackgroundColor3 = v82, 
                BackgroundTransparency = v83, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 94, 0, 94)
            }, {
                Icon = v10.createElement(v9, {
                    BackgroundColor3 = v82, 
                    BorderSizePixel = 0, 
                    Image = l_gameThumbnail_0, 
                    Position = UDim2.new(0, 2, 0, 2), 
                    Size = UDim2.new(0, 90, 0, 90), 
                    [v10.Event.Activated] = function() --[[ Line: 240 ]]
                        -- upvalues: v62 (copy), l_VIEW_GAME_DETAILS_FROM_ICON_0 (ref)
                        v62.openGameDetails(l_VIEW_GAME_DETAILS_FROM_ICON_0, v62.createOpenGameDetailsProps());
                    end
                })
            }), 
            GameName = v10.createElement(v6.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v6.FitAxis.Height, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -30, 0, 0)
            }, {
                Layout = v10.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                NameButton = v62:createGameNameButton(v85, v80, Enum.TextXAlignment.Center, Enum.TextYAlignment.Center, v63), 
                Padding = v10.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12)
                })
            }), 
            InteractiveButton = v10.createElement(v6.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v6.FitAxis.Height, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, -30, 0, 0)
            }, {
                Layout = v10.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Padding = v10.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24)
                }), 
                Button = v10.createElement(v8, {
                    maxWidth = v84, 
                    showLoadingIndicatorWhenDataNotReady = true, 
                    universeId = l_universeId_0, 
                    universeRootPlaceId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_1.universeRootPlaceId else nil, 
                    placeId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_1.placeId else nil, 
                    friend = l_friend_1, 
                    index = l_index_1, 
                    absolutePosition = l_absolutePosition_1, 
                    callbackOnOpenGameDetails = l_dismissContextualMenu_1, 
                    callbackOnJoinGame = l_dismissContextualMenu_1, 
                    featureContext = l_featureContext_1, 
                    source = v62.props.source
                })
            }), 
            Separator = v10.createElement(v6.FitFrame, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 5, 
                fitAxis = v6.FitAxis.Height
            }, {
                Layout = v10.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Line = v10.createElement(v30, {
                    color = l_Theme_1.Divider.Color, 
                    transparency = l_Theme_1.Divider.Transparency, 
                    layoutOrder = 2
                }), 
                Padding = v10.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 23)
                })
            })
        }), 
        Background = v10.createElement("Frame", {
            BackgroundColor3 = v79, 
            BackgroundTransparency = l_Transparency_1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, -47), 
            Position = UDim2.new(0, 0, 0, 47)
        })
    });
end;
v25.renderTablet = function(v86, v87) --[[ Line: 336 ]] --[[ Name: renderTablet ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v10 (copy), v6 (copy), l_FFlagPeopleListContextualMenuFixFocusNavigation_0 (copy), v9 (copy), l_VIEW_GAME_DETAILS_FROM_ICON_0 (copy), v8 (copy), v30 (copy)
    local l_layoutOrder_2 = v86.props.layoutOrder;
    local l_width_1 = v86.props.width;
    local l_universeId_1 = v86.props.universeId;
    local l_friend_2 = v86.props.friend;
    local l_index_2 = v86.props.index;
    local l_absolutePosition_2 = v86.props.absolutePosition;
    local l_dismissContextualMenu_2 = v86.props.dismissContextualMenu;
    local l_featureContext_2 = v86.props.featureContext;
    local l_gameThumbnail_1 = v86.props.gameThumbnail;
    local l_universePlaceInfo_2 = v86.props.universePlaceInfo;
    local l_forwardRef_1 = v86.props.forwardRef;
    local v99 = l_friend_2 and l_friend_2.lastLocation;
    local v100 = if v99 then v99 else if l_universePlaceInfo_2 then if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_2.name or "" else l_universePlaceInfo_2.name else "";
    v99 = v87.Theme;
    local l_Color_1 = v99.BackgroundUIDefault.Color;
    local l_Transparency_2 = v99.BackgroundUIDefault.Transparency;
    local v103 = l_gameThumbnail_1 and l_Color_1 or v99.PlaceHolder.Color;
    local v104 = l_gameThumbnail_1 and l_Transparency_2 or v99.PlaceHolder.Transparency;
    local v105 = l_width_1 - 36 - 90;
    return v10.createElement(v6.FitImageButton, {
        BackgroundColor3 = l_Color_1, 
        BackgroundTransparency = l_Transparency_2, 
        BorderSizePixel = 0, 
        fitAxis = v6.FitAxis.Height, 
        LayoutOrder = l_layoutOrder_2, 
        Size = UDim2.new(0, l_width_1, 0, 0), 
        AutoButtonColor = false, 
        [v10.Ref] = l_forwardRef_1, 
        Selectable = not l_FFlagPeopleListContextualMenuFixFocusNavigation_0 and nil
    }, {
        Layout = v10.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        GameContent = v10.createElement(v6.FitFrame, {
            BackgroundTransparency = 1, 
            fitAxis = v6.FitAxis.Height, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Padding = v10.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 11)
            }), 
            Layout = v10.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 15)
            }), 
            GameIcon = v10.createElement(v9, {
                BackgroundColor3 = v103, 
                BackgroundTransparency = v104, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Image = l_gameThumbnail_1, 
                Size = UDim2.new(0, 90, 0, 90), 
                [v10.Event.Activated] = function() --[[ Line: 406 ]]
                    -- upvalues: v86 (copy), l_VIEW_GAME_DETAILS_FROM_ICON_0 (ref)
                    v86.openGameDetails(l_VIEW_GAME_DETAILS_FROM_ICON_0, v86.createOpenGameDetailsProps());
                end, 
                Selectable = not l_FFlagPeopleListContextualMenuFixFocusNavigation_0 and nil
            }, {
                Padding = v10.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12)
                })
            }), 
            GameInfo = v10.createElement(v6.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v6.FitAxis.Height, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -105, 0, 0)
            }, {
                Layout = v10.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                NameButton = v86:createGameNameButton(40, v100, Enum.TextXAlignment.Left, Enum.TextYAlignment.Top, v87), 
                InteractiveButton = v10.createElement(v6.FitFrame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 2, 
                    fitAxis = v6.FitAxis.Height
                }, {
                    Layout = v10.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right
                    }), 
                    Button = v10.createElement(v8, {
                        layoutOrder = 3, 
                        maxWidth = v105, 
                        showLoadingIndicatorWhenDataNotReady = true, 
                        universeId = l_universeId_1, 
                        universeRootPlaceId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_2.universeRootPlaceId else nil, 
                        placeId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_2.placeId else nil, 
                        friend = l_friend_2, 
                        index = l_index_2, 
                        absolutePosition = l_absolutePosition_2, 
                        callbackOnOpenGameDetails = l_dismissContextualMenu_2, 
                        callbackOnJoinGame = l_dismissContextualMenu_2, 
                        featureContext = l_featureContext_2, 
                        source = v86.props.source, 
                        selectionOrder = l_FFlagPeopleListContextualMenuFixFocusNavigation_0 and -1 or nil
                    }), 
                    Padding = v10.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 18)
                    })
                })
            })
        }), 
        Separator = v10.createElement(v30, {
            layoutOrder = 2
        })
    });
end;
v25.render = function(v106) --[[ Line: 479 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), l_withStyle_0 (copy)
    local l_formFactor_0 = v106.props.formFactor;
    return l_withStyle_0(function(v108) --[[ Line: 482 ]]
        -- upvalues: l_formFactor_0 (copy), l_FormFactor_0 (ref), v106 (copy)
        if l_formFactor_0 == l_FormFactor_0.COMPACT then
            return v106:renderPhone(v108);
        else
            return v106:renderTablet(v108);
        end;
    end);
end;
v25 = v12.connect(function(v109, v110) --[[ Line: 493 ]]
    -- upvalues: l_ConvertUniverseIdToString_0 (copy), l_GameIconReducer_0 (copy), v5 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v11 (copy)
    local v111 = l_ConvertUniverseIdToString_0(v110.universeId);
    local v112 = nil;
    local v113 = v109[l_GameIconReducer_0.key][v111];
    v112 = v113 and v113.url or v5.DEFAULT_GAME_ICON;
    local v114 = nil;
    if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then
        v114 = {
            universeId = v111, 
            universeRootPlaceId = tonumber(v110.universeRootPlaceId), 
            placeId = v110.placeId
        };
    end;
    return {
        formFactor = v109.FormFactor, 
        gameThumbnail = v112, 
        universePlaceInfo = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v11.Dictionary.union(v109.UniversePlaceInfos[v111] or {}, v114) else v109.UniversePlaceInfos[v111]
    };
end, function(v115) --[[ Line: 517 ]]
    -- upvalues: v21 (copy)
    return {
        openGameDetails = function(v116, v117) --[[ Line: 519 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v115 (copy), v21 (ref)
            v115(v21(v116, v117));
        end
    };
end)(v25);
v25 = l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    guiService = l_AppGuiService_0
})(v25);
return v10.forwardRef(function(v118, v119) --[[ Line: 530 ]]
    -- upvalues: v10 (copy), v25 (ref), v11 (copy)
    return v10.createElement(v25, v11.Dictionary.join(v118, {
        forwardRef = v119
    }));
end);