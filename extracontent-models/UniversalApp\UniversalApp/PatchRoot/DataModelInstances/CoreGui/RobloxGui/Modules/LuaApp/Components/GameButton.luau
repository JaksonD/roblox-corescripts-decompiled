local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local v9 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_RoactAnalyticsCommonGameEvents_0 = v8.RoactAnalyticsCommonGameEvents;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v12 = require(l_Modules_0.LuaApp.Enum.FeatureContext);
local v13 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local v14 = require(l_Modules_0.LuaApp.Models.User);
local l_PlayabilityStatusEnum_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum;
local l_ConvertUniverseIdToString_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).ConvertUniverseIdToString;
local v17 = require(l_Modules_0.LuaApp.Util.joinGame);
local v18 = require(l_Modules_0.LuaApp.Constants);
local v19 = require(l_Modules_0.LuaApp.Components.FitImageTextButton);
local v20 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_FFlagPeopleListContextualMenuFixFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPeopleListContextualMenuFixFocusNavigation;
local l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel;
local l_FFlagEnablePartyNudgeV1_DEV_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePartyNudgeV1_DEV;
local l_GREEN_PRIMARY_0 = v18.Color.GREEN_PRIMARY;
local l_WHITE_0 = v18.Color.WHITE;
local l_VIEW_GAME_DETAILS_FROM_BUTTON_0 = v18.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_BUTTON;
local l_SmallRobuxIcon_0 = v18.SmallRobuxIcon;
local function v37(v29, v30, v31) --[[ Line: 52 ]]
    assert(type(v29) == "number", "formatInteger expects a number; was given type: " .. type(v29));
    v30 = v30 or ",";
    v31 = v31 or 3;
    assert(v30, "cannot be nil");
    assert(v31, "cannot be nil");
    local v32 = string.format("%.0f", (math.abs(v29)));
    local v33 = #v32 % v31;
    if v33 == 0 then
        v33 = v31;
    end;
    local v34 = "(" .. string.rep("%d", v31) .. ")";
    local v35 = v30 .. "%1";
    local v36 = v32:sub(1, v33) .. v32:sub(v33 + 1):gsub(v34, v35);
    if v29 < 0 then
        v36 = "-" .. v36;
    end;
    return v36;
end;
local v38 = {
    [v12.PeopleList] = {
        ViewDetailsEnabled = true, 
        JoinGameEnabled = true, 
        BuyToPlayButtonEnabled = true
    }, 
    [v12.PlacesList] = {
        ViewDetailsEnabled = false, 
        JoinGameEnabled = false, 
        BuyToPlayButtonEnabled = true
    }, 
    Default = {
        ViewDetailsEnabled = true, 
        JoinGameEnabled = true, 
        BuyToPlayButtonEnabled = true
    }
};
local v39 = v3.PureComponent:extend("GameButton");
v39.defaultProps = {
    showLoadingIndicatorWhenDataNotReady = false
};
v39.init = function(v40) --[[ Line: 101 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v12 (copy), l_VIEW_GAME_DETAILS_FROM_BUTTON_0 (copy), v18 (copy), v17 (copy)
    v40.openGameDetailsFromButton = function() --[[ Line: 102 ]]
        -- upvalues: v40 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (ref), v12 (ref), l_VIEW_GAME_DETAILS_FROM_BUTTON_0 (ref)
        local l_universePlaceInfo_0 = v40.props.universePlaceInfo;
        if not l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 and not l_universePlaceInfo_0 then
            return;
        else
            local l_analytics_0 = v40.props.analytics;
            local l_friend_0 = v40.props.friend;
            local l_index_0 = v40.props.index;
            local l_absolutePosition_0 = v40.props.absolutePosition;
            local l_callbackOnOpenGameDetails_0 = v40.props.callbackOnOpenGameDetails;
            local l_featureContext_0 = v40.props.featureContext;
            local v48 = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_0.universeRootPlaceId or -1 else l_universePlaceInfo_0.universeRootPlaceId;
            local l_placeId_0 = l_universePlaceInfo_0.placeId;
            local l_universeId_0 = l_universePlaceInfo_0.universeId;
            if l_placeId_0 then
                if l_featureContext_0 == v12.PeopleList then
                    l_analytics_0.reportViewProfileFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, v48, l_VIEW_GAME_DETAILS_FROM_BUTTON_0);
                    l_analytics_0.reportOpenGameDetailFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, v48, l_universeId_0, "gameButton", "GameDetailFromGameButton");
                end;
                if l_callbackOnOpenGameDetails_0 then
                    l_callbackOnOpenGameDetails_0();
                end;
                v40.props.openGameDetails(l_universeId_0);
            end;
            return;
        end;
    end;
    v40.joinGameByUser = function() --[[ Line: 152 ]]
        -- upvalues: v40 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (ref), v12 (ref), v18 (ref), v17 (ref)
        local l_universePlaceInfo_1 = v40.props.universePlaceInfo;
        if not l_universePlaceInfo_1 then
            return;
        else
            local l_analytics_1 = v40.props.analytics;
            local l_friend_1 = v40.props.friend;
            local l_index_1 = v40.props.index;
            local l_callbackOnJoinGame_0 = v40.props.callbackOnJoinGame;
            local l_featureContext_1 = v40.props.featureContext;
            local l_absolutePosition_1 = v40.props.absolutePosition;
            local l_inGameFriendCount_0 = v40.props.inGameFriendCount;
            local l_source_0 = v40.props.source;
            local l_placeId_1 = l_universePlaceInfo_1.placeId;
            local v61 = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_universePlaceInfo_1.universeRootPlaceId or -1 else l_universePlaceInfo_1.universeRootPlaceId;
            if l_callbackOnJoinGame_0 then
                l_callbackOnJoinGame_0();
            end;
            local v62 = nil;
            local v63 = nil;
            if l_featureContext_1 == v12.PeopleList then
                v63 = v18.AnalyticsContext.PeopleListInHomePage;
                v62 = function(v64) --[[ Line: 180 ]]
                    -- upvalues: l_analytics_1 (copy), l_friend_1 (copy), l_index_1 (copy), l_absolutePosition_1 (copy), l_placeId_1 (copy), v61 (copy), l_inGameFriendCount_0 (copy), l_source_0 (copy)
                    l_analytics_1.reportPeopleListJoinGame(l_friend_1.id, l_index_1, l_absolutePosition_1, l_placeId_1, v61, l_friend_1.gameInstanceId, l_inGameFriendCount_0, v64, l_source_0);
                end;
            elseif l_featureContext_1 == v12.PlacesList then
                v63 = v18.AnalyticsContext.GamePlayIntentInPlacesList;
                v62 = function(v65) --[[ Line: 195 ]]
                    -- upvalues: l_analytics_1 (copy), l_friend_1 (copy), l_placeId_1 (copy), v61 (copy)
                    l_analytics_1.reportJoinGameInPlacesList(l_friend_1.id, l_placeId_1, v61, l_friend_1.gameInstanceId, v65);
                end;
            end;
            v17:ByUserAndPlaceId(l_friend_1, l_placeId_1, v63, v62);
            return;
        end;
    end;
end;
v39.render = function(v66) --[[ Line: 209 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v20 (copy), l_FFlagPeopleListContextualMenuFixFocusNavigation_0 (copy), v38 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_GREEN_PRIMARY_0 (copy), l_WHITE_0 (copy), v18 (copy), l_FFlagEnablePartyNudgeV1_DEV_0 (copy), l_SmallRobuxIcon_0 (copy), v37 (copy), v19 (copy), l_withStyle_0 (copy), v21 (copy), v6 (copy)
    local l_universePlaceInfo_2 = v66.props.universePlaceInfo;
    if not l_universePlaceInfo_2 and v66.props.showLoadingIndicatorWhenDataNotReady then
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 104, 0, 32)
        }, {
            LoadingBar = v3.createElement(v20)
        });
    else
        local l_localization_0 = v66.props.localization;
        local l_layoutOrder_0 = v66.props.layoutOrder;
        local l_maxWidth_0 = v66.props.maxWidth;
        local l_featureContext_2 = v66.props.featureContext;
        local v72 = if l_FFlagPeopleListContextualMenuFixFocusNavigation_0 then v66.props.selectionOrder else nil;
        local v73 = v38[l_featureContext_2] or v38.Default;
        local v74 = false;
        local v75 = false;
        local v76 = nil;
        if l_universePlaceInfo_2 then
            v74 = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v73.JoinGameEnabled and (l_universePlaceInfo_2.isPlayable == nil or l_universePlaceInfo_2.isPlayable) else v73.JoinGameEnabled and l_universePlaceInfo_2.isPlayable;
            v75 = v73.BuyToPlayButtonEnabled and l_universePlaceInfo_2.reasonProhibited == l_PlayabilityStatusEnum_0.PurchaseRequired;
            v76 = l_universePlaceInfo_2.price;
        end;
        local l_ViewDetailsEnabled_0 = v73.ViewDetailsEnabled;
        local function v99(v78, v79) --[[ Line: 245 ]]
            -- upvalues: l_GREEN_PRIMARY_0 (ref), l_WHITE_0 (ref), v18 (ref), v74 (ref), l_FFlagEnablePartyNudgeV1_DEV_0 (ref), v66 (copy), v75 (ref), l_SmallRobuxIcon_0 (ref), l_ViewDetailsEnabled_0 (copy), v37 (ref), v76 (ref), v3 (ref), v19 (ref), l_layoutOrder_0 (copy), l_maxWidth_0 (copy), l_FFlagPeopleListContextualMenuFixFocusNavigation_0 (ref), v72 (copy)
            local l_l_GREEN_PRIMARY_0_0 = l_GREEN_PRIMARY_0;
            local v81 = 0;
            local l_l_WHITE_0_0 = l_WHITE_0;
            local v83 = 0;
            local l_WHITE_1 = v18.Color.WHITE;
            local v85 = 0;
            local l_GRAY1_0 = v18.Color.GRAY1;
            local v87 = 0;
            local v88 = nil;
            if v78 then
                local l_Theme_0 = v78.Theme;
                local l_Font_0 = v78.Font;
                l_l_GREEN_PRIMARY_0_0 = l_Theme_0.ContextualPrimaryDefault.Color;
                v81 = l_Theme_0.ContextualPrimaryDefault.Transparency;
                l_l_WHITE_0_0 = l_Theme_0.ContextualPrimaryContent.Color;
                v83 = l_Theme_0.ContextualPrimaryContent.Transparency;
                l_WHITE_1 = l_Theme_0.SystemPrimaryDefault.Color;
                v85 = l_Theme_0.SystemPrimaryDefault.Transparency;
                l_GRAY1_0 = l_Theme_0.SystemPrimaryContent.Color;
                v87 = l_Theme_0.SystemPrimaryContent.Transparency;
                v88 = l_Font_0.Header2.Font;
            end;
            local l_l_l_GREEN_PRIMARY_0_0_0 = l_l_GREEN_PRIMARY_0_0;
            local l_v81_0 = v81;
            local l_l_l_WHITE_0_0_0 = l_l_WHITE_0_0;
            local l_v83_0 = v83;
            local v95 = nil;
            local v96 = nil;
            local v97 = nil;
            if v74 then
                v95 = if l_FFlagEnablePartyNudgeV1_DEV_0 and v66.props.currentSquad and v66.props.currentSquad.squadId and v66.props.currentSquad.squadId ~= "" then v79.joinWithPartyText else v79.joinText;
                v96 = v66.joinGameByUser;
            elseif v75 then
                v96 = v66.openGameDetailsFromButton;
                v97 = l_SmallRobuxIcon_0;
            elseif l_ViewDetailsEnabled_0 then
                v95 = v79.viewDetailsText;
                v96 = v66.openGameDetailsFromButton;
                l_l_l_GREEN_PRIMARY_0_0_0 = l_WHITE_1;
                l_v81_0 = v85;
                l_l_l_WHITE_0_0_0 = l_GRAY1_0;
                l_v83_0 = v87;
            else
                return nil;
            end;
            local v98 = v75 and v37(v76) or v95;
            return v3.createElement(v19, {
                backgroundColor = l_l_l_GREEN_PRIMARY_0_0_0, 
                backgroundTransparency = l_v81_0, 
                backgroundImage = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png", 
                layoutOrder = l_layoutOrder_0, 
                leftIconEnabled = v97 ~= nil, 
                leftIcon = v97, 
                maxWidth = l_maxWidth_0, 
                minWidth = 90, 
                textFont = v88, 
                text = v98, 
                textColor = l_l_l_WHITE_0_0_0, 
                textTransparency = l_v83_0, 
                onActivated = v96, 
                selectionOrder = if l_FFlagPeopleListContextualMenuFixFocusNavigation_0 then v72 else nil
            });
        end;
        local function v102(v100) --[[ Line: 319 ]]
            -- upvalues: l_withStyle_0 (ref), v99 (copy)
            return l_withStyle_0(function(v101) --[[ Line: 320 ]]
                -- upvalues: v99 (ref), v100 (copy)
                return v99(v101, v100);
            end);
        end;
        if v21() then
            return v6({
                joinText = "Feature.Chat.Drawer.Join", 
                joinWithPartyText = "Feature.Squads.Action.JoinWithParty", 
                viewDetailsText = "Feature.Chat.Drawer.ViewDetails"
            })(v102);
        else
            return v102({
                joinText = l_localization_0:Format("Feature.Chat.Drawer.Join"), 
                joinWithPartyText = l_localization_0:Format("Feature.Squads.Action.JoinWithParty"), 
                viewDetailsText = l_localization_0:Format("Feature.Chat.Drawer.ViewDetails")
            });
        end;
    end;
end;
v39 = v4.connect(function(v103, v104) --[[ Line: 341 ]]
    -- upvalues: l_ConvertUniverseIdToString_0 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v2 (copy), v14 (copy), l_FFlagEnablePartyNudgeV1_DEV_0 (copy)
    local v105 = l_ConvertUniverseIdToString_0(v104.universeId);
    local v106 = nil;
    if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then
        v106 = {
            universeId = v105, 
            universeRootPlaceId = v104.universeRootPlaceId, 
            placeId = v104.placeId
        };
    end;
    return {
        universePlaceInfo = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v2.Dictionary.union(v103.UniversePlaceInfos[v105] or {}, v106) else v103.UniversePlaceInfos[v105], 
        inGameFriendCount = v103.FriendPresenceCounts[v14.PresenceType.IN_GAME], 
        currentSquad = if l_FFlagEnablePartyNudgeV1_DEV_0 then v103.Squad and v103.Squad.Squad and v103.Squad.Squad.currentSquad else nil
    };
end, function(v107) --[[ Line: 362 ]]
    -- upvalues: v13 (copy)
    return {
        openGameDetails = function(v108) --[[ Line: 364 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v107 (copy), v13 (ref)
            v107(v13(v108));
        end
    };
end)(v39);
return (l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    guiService = l_AppGuiService_0, 
    localization = v9
})(v39));