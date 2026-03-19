local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local _ = require(l_script_FirstAncestor_0.types);
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(l_script_FirstAncestor_0.Utils.constructGameThumbnailUrl);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.Signals);
local l_EventStream_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventStream;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v8.memo;
local l_useCallback_0 = v8.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v8.useEffect;
local v17 = require(l_script_FirstAncestor_0.Hooks.useIsExternalNavigationAvailable);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useMemo_0 = v8.useMemo;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v21 = require(l_Parent_0.Loggers).Logger:new("GameCardContainer");
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_GameParams_0 = require(l_Parent_0.ExperienceService).GameParams;
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local l_ApiFetchGameDetails_0 = require(l_Parent_0.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ApiFetchPlayabilityStatus_0 = require(l_Parent_0.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus;
local l_ApiFetchGameIcons_0 = require(l_Parent_0.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v28 = require(script.Parent.ReportAnEvent);
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v33 = require(script.Parent.GameCard);
local v34 = require(script.Parent.GameCardGroupable);
local v35 = require(l_Parent_0.DataHydration);
local v36 = require(l_script_FirstAncestor_0.Enums.RoundedVariant);
local v37 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v38 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v39 = require(script.Parent.Parent.ChatConversationTelemetryEvents);
local l_AppGame_0 = l_RoactServices_0.AppGame;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local v44 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v45 = require(l_Parent_0.HttpRequest);
local v49 = v45.config({
    requestFunction = function(v46, v47, v48) --[[ Line: 70 ]] --[[ Name: requestFunction ]]
        -- upvalues: v21 (copy), v45 (copy)
        v21:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v47, v46));
        return v45.requestFunctions.HttpRbxApi(v46, v47, v48);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("GameCardContainerHttpRetryCount", 4) else nil
});
local v50 = require(l_script_FirstAncestor_0.EnumScreens);
local v51 = require(l_script_FirstAncestor_0.Flags.getFFlagSupportGameCardForInExpPlatChat);
local v52 = game:DefineFastFlag("AppChatShutdownBeforeLaunch", false);
local v53 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatHidePlayButtonsInExp);
local v54 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewGameCardUI);
local v65 = {
    networkImpl = v49, 
    eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0), 
    eventIngest = l_EventIngest_0.new(l_EventIngestService_0), 
    placeId = nil, 
    universeId = nil, 
    conversationId = nil, 
    luaChatPlayTogetherEnabled = nil, 
    onDetailsOpened = function() --[[ Line: 117 ]] --[[ Name: onDetailsOpened ]]

    end, 
    onPlayButtonActivated = function(v55) --[[ Line: 119 ]] --[[ Name: onPlayButtonActivated ]]
        -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v28 (copy), v9 (copy), l_GameParams_0 (copy), v52 (copy), l_ExperienceService_0 (copy)
        local l_placeId_0 = v55.placeId;
        local l_senderUserId_0 = v55.senderUserId;
        l_SetGamePlaySession_0(v55.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromChat, true);
        v28(v55, "clickBtnFromLinkCardInChat", "touch");
        if l_placeId_0 then
            local function v59(v58) --[[ Line: 128 ]]
                -- upvalues: v55 (ref), v9 (ref), v28 (ref)
                v55 = v9.Dictionary.join(v55, {
                    joinAttemptId = v58
                });
                v28(v55, "gamePlayIntent", "PlayGameFromLinkCard");
            end;
            local v60 = l_GameParams_0.fromParams({
                userId = l_senderUserId_0, 
                placeId = l_placeId_0
            });
            if v52 then
                game:Shutdown();
            end;
            l_ExperienceService_0:LaunchExperience(v60, "PlayGameFromLinkCard", v59);
        end;
    end, 
    openDetails = function(v61) --[[ Line: 146 ]] --[[ Name: openDetails ]]
        -- upvalues: v28 (copy)
        local l_universeId_0 = v61.universeId;
        local l_placeId_1 = v61.placeId;
        v28(v61, "clickLinkCardInChat", "touch");
        v61.onDetailsOpened();
        v61.openGameDetailsPage(l_universeId_0, "LuaChatAssetCard");
        local v64 = v61.analytics and v61.analytics.reportOpenGameDetailFromChat;
        if v64 then
            v64(l_placeId_1, v61.conversationId, l_universeId_0, "GameDetailFromLinkCard");
        end;
    end
};
local function _(v66, v67) --[[ Line: 163 ]] --[[ Name: getGameIcon ]]
    -- upvalues: l_GameIconReducer_0 (copy)
    local v68 = v66[l_GameIconReducer_0.key][v67];
    if v68 then
        return v68.url;
    else
        return "";
    end;
end;
local function _(v70, v71) --[[ Line: 172 ]] --[[ Name: getGameDetails ]]
    return v70.GameDetails[v71] or {};
end;
local function _(v73, v74) --[[ Line: 176 ]] --[[ Name: getGamePlayabilityStatus ]]
    return v73.PlayabilityStatus[v74] or {};
end;
GameCardContainer = function(v76) --[[ Line: 180 ]] --[[ Name: GameCardContainer ]]
    -- upvalues: v9 (copy), v65 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v54 (copy), v7 (copy), v6 (copy), v51 (copy), l_GameIconReducer_0 (copy), v17 (copy), v50 (copy), l_useDispatch_0 (copy), l_ApiFetchGameIcons_0 (copy), l_ApiFetchGameDetails_0 (copy), l_ApiFetchPlayabilityStatus_0 (copy), v35 (copy), v10 (copy), l_useMemo_0 (copy), l_useSignalState_0 (copy), v37 (copy), v38 (copy), l_useEffect_0 (copy), v39 (copy), v36 (copy), v8 (copy), v34 (copy), v33 (copy), v44 (copy), v53 (copy), l_withLocalization_0 (copy)
    local v77 = v9.Dictionary.join(v65, v76);
    if not v77.universeId then
        assert("universeId does not exist", "universeId does not exist");
    end;
    local v80 = l_useSelector_0(l_useCallback_0(function(v78) --[[ Line: 186 ]]
        -- upvalues: v77 (copy)
        local l_universeId_1 = v77.universeId;
        return v78.GameDetails[l_universeId_1] or {};
    end, l_dependencyArray_0(v77.universeId)));
    local v83 = l_useSelector_0(l_useCallback_0(function(v81) --[[ Line: 190 ]]
        -- upvalues: v77 (copy)
        local l_universeId_2 = v77.universeId;
        return v81.PlayabilityStatus[l_universeId_2] or {};
    end, l_dependencyArray_0(v77.universeId)));
    local v84 = nil;
    if v54 then
        v84 = v7(v77.placeId, v6.GameCard.THUMBNAIL_WIDTH, v6.GameCard.THUMBNAIL_HEIGHT);
    end;
    local v88 = if v51() then ("rbxthumb://type=GameIcon&id=%*&w=%*&h=%*"):format(v77.universeId, 150, 150) else l_useSelector_0(l_useCallback_0(function(v85) --[[ Line: 205 ]]
        -- upvalues: v77 (copy), l_GameIconReducer_0 (ref)
        local l_universeId_3 = v77.universeId;
        local v87 = v85[l_GameIconReducer_0.key][l_universeId_3];
        if v87 then
            return v87.url;
        else
            return "";
        end;
    end, l_dependencyArray_0(v77.universeId)));
    local v89 = v17({
        v50.GameDetail
    });
    local v90 = v77.placeId or v80.rootPlaceId;
    local l_name_0 = v80.name;
    local v92 = v80.description or "";
    local v93 = v80.price or 0;
    local v94 = l_useDispatch_0();
    local function v97(v95, v96) --[[ Line: 219 ]]
        -- upvalues: v51 (ref), v94 (copy), l_ApiFetchGameIcons_0 (ref), l_ApiFetchGameDetails_0 (ref), l_ApiFetchPlayabilityStatus_0 (ref)
        if not v51() then
            v94(l_ApiFetchGameIcons_0(v95, {
                v96
            }));
        end;
        v94(l_ApiFetchGameDetails_0.Fetch(v95, {
            v96
        }));
        v94(l_ApiFetchPlayabilityStatus_0.Fetch(v95, {
            v96
        }));
    end;
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    if v54 then
        local v102 = v35.Game.getVotesStore(false);
        local v103 = v10.createSignal(nil);
        local v104 = v10.createSignal("NotReady");
        local l_v103_0 = v103 --[[ copy: 18 -> 25 ]];
        local l_v104_0 = v104 --[[ copy: 19 -> 26 ]];
        local l_v102_0 = v102 --[[ copy: 17 -> 27 ]];
        v98 = l_useMemo_0(function() --[[ Line: 234 ]]
            -- upvalues: v77 (copy), l_v103_0 (copy), l_v104_0 (copy), l_v102_0 (copy)
            if not v77.universeId then
                return {
                    data = l_v103_0, 
                    status = l_v104_0
                };
            else
                return l_v102_0.getAndFetchVotes({
                    v77.universeId
                })[v77.universeId] or {
                    data = l_v103_0, 
                    status = l_v104_0
                };
            end;
        end, {
            v102, 
            v77.universeId
        });
        v99 = l_useSignalState_0(v98.data);
        v100 = l_useSignalState_0(v98.status);
        v101 = l_useMemo_0(function() --[[ Line: 254 ]]
            -- upvalues: v99 (ref)
            if v99 and v99.upVotes and v99.downVotes then
                local v108 = v99.upVotes + v99.downVotes;
                if v108 > 0 then
                    return tostring((math.floor(v99.upVotes / v108 * 100))) .. "%";
                end;
            end;
            return "--";
        end, {
            v99
        });
    end;
    local v109 = v37(v38.Context);
    local function _() --[[ Line: 267 ]] --[[ Name: hasAllInformation ]]
        -- upvalues: v90 (copy), l_name_0 (copy), v92 (copy), v83 (copy), v93 (copy)
        if v90 and l_name_0 and v92 and v83 and v83.isPlayable ~= nil and v93 then
            return true;
        else
            return false;
        end;
    end;
    l_useEffect_0(function() --[[ Line: 280 ]]
        -- upvalues: v77 (copy), v97 (copy)
        local l_universeId_4 = v77.universeId;
        if not l_universeId_4 then
            return;
        else
            v97(v77.networkImpl, l_universeId_4);
            return;
        end;
    end, {
        v77.universeId, 
        v77.networkImpl
    });
    local v112 = nil;
    local v113 = nil;
    local v114 = nil;
    if v54 then
        v112 = l_useCallback_0(function() --[[ Line: 295 ]]
            -- upvalues: v109 (copy), v39 (ref), v77 (copy), v90 (copy)
            v109.emit(v39.GameCardThumbnailClicked, {
                universeId = v77.universeId, 
                placeId = v90
            });
            v77.openDetails(v77);
        end, l_dependencyArray_0(v109, v77.openDetails, v77.universeId, v90));
        v113 = l_useCallback_0(function() --[[ Line: 303 ]]
            -- upvalues: v109 (copy), v39 (ref), v77 (copy), v90 (copy)
            v109.emit(v39.GameCardPlayButtonClicked, {
                universeId = v77.universeId, 
                placeId = v90
            });
            v77.onPlayButtonActivated(v77);
        end, l_dependencyArray_0(v109, v77.onPlayButtonActivated, v77.universeId, v90));
        v114 = l_useCallback_0(function() --[[ Line: 311 ]]
            -- upvalues: v109 (copy), v39 (ref), v77 (copy), v90 (copy)
            v109.emit(v39.GameCardMetadataClicked, {
                universeId = v77.universeId, 
                placeId = v90
            });
            v77.openDetails(v77);
        end, l_dependencyArray_0(v109, v77.openDetails, v77.universeId, v90));
    end;
    local function v123(v115, v116) --[[ Line: 320 ]] --[[ Name: renderCard ]]
        -- upvalues: v54 (ref), v36 (ref), v112 (ref), v113 (ref), v114 (ref), v8 (ref), v34 (ref), v33 (ref), v9 (ref), v90 (copy), l_name_0 (copy), v92 (copy), v83 (copy), v93 (copy)
        if v54 then
            local v117 = not v115.universeId or not v115.gameName or not v115.gameThumbnail or v115.votesStatus == "NotReady" or not v115.gamePlayerCount;
            local v118 = false;
            if v115.isPlayButtonEnabled and v115.playabilityStatus then
                v118 = v115.playabilityStatus.isPlayable == true;
            end;
            local v119 = if v115.isStartOfGroup then v36.Top else if v115.isIncoming then v36.TopRight else v36.TopLeft;
            local v120 = if v115.openDetails then v112 else nil;
            local v121 = if v115.onPlayButtonActivated then v113 else nil;
            local v122 = if v115.openDetails then v114 else nil;
            return v8.createElement(v34, {
                gameName = v115.gameName, 
                gameDescription = v115.gameDescription, 
                gameThumbnail = v115.gameThumbnail, 
                gameRating = v115.gameRating, 
                gamePlayerCount = v115.gamePlayerCount, 
                thumbnailAspectRatio = 1.7777777777777777, 
                thumbnailRoundedVariant = v119, 
                shouldShowPlayButton = v118, 
                onPlayButtonActivated = v121, 
                onThumbnailActivated = v120, 
                onMetadataActivated = v122, 
                isRepliedTo = v115.isRepliedTo, 
                isIncoming = v115.isIncoming, 
                isPending = v115.isPending, 
                isLoading = v117, 
                LayoutOrder = v115.layoutOrder
            });
        elseif not v115.universeId then
            return v8.createElement(v33, v116);
        else
            return v8.createElement(v33, v9.Dictionary.join(v115, v116, {
                isLoading = not if v90 and l_name_0 and v92 and v83 then v83.isPlayable ~= nil and (v93 and true or false) else false
            }));
        end;
    end;
    local v124 = v44();
    local v125 = not v53() or not v124 or false;
    return l_withLocalization_0({
        purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame", 
        viewDetailsText = "Feature.Chat.Action.ViewAssetDetails", 
        playText = "Common.VisitGame.Label.Play", 
        noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
    })(function(v126) --[[ Line: 386 ]]
        -- upvalues: v9 (ref), v77 (copy), v80 (copy), v83 (copy), v88 (copy), v90 (copy), l_name_0 (copy), v92 (copy), v93 (copy), v125 (copy), v89 (copy), v50 (ref), v97 (copy), v54 (ref), v84 (ref), v101 (ref), v100 (ref), v123 (copy)
        local v127 = v9.Dictionary.join(v77, {
            details = v80, 
            playabilityStatus = v83, 
            gameIcon = v88, 
            placeId = v90, 
            gameName = l_name_0, 
            gameDescription = v92, 
            gamePrice = v93, 
            isPlayButtonEnabled = v125, 
            viewDetailsEnabled = v89[v50.GameDetail], 
            fetchGameData = v97
        });
        if v54 then
            v127 = v9.Dictionary.join(v127, {
                gameThumbnail = v84, 
                gameRating = v101, 
                gamePlayerCount = v80.playing or 0, 
                votesStatus = v100
            });
        end;
        return v123(v127, v126);
    end);
end;
return l_RoactServices_0.connect({
    game = l_AppGame_0, 
    sessionService = l_AppSessionService_0, 
    analytics = l_RoactAnalyticsCommonGameEvents_0
})(l_memo_0(GameCardContainer));