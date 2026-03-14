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
local l_game_EngineFeature_0 = game:GetEngineFeature("TextBoundsRoundUp");
local v26 = v10.PureComponent:extend("UserActiveGame");
local function v31(v27) --[[ Line: 56 ]] --[[ Name: Separator ]]
    -- upvalues: v10 (copy)
    local l_layoutOrder_0 = v27.layoutOrder;
    local l_color_0 = v27.color;
    local l_transparency_0 = v27.transparency;
    return v10.createElement("Frame", {
        BackgroundColor3 = l_color_0, 
        BackgroundTransparency = l_transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 1)
    });
end;
local function _(v32, v33) --[[ Line: 72 ]] --[[ Name: getGameName ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy)
    local v34 = v33 and v33.lastLocation;
    if v34 then
        return v34;
    elseif v32 then
        if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then
            return v32.name or "";
        else
            return v32.name;
        end;
    else
        return "";
    end;
end;
v26.init = function(v36) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), l_ConvertUniverseIdToString_0 (copy), v16 (copy), v20 (copy), l_game_EngineFeature_0 (copy)
    v36.createOpenGameDetailsProps = function() --[[ Line: 88 ]]
        -- upvalues: v36 (copy)
        return {
            onClose = v36.props.onCloseGameDetails
        };
    end;
    v36.openGameDetails = function(v37) --[[ Line: 94 ]]
        -- upvalues: v36 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (ref), l_ConvertUniverseIdToString_0 (ref), v16 (ref)
        local l_universePlaceInfo_0 = v36.props.universePlaceInfo;
        if not l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 and not l_universePlaceInfo_0 then
            return;
        else
            local l_analytics_0 = v36.props.analytics;
            local l_friend_0 = v36.props.friend;
            local l_index_0 = v36.props.index;
            local l_absolutePosition_0 = v36.props.absolutePosition;
            local l_dismissContextualMenu_0 = v36.props.dismissContextualMenu;
            local l_featureContext_0 = v36.props.featureContext;
            local v45 = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_0.universeRootPlaceId or -1 else l_universePlaceInfo_0.universeRootPlaceId;
            local v46 = l_ConvertUniverseIdToString_0(v36.props.universeId);
            if l_featureContext_0 == v16.PeopleList then
                l_analytics_0.reportViewProfileFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, v45, v37);
                l_analytics_0.reportOpenGameDetailFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, v45, v46, v37, "GameDetailFromUserActiveGame");
            end;
            if l_dismissContextualMenu_0 then
                l_dismissContextualMenu_0();
            end;
            v36.props.openGameDetails(v46, v36.createOpenGameDetailsProps());
            return;
        end;
    end;
    v36.getGameTitleHeight = function(v47, v48, v49, v50) --[[ Line: 138 ]]
        -- upvalues: v20 (ref), l_game_EngineFeature_0 (ref)
        local v51 = v20.GetTextHeight(v47, v48, v49, v50);
        if not l_game_EngineFeature_0 then
            v51 = v51 - 2;
        end;
        return (math.min(40, v51));
    end;
end;
v26.createGameNameButton = function(v52, v53, v54, v55, v56, v57) --[[ Line: 151 ]] --[[ Name: createGameNameButton ]]
    -- upvalues: v10 (copy), l_VIEW_GAME_DETAILS_FROM_TITLE_0 (copy)
    local l_Theme_0 = v57.Theme;
    local l_Font_0 = v57.Font;
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local l_Transparency_0 = l_Theme_0.TextEmphasis.Transparency;
    local v62 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_Font_1 = l_Font_0.Header2.Font;
    return v10.createElement("TextButton", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Font = l_Font_1, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, v53), 
        Text = v54, 
        TextColor3 = l_Color_0, 
        TextTransparency = l_Transparency_0, 
        TextSize = v62, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextWrapped = true, 
        TextXAlignment = v55, 
        TextYAlignment = v56, 
        [v10.Event.Activated] = function() --[[ Line: 174 ]]
            -- upvalues: v52 (copy), l_VIEW_GAME_DETAILS_FROM_TITLE_0 (ref)
            v52.openGameDetails(l_VIEW_GAME_DETAILS_FROM_TITLE_0, v52.createOpenGameDetailsProps());
        end
    });
end;
v26.renderPhone = function(v64, v65) --[[ Line: 180 ]] --[[ Name: renderPhone ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v10 (copy), v6 (copy), v9 (copy), l_VIEW_GAME_DETAILS_FROM_ICON_0 (copy), v8 (copy), v31 (copy)
    local l_layoutOrder_1 = v64.props.layoutOrder;
    local l_width_0 = v64.props.width;
    local l_universeId_0 = v64.props.universeId;
    local l_friend_1 = v64.props.friend;
    local l_index_1 = v64.props.index;
    local l_absolutePosition_1 = v64.props.absolutePosition;
    local l_dismissContextualMenu_1 = v64.props.dismissContextualMenu;
    local l_featureContext_1 = v64.props.featureContext;
    local l_gameThumbnail_0 = v64.props.gameThumbnail;
    local l_universePlaceInfo_1 = v64.props.universePlaceInfo;
    local l_forwardRef_0 = v64.props.forwardRef;
    local l_Theme_1 = v65.Theme;
    local l_Font_2 = v65.Font;
    local v79 = l_Font_2.BaseSize * l_Font_2.Header2.RelativeSize;
    local l_Font_3 = l_Font_2.Header2.Font;
    local v81 = l_friend_1 and l_friend_1.lastLocation;
    local v82 = if v81 then v81 else if l_universePlaceInfo_1 then if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_1.name or "" else l_universePlaceInfo_1.name else "";
    v81 = l_Theme_1.BackgroundUIDefault.Color;
    local l_Transparency_1 = l_Theme_1.BackgroundUIDefault.Transparency;
    local v84 = l_gameThumbnail_0 and v81 or l_Theme_1.PlaceHolder.Color;
    local v85 = l_gameThumbnail_0 and l_Transparency_1 or l_Theme_1.PlaceHolder.Transparency;
    local v86 = l_width_0 - 30;
    local v87 = v64.getGameTitleHeight(v82, l_Font_3, v79, v86);
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
                BackgroundColor3 = v84, 
                BackgroundTransparency = v85, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 94, 0, 94)
            }, {
                Icon = v10.createElement(v9, {
                    BackgroundColor3 = v84, 
                    BorderSizePixel = 0, 
                    Image = l_gameThumbnail_0, 
                    Position = UDim2.new(0, 2, 0, 2), 
                    Size = UDim2.new(0, 90, 0, 90), 
                    [v10.Event.Activated] = function() --[[ Line: 244 ]]
                        -- upvalues: v64 (copy), l_VIEW_GAME_DETAILS_FROM_ICON_0 (ref)
                        v64.openGameDetails(l_VIEW_GAME_DETAILS_FROM_ICON_0, v64.createOpenGameDetailsProps());
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
                NameButton = v64:createGameNameButton(v87, v82, Enum.TextXAlignment.Center, Enum.TextYAlignment.Center, v65), 
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
                    maxWidth = v86, 
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
                    source = v64.props.source
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
                Line = v10.createElement(v31, {
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
            BackgroundColor3 = v81, 
            BackgroundTransparency = l_Transparency_1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, -47), 
            Position = UDim2.new(0, 0, 0, 47)
        })
    });
end;
v26.renderTablet = function(v88, v89) --[[ Line: 340 ]] --[[ Name: renderTablet ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v10 (copy), v6 (copy), l_FFlagPeopleListContextualMenuFixFocusNavigation_0 (copy), v9 (copy), l_VIEW_GAME_DETAILS_FROM_ICON_0 (copy), v8 (copy), v31 (copy)
    local l_layoutOrder_2 = v88.props.layoutOrder;
    local l_width_1 = v88.props.width;
    local l_universeId_1 = v88.props.universeId;
    local l_friend_2 = v88.props.friend;
    local l_index_2 = v88.props.index;
    local l_absolutePosition_2 = v88.props.absolutePosition;
    local l_dismissContextualMenu_2 = v88.props.dismissContextualMenu;
    local l_featureContext_2 = v88.props.featureContext;
    local l_gameThumbnail_1 = v88.props.gameThumbnail;
    local l_universePlaceInfo_2 = v88.props.universePlaceInfo;
    local l_forwardRef_1 = v88.props.forwardRef;
    local v101 = l_friend_2 and l_friend_2.lastLocation;
    local v102 = if v101 then v101 else if l_universePlaceInfo_2 then if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_2.name or "" else l_universePlaceInfo_2.name else "";
    v101 = v89.Theme;
    local l_Color_1 = v101.BackgroundUIDefault.Color;
    local l_Transparency_2 = v101.BackgroundUIDefault.Transparency;
    local v105 = l_gameThumbnail_1 and l_Color_1 or v101.PlaceHolder.Color;
    local v106 = l_gameThumbnail_1 and l_Transparency_2 or v101.PlaceHolder.Transparency;
    local v107 = l_width_1 - 36 - 90;
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
                BackgroundColor3 = v105, 
                BackgroundTransparency = v106, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Image = l_gameThumbnail_1, 
                Size = UDim2.new(0, 90, 0, 90), 
                [v10.Event.Activated] = function() --[[ Line: 410 ]]
                    -- upvalues: v88 (copy), l_VIEW_GAME_DETAILS_FROM_ICON_0 (ref)
                    v88.openGameDetails(l_VIEW_GAME_DETAILS_FROM_ICON_0, v88.createOpenGameDetailsProps());
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
                NameButton = v88:createGameNameButton(40, v102, Enum.TextXAlignment.Left, Enum.TextYAlignment.Top, v89), 
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
                        maxWidth = v107, 
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
                        source = v88.props.source, 
                        selectionOrder = l_FFlagPeopleListContextualMenuFixFocusNavigation_0 and -1 or nil
                    }), 
                    Padding = v10.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 18)
                    })
                })
            })
        }), 
        Separator = v10.createElement(v31, {
            layoutOrder = 2
        })
    });
end;
v26.render = function(v108) --[[ Line: 483 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), l_withStyle_0 (copy)
    local l_formFactor_0 = v108.props.formFactor;
    return l_withStyle_0(function(v110) --[[ Line: 486 ]]
        -- upvalues: l_formFactor_0 (copy), l_FormFactor_0 (ref), v108 (copy)
        if l_formFactor_0 == l_FormFactor_0.COMPACT then
            return v108:renderPhone(v110);
        else
            return v108:renderTablet(v110);
        end;
    end);
end;
v26 = v12.connect(function(v111, v112) --[[ Line: 497 ]]
    -- upvalues: l_ConvertUniverseIdToString_0 (copy), l_GameIconReducer_0 (copy), v5 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v11 (copy)
    local v113 = l_ConvertUniverseIdToString_0(v112.universeId);
    local v114 = nil;
    local v115 = v111[l_GameIconReducer_0.key][v113];
    v114 = v115 and v115.url or v5.DEFAULT_GAME_ICON;
    local v116 = nil;
    if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then
        v116 = {
            universeId = v113, 
            universeRootPlaceId = tonumber(v112.universeRootPlaceId), 
            placeId = v112.placeId
        };
    end;
    return {
        formFactor = v111.FormFactor, 
        gameThumbnail = v114, 
        universePlaceInfo = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v11.Dictionary.union(v111.UniversePlaceInfos[v113] or {}, v116) else v111.UniversePlaceInfos[v113]
    };
end, function(v117) --[[ Line: 521 ]]
    -- upvalues: v21 (copy)
    return {
        openGameDetails = function(v118, v119) --[[ Line: 523 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v117 (copy), v21 (ref)
            v117(v21(v118, v119));
        end
    };
end)(v26);
v26 = l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    guiService = l_AppGuiService_0
})(v26);
return v10.forwardRef(function(v120, v121) --[[ Line: 534 ]]
    -- upvalues: v10 (copy), v26 (ref), v11 (copy)
    return v10.createElement(v26, v11.Dictionary.join(v120, {
        forwardRef = v121
    }));
end);