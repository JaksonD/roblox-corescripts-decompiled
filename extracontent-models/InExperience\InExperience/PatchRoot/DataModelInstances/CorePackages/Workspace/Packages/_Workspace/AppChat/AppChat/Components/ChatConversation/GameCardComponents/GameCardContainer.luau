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
local v33 = require(script.Parent.GameCardGroupable);
local v34 = require(l_Parent_0.DataHydration);
local v35 = require(l_script_FirstAncestor_0.Enums.RoundedVariant);
local v36 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v37 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v38 = require(script.Parent.Parent.ChatConversationTelemetryEvents);
local l_AppGame_0 = l_RoactServices_0.AppGame;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local v43 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v44 = require(l_Parent_0.HttpRequest);
local v48 = v44.config({
    requestFunction = function(v45, v46, v47) --[[ Line: 69 ]] --[[ Name: requestFunction ]]
        -- upvalues: v21 (copy), v44 (copy)
        v21:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v46, v45));
        return v44.requestFunctions.HttpRbxApi(v45, v46, v47);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("GameCardContainerHttpRetryCount", 4) else nil
});
local v49 = require(l_script_FirstAncestor_0.EnumScreens);
local v50 = require(l_script_FirstAncestor_0.Flags.getFFlagSupportGameCardForInExpPlatChat);
local v51 = game:DefineFastFlag("AppChatShutdownBeforeLaunch", false);
local v52 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatHidePlayButtonsInExp);
local v63 = {
    networkImpl = v48, 
    eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0), 
    eventIngest = l_EventIngest_0.new(l_EventIngestService_0), 
    placeId = nil, 
    universeId = nil, 
    conversationId = nil, 
    luaChatPlayTogetherEnabled = nil, 
    onDetailsOpened = function() --[[ Line: 115 ]] --[[ Name: onDetailsOpened ]]

    end, 
    onPlayButtonActivated = function(v53) --[[ Line: 117 ]] --[[ Name: onPlayButtonActivated ]]
        -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v28 (copy), v9 (copy), l_GameParams_0 (copy), v51 (copy), l_ExperienceService_0 (copy)
        local l_placeId_0 = v53.placeId;
        local l_senderUserId_0 = v53.senderUserId;
        l_SetGamePlaySession_0(v53.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromChat, true);
        v28(v53, "clickBtnFromLinkCardInChat", "touch");
        if l_placeId_0 then
            local function v57(v56) --[[ Line: 126 ]]
                -- upvalues: v53 (ref), v9 (ref), v28 (ref)
                v53 = v9.Dictionary.join(v53, {
                    joinAttemptId = v56
                });
                v28(v53, "gamePlayIntent", "PlayGameFromLinkCard");
            end;
            local v58 = l_GameParams_0.fromParams({
                userId = l_senderUserId_0, 
                placeId = l_placeId_0
            });
            if v51 then
                game:Shutdown();
            end;
            l_ExperienceService_0:LaunchExperience(v58, "PlayGameFromLinkCard", v57);
        end;
    end, 
    openDetails = function(v59) --[[ Line: 144 ]] --[[ Name: openDetails ]]
        -- upvalues: v28 (copy)
        local l_universeId_0 = v59.universeId;
        local l_placeId_1 = v59.placeId;
        v28(v59, "clickLinkCardInChat", "touch");
        v59.onDetailsOpened();
        v59.openGameDetailsPage(l_universeId_0, "LuaChatAssetCard");
        local v62 = v59.analytics and v59.analytics.reportOpenGameDetailFromChat;
        if v62 then
            v62(l_placeId_1, v59.conversationId, l_universeId_0, "GameDetailFromLinkCard");
        end;
    end
};
local function _(v64, v65) --[[ Line: 161 ]] --[[ Name: getGameIcon ]]
    -- upvalues: l_GameIconReducer_0 (copy)
    local v66 = v64[l_GameIconReducer_0.key][v65];
    if v66 then
        return v66.url;
    else
        return "";
    end;
end;
local function _(v68, v69) --[[ Line: 170 ]] --[[ Name: getGameDetails ]]
    return v68.GameDetails[v69] or {};
end;
local function _(v71, v72) --[[ Line: 174 ]] --[[ Name: getGamePlayabilityStatus ]]
    return v71.PlayabilityStatus[v72] or {};
end;
GameCardContainer = function(v74) --[[ Line: 178 ]] --[[ Name: GameCardContainer ]]
    -- upvalues: v9 (copy), v63 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v7 (copy), v6 (copy), v50 (copy), l_GameIconReducer_0 (copy), v17 (copy), v49 (copy), l_useDispatch_0 (copy), l_ApiFetchGameIcons_0 (copy), l_ApiFetchGameDetails_0 (copy), l_ApiFetchPlayabilityStatus_0 (copy), v34 (copy), v10 (copy), l_useMemo_0 (copy), l_useSignalState_0 (copy), v36 (copy), v37 (copy), l_useEffect_0 (copy), v38 (copy), v35 (copy), v8 (copy), v33 (copy), v43 (copy), v52 (copy), l_withLocalization_0 (copy)
    local v75 = v9.Dictionary.join(v63, v74);
    if not v75.universeId then
        assert("universeId does not exist", "universeId does not exist");
    end;
    local v78 = l_useSelector_0(l_useCallback_0(function(v76) --[[ Line: 184 ]]
        -- upvalues: v75 (copy)
        local l_universeId_1 = v75.universeId;
        return v76.GameDetails[l_universeId_1] or {};
    end, l_dependencyArray_0(v75.universeId)));
    local v81 = l_useSelector_0(l_useCallback_0(function(v79) --[[ Line: 188 ]]
        -- upvalues: v75 (copy)
        local l_universeId_2 = v75.universeId;
        return v79.PlayabilityStatus[l_universeId_2] or {};
    end, l_dependencyArray_0(v75.universeId)));
    local v82 = v7(v75.placeId, v6.GameCard.THUMBNAIL_WIDTH, v6.GameCard.THUMBNAIL_HEIGHT);
    local v86 = if v50() then ("rbxthumb://type=GameIcon&id=%*&w=%*&h=%*"):format(v75.universeId, 150, 150) else l_useSelector_0(l_useCallback_0(function(v83) --[[ Line: 200 ]]
        -- upvalues: v75 (copy), l_GameIconReducer_0 (ref)
        local l_universeId_3 = v75.universeId;
        local v85 = v83[l_GameIconReducer_0.key][l_universeId_3];
        if v85 then
            return v85.url;
        else
            return "";
        end;
    end, l_dependencyArray_0(v75.universeId)));
    local v87 = v17({
        v49.GameDetail
    });
    local v88 = v75.placeId or v78.rootPlaceId;
    local l_name_0 = v78.name;
    local v90 = v78.description or "";
    local v91 = v78.price or 0;
    local v92 = l_useDispatch_0();
    local function v95(v93, v94) --[[ Line: 214 ]]
        -- upvalues: v50 (ref), v92 (copy), l_ApiFetchGameIcons_0 (ref), l_ApiFetchGameDetails_0 (ref), l_ApiFetchPlayabilityStatus_0 (ref)
        if not v50() then
            v92(l_ApiFetchGameIcons_0(v93, {
                v94
            }));
        end;
        v92(l_ApiFetchGameDetails_0.Fetch(v93, {
            v94
        }));
        v92(l_ApiFetchPlayabilityStatus_0.Fetch(v93, {
            v94
        }));
    end;
    local v96 = v34.Game.getVotesStore(false);
    local v97 = v10.createSignal(nil);
    local v98 = v10.createSignal("NotReady");
    local v99 = l_useMemo_0(function() --[[ Line: 227 ]]
        -- upvalues: v75 (copy), v97 (copy), v98 (copy), v96 (copy)
        if not v75.universeId then
            return {
                data = v97, 
                status = v98
            };
        else
            return v96.getAndFetchVotes({
                v75.universeId
            })[v75.universeId] or {
                data = v97, 
                status = v98
            };
        end;
    end, {
        v96, 
        v75.universeId
    });
    local v100 = l_useSignalState_0(v99.data);
    local v101 = l_useSignalState_0(v99.status);
    local v103 = l_useMemo_0(function() --[[ Line: 247 ]]
        -- upvalues: v100 (copy)
        if v100 and v100.upVotes and v100.downVotes then
            local v102 = v100.upVotes + v100.downVotes;
            if v102 > 0 then
                return tostring((math.floor(v100.upVotes / v102 * 100))) .. "%";
            end;
        end;
        return "--";
    end, {
        v100
    });
    local v104 = v36(v37.Context);
    l_useEffect_0(function() --[[ Line: 259 ]]
        -- upvalues: v75 (copy), v95 (copy)
        local l_universeId_4 = v75.universeId;
        if not l_universeId_4 then
            return;
        else
            v95(v75.networkImpl, l_universeId_4);
            return;
        end;
    end, {
        v75.universeId, 
        v75.networkImpl
    });
    local v106 = l_useCallback_0(function() --[[ Line: 269 ]]
        -- upvalues: v104 (copy), v38 (ref), v75 (copy), v88 (copy)
        v104.emit(v38.GameCardThumbnailClicked, {
            universeId = v75.universeId, 
            placeId = v88
        });
        v75.openDetails(v75);
    end, l_dependencyArray_0(v104, v75.openDetails, v75.universeId, v88));
    local v107 = l_useCallback_0(function() --[[ Line: 277 ]]
        -- upvalues: v104 (copy), v38 (ref), v75 (copy), v88 (copy)
        v104.emit(v38.GameCardPlayButtonClicked, {
            universeId = v75.universeId, 
            placeId = v88
        });
        v75.onPlayButtonActivated(v75);
    end, l_dependencyArray_0(v104, v75.onPlayButtonActivated, v75.universeId, v88));
    local v108 = l_useCallback_0(function() --[[ Line: 285 ]]
        -- upvalues: v104 (copy), v38 (ref), v75 (copy), v88 (copy)
        v104.emit(v38.GameCardMetadataClicked, {
            universeId = v75.universeId, 
            placeId = v88
        });
        v75.openDetails(v75);
    end, l_dependencyArray_0(v104, v75.openDetails, v75.universeId, v88));
    local function v116(v109) --[[ Line: 293 ]] --[[ Name: renderCard ]]
        -- upvalues: v35 (ref), v106 (copy), v107 (copy), v108 (copy), v8 (ref), v33 (ref)
        local v110 = not v109.universeId or not v109.gameName or not v109.gameThumbnail or v109.votesStatus == "NotReady" or not v109.gamePlayerCount;
        local v111 = false;
        if v109.isPlayButtonEnabled and v109.playabilityStatus then
            v111 = v109.playabilityStatus.isPlayable == true;
        end;
        local v112 = if v109.isStartOfGroup then v35.Top else if v109.isIncoming then v35.TopRight else v35.TopLeft;
        local v113 = if v109.openDetails then v106 else nil;
        local v114 = if v109.onPlayButtonActivated then v107 else nil;
        local v115 = if v109.openDetails then v108 else nil;
        return v8.createElement(v33, {
            gameName = v109.gameName, 
            gameDescription = v109.gameDescription, 
            gameThumbnail = v109.gameThumbnail, 
            gameRating = v109.gameRating, 
            gamePlayerCount = v109.gamePlayerCount, 
            thumbnailAspectRatio = 1.7777777777777777, 
            thumbnailRoundedVariant = v112, 
            shouldShowPlayButton = v111, 
            onPlayButtonActivated = v114, 
            onThumbnailActivated = v113, 
            onMetadataActivated = v115, 
            isRepliedTo = v109.isRepliedTo, 
            isIncoming = v109.isIncoming, 
            isPending = v109.isPending, 
            isLoading = v110, 
            LayoutOrder = v109.layoutOrder
        });
    end;
    local v117 = v43();
    local v118 = not v52() or not v117 or false;
    return l_withLocalization_0({
        purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame", 
        viewDetailsText = "Feature.Chat.Action.ViewAssetDetails", 
        playText = "Common.VisitGame.Label.Play", 
        noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
    })(function(_) --[[ Line: 344 ]]
        -- upvalues: v9 (ref), v75 (copy), v78 (copy), v81 (copy), v86 (copy), v88 (copy), l_name_0 (copy), v90 (copy), v91 (copy), v118 (copy), v87 (copy), v49 (ref), v95 (copy), v82 (copy), v103 (copy), v101 (copy), v116 (copy)
        local v120 = v9.Dictionary.join(v75, {
            details = v78, 
            playabilityStatus = v81, 
            gameIcon = v86, 
            placeId = v88, 
            gameName = l_name_0, 
            gameDescription = v90, 
            gamePrice = v91, 
            isPlayButtonEnabled = v118, 
            viewDetailsEnabled = v87[v49.GameDetail], 
            fetchGameData = v95, 
            gameThumbnail = v82, 
            gameRating = v103, 
            gamePlayerCount = v78.playing or 0, 
            votesStatus = v101
        });
        return v116(v120);
    end);
end;
return l_RoactServices_0.connect({
    game = l_AppGame_0, 
    sessionService = l_AppSessionService_0, 
    analytics = l_RoactAnalyticsCommonGameEvents_0
})(l_memo_0(GameCardContainer));