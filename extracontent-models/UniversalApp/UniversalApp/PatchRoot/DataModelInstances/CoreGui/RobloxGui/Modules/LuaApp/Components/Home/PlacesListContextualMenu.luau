local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.LuaApp.Components.Home.JoinableFriendsList);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v10 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v11 = require(l_Modules_0.LuaApp.Components.Home.UserActiveGame);
local v12 = require(l_Modules_0.LuaApp.Enum.FeatureContext);
local l_ApiFetchGamesDataByPlaceIds_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds;
local v14 = require(l_Modules_0.LuaApp.Components.FormBasedContextualMenu);
local l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 = v7.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH;
local l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0 = v7.DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT;
local v17 = v2.PureComponent:extend("PlacesListContextualMenu");
v17.init = function(v18) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local l_analytics_0 = v18.props.analytics;
    local l_placeId_0 = v18.props.game.placeId;
    l_analytics_0.reportOpenModalFromGameTileForPlacesList(l_placeId_0);
    v18.state = {
        headerHeight = 0
    };
    v18.headerRef = v2.createRef();
    v18.updateHeaderHeight = function() --[[ Line: 41 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            headerHeight = v18.headerRef.current and v18.headerRef.current.AbsoluteSize.Y or 0
        });
    end;
end;
v17.didMount = function(v21) --[[ Line: 48 ]] --[[ Name: didMount ]]
    v21.props.requestGameData(v21.props.networking, v21.props.game.placeId);
    v21.headerSizeChanged = v21.headerRef.current and v21.headerRef.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 56 ]]
        -- upvalues: v21 (copy)
        v21.updateHeaderHeight();
    end);
    v21.updateHeaderHeight();
end;
v17.render = function(v22) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 (copy), v7 (copy), l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0 (copy), v2 (copy), v14 (copy), v11 (copy), v12 (copy), v8 (copy)
    local l_game_0 = v22.props.game;
    local l_anchorSpaceSize_0 = v22.props.anchorSpaceSize;
    local l_anchorSpacePosition_0 = v22.props.anchorSpacePosition;
    local l_screenSize_0 = v22.props.screenSize;
    local l_formFactor_0 = v22.props.formFactor;
    local l_topBarHeight_0 = v22.props.topBarHeight;
    local l_closeCallback_0 = v22.props.closeCallback;
    local l_headerHeight_0 = v22.state.headerHeight;
    local v31 = l_formFactor_0 == l_FormFactor_0.WIDE;
    local v32 = v31 and l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 or l_screenSize_0.X;
    local v33 = l_topBarHeight_0 + 50;
    local v34 = v7.BOTTOM_BAR_SIZE + 10;
    local v35 = v31 and l_screenSize_0.Y - v33 - v34 - l_headerHeight_0 or l_screenSize_0.Y * 0.5 - l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0;
    return v2.createElement(v14, {
        anchorSpaceSize = l_anchorSpaceSize_0, 
        anchorSpacePosition = l_anchorSpacePosition_0, 
        itemWidth = v32
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }), 
        Header = v2.createElement(v11, {
            layoutOrder = 1, 
            width = v32, 
            universeId = l_game_0.universeId, 
            dismissContextualMenu = l_closeCallback_0, 
            featureContext = v12.PlacesList, 
            [v2.Ref] = v22.headerRef
        }), 
        Divider = v2.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = v7.Color.GRAY4, 
            BorderSizePixel = 0
        }), 
        JoinableFriendsList = v2.createElement(v8, {
            LayoutOrder = 3, 
            maxHeight = v35, 
            width = v32, 
            universeId = l_game_0.universeId
        })
    });
end;
v17.willUnmount = function(v36) --[[ Line: 116 ]] --[[ Name: willUnmount ]]
    if v36.headerSizeChanged then
        v36.headerSizeChanged:Disconnect();
    end;
end;
v17 = v3.connect(function(v37, _) --[[ Line: 122 ]]
    return {
        topBarHeight = v37.TopBar.topBarHeight, 
        formFactor = v37.FormFactor, 
        screenSize = v37.ScreenSize
    };
end, function(v39) --[[ Line: 128 ]]
    -- upvalues: l_ApiFetchGamesDataByPlaceIds_0 (copy), v10 (copy)
    return {
        requestGameData = function(v40, v41) --[[ Line: 130 ]] --[[ Name: requestGameData ]]
            -- upvalues: v39 (copy), l_ApiFetchGamesDataByPlaceIds_0 (ref)
            return v39(l_ApiFetchGamesDataByPlaceIds_0(v40, {
                v41
            }));
        end, 
        closeCallback = function() --[[ Line: 133 ]] --[[ Name: closeCallback ]]
            -- upvalues: v39 (copy), v10 (ref)
            v39(v10());
        end
    };
end)(v17);
return (l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    networking = v6
})(v17));