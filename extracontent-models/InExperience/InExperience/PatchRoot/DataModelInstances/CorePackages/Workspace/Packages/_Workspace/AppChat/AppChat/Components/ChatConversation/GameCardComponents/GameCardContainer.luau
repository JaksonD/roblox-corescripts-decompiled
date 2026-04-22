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
local v27 = require(script.Parent.ReportAnEvent);
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v32 = require(script.Parent.GameCardGroupable);
local v33 = require(l_Parent_0.DataHydration);
local v34 = require(l_script_FirstAncestor_0.Enums.RoundedVariant);
local v35 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v36 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v37 = require(script.Parent.Parent.ChatConversationTelemetryEvents);
local l_AppGame_0 = l_RoactServices_0.AppGame;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local v41 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v42 = require(l_Parent_0.HttpRequest);
local v46 = v42.config({
    requestFunction = function(v43, v44, v45) --[[ Line: 67 ]] --[[ Name: requestFunction ]]
        -- upvalues: v21 (copy), v42 (copy)
        v21:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v44, v43));
        return v42.requestFunctions.HttpRbxApi(v43, v44, v45);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("GameCardContainerHttpRetryCount", 4) else nil
});
local v47 = require(l_script_FirstAncestor_0.EnumScreens);
local v48 = game:DefineFastFlag("AppChatShutdownBeforeLaunch", false);
local v49 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatHidePlayButtonsInExp);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v61 = {
    networkImpl = v46, 
    eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0), 
    eventIngest = l_EventIngest_0.new(l_EventIngestService_0), 
    placeId = nil, 
    universeId = nil, 
    conversationId = nil, 
    luaChatPlayTogetherEnabled = nil, 
    onDetailsOpened = function() --[[ Line: 114 ]] --[[ Name: onDetailsOpened ]]

    end, 
    onPlayButtonActivated = function(v51) --[[ Line: 116 ]] --[[ Name: onPlayButtonActivated ]]
        -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v27 (copy), v9 (copy), l_GameParams_0 (copy), v48 (copy), l_ExperienceService_0 (copy)
        local l_placeId_0 = v51.placeId;
        local l_senderUserId_0 = v51.senderUserId;
        l_SetGamePlaySession_0(v51.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromChat, true);
        v27(v51, "clickBtnFromLinkCardInChat", "touch");
        if l_placeId_0 then
            local function v55(v54) --[[ Line: 125 ]]
                -- upvalues: v51 (ref), v9 (ref), v27 (ref)
                v51 = v9.Dictionary.join(v51, {
                    joinAttemptId = v54
                });
                v27(v51, "gamePlayIntent", "PlayGameFromLinkCard");
            end;
            local v56 = l_GameParams_0.fromParams({
                userId = l_senderUserId_0, 
                placeId = l_placeId_0
            });
            if v48 then
                game:Shutdown();
            end;
            l_ExperienceService_0:LaunchExperience(v56, "PlayGameFromLinkCard", v55);
        end;
    end, 
    openDetails = function(v57) --[[ Line: 143 ]] --[[ Name: openDetails ]]
        -- upvalues: v27 (copy)
        local l_universeId_0 = v57.universeId;
        local l_placeId_1 = v57.placeId;
        v27(v57, "clickLinkCardInChat", "touch");
        v57.onDetailsOpened();
        v57.openGameDetailsPage(l_universeId_0, "LuaChatAssetCard");
        local v60 = v57.analytics and v57.analytics.reportOpenGameDetailFromChat;
        if v60 then
            v60(l_placeId_1, v57.conversationId, l_universeId_0, "GameDetailFromLinkCard");
        end;
    end
};
local function _(v62, v63) --[[ Line: 160 ]] --[[ Name: getGameDetails ]]
    return v62.GameDetails[v63] or {};
end;
local function _(v65, v66) --[[ Line: 164 ]] --[[ Name: getGamePlayabilityStatus ]]
    return v65.PlayabilityStatus[v66] or {};
end;
GameCardContainer = function(v68) --[[ Line: 168 ]] --[[ Name: GameCardContainer ]]
    -- upvalues: v9 (copy), v61 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v7 (copy), v6 (copy), v17 (copy), v47 (copy), l_useDispatch_0 (copy), l_ApiFetchGameDetails_0 (copy), l_ApiFetchPlayabilityStatus_0 (copy), v33 (copy), v10 (copy), l_useMemo_0 (copy), l_useSignalState_0 (copy), v35 (copy), v36 (copy), l_useEffect_0 (copy), v37 (copy), v34 (copy), v8 (copy), v32 (copy), v41 (copy), v49 (copy), l_withLocalization_0 (copy)
    local v69 = v9.Dictionary.join(v61, v68);
    if not v69.universeId then
        assert("universeId does not exist", "universeId does not exist");
    end;
    local v72 = l_useSelector_0(l_useCallback_0(function(v70) --[[ Line: 174 ]]
        -- upvalues: v69 (copy)
        local l_universeId_1 = v69.universeId;
        return v70.GameDetails[l_universeId_1] or {};
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v69.universeId
    } else l_dependencyArray_0(v69.universeId)));
    local v75 = l_useSelector_0(l_useCallback_0(function(v73) --[[ Line: 178 ]]
        -- upvalues: v69 (copy)
        local l_universeId_2 = v69.universeId;
        return v73.PlayabilityStatus[l_universeId_2] or {};
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v69.universeId
    } else l_dependencyArray_0(v69.universeId)));
    local v76 = v7(v69.placeId, v6.GameCard.THUMBNAIL_WIDTH, v6.GameCard.THUMBNAIL_HEIGHT);
    local v77 = ("rbxthumb://type=GameIcon&id=%*&w=%*&h=%*"):format(v69.universeId, 150, 150);
    local v78 = v17({
        v47.GameDetail
    });
    local v79 = v69.placeId or v72.rootPlaceId;
    local l_name_0 = v72.name;
    local v81 = v72.description or "";
    local v82 = v72.price or 0;
    local v83 = l_useDispatch_0();
    local function v86(v84, v85) --[[ Line: 200 ]]
        -- upvalues: v83 (copy), l_ApiFetchGameDetails_0 (ref), l_ApiFetchPlayabilityStatus_0 (ref)
        v83(l_ApiFetchGameDetails_0.Fetch(v84, {
            v85
        }));
        v83(l_ApiFetchPlayabilityStatus_0.Fetch(v84, {
            v85
        }));
    end;
    local v87 = v33.Game.getVotesStore(false);
    local v88 = v10.createSignal(nil);
    local v89 = v10.createSignal("NotReady");
    local v90 = l_useMemo_0(function() --[[ Line: 210 ]]
        -- upvalues: v69 (copy), v88 (copy), v89 (copy), v87 (copy)
        if not v69.universeId then
            return {
                data = v88, 
                status = v89
            };
        else
            return v87.getAndFetchVotes({
                v69.universeId
            })[v69.universeId] or {
                data = v88, 
                status = v89
            };
        end;
    end, {
        v87, 
        v69.universeId
    });
    local v91 = l_useSignalState_0(v90.data);
    local v92 = l_useSignalState_0(v90.status);
    local v94 = l_useMemo_0(function() --[[ Line: 230 ]]
        -- upvalues: v91 (copy)
        if v91 and v91.upVotes and v91.downVotes then
            local v93 = v91.upVotes + v91.downVotes;
            if v93 > 0 then
                return tostring((math.floor(v91.upVotes / v93 * 100))) .. "%";
            end;
        end;
        return "--";
    end, {
        v91
    });
    local v95 = v35(v36.Context);
    l_useEffect_0(function() --[[ Line: 242 ]]
        -- upvalues: v69 (copy), v86 (copy)
        local l_universeId_3 = v69.universeId;
        if not l_universeId_3 then
            return;
        else
            v86(v69.networkImpl, l_universeId_3);
            return;
        end;
    end, {
        v69.universeId, 
        v69.networkImpl
    });
    local v97 = l_useCallback_0(function() --[[ Line: 253 ]]
        -- upvalues: v95 (copy), v37 (ref), v69 (copy), v79 (copy)
        v95.emit(v37.GameCardThumbnailClicked, {
            universeId = v69.universeId, 
            placeId = v79
        });
        v69.openDetails(v69);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v95, 
        v69.openDetails, 
        v69.universeId, 
        v79
    } else l_dependencyArray_0(v95, v69.openDetails, v69.universeId, v79));
    local v98 = l_useCallback_0(function() --[[ Line: 266 ]]
        -- upvalues: v95 (copy), v37 (ref), v69 (copy), v79 (copy)
        v95.emit(v37.GameCardPlayButtonClicked, {
            universeId = v69.universeId, 
            placeId = v79
        });
        v69.onPlayButtonActivated(v69);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v95, 
        v69.onPlayButtonActivated, 
        v69.universeId, 
        v79
    } else l_dependencyArray_0(v95, v69.onPlayButtonActivated, v69.universeId, v79));
    local v99 = l_useCallback_0(function() --[[ Line: 279 ]]
        -- upvalues: v95 (copy), v37 (ref), v69 (copy), v79 (copy)
        v95.emit(v37.GameCardMetadataClicked, {
            universeId = v69.universeId, 
            placeId = v79
        });
        v69.openDetails(v69);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v95, 
        v69.openDetails, 
        v69.universeId, 
        v79
    } else l_dependencyArray_0(v95, v69.openDetails, v69.universeId, v79));
    local function v107(v100) --[[ Line: 291 ]] --[[ Name: renderCard ]]
        -- upvalues: v34 (ref), v97 (copy), v98 (copy), v99 (copy), v8 (ref), v32 (ref)
        local v101 = not v100.universeId or not v100.gameName or not v100.gameThumbnail or v100.votesStatus == "NotReady" or not v100.gamePlayerCount;
        local v102 = false;
        if v100.isPlayButtonEnabled and v100.playabilityStatus then
            v102 = v100.playabilityStatus.isPlayable == true;
        end;
        local v103 = if v100.isStartOfGroup then v34.Top else if v100.isIncoming then v34.TopRight else v34.TopLeft;
        local v104 = if v100.openDetails then v97 else nil;
        local v105 = if v100.onPlayButtonActivated then v98 else nil;
        local v106 = if v100.openDetails then v99 else nil;
        return v8.createElement(v32, {
            gameName = v100.gameName, 
            gameDescription = v100.gameDescription, 
            gameThumbnail = v100.gameThumbnail, 
            gameRating = v100.gameRating, 
            gamePlayerCount = v100.gamePlayerCount, 
            thumbnailAspectRatio = 1.7777777777777777, 
            thumbnailRoundedVariant = v103, 
            shouldShowPlayButton = v102, 
            onPlayButtonActivated = v105, 
            onThumbnailActivated = v104, 
            onMetadataActivated = v106, 
            isRepliedTo = v100.isRepliedTo, 
            isIncoming = v100.isIncoming, 
            isPending = v100.isPending, 
            isLoading = v101, 
            LayoutOrder = v100.layoutOrder
        });
    end;
    local v108 = v41();
    local v109 = not v49() or not v108 or false;
    return l_withLocalization_0({
        purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame", 
        viewDetailsText = "Feature.Chat.Action.ViewAssetDetails", 
        playText = "Common.VisitGame.Label.Play", 
        noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
    })(function(_) --[[ Line: 342 ]]
        -- upvalues: v9 (ref), v69 (copy), v72 (copy), v75 (copy), v77 (copy), v79 (copy), l_name_0 (copy), v81 (copy), v82 (copy), v109 (copy), v78 (copy), v47 (ref), v86 (copy), v76 (copy), v94 (copy), v92 (copy), v107 (copy)
        local v111 = v9.Dictionary.join(v69, {
            details = v72, 
            playabilityStatus = v75, 
            gameIcon = v77, 
            placeId = v79, 
            gameName = l_name_0, 
            gameDescription = v81, 
            gamePrice = v82, 
            isPlayButtonEnabled = v109, 
            viewDetailsEnabled = v78[v47.GameDetail], 
            fetchGameData = v86, 
            gameThumbnail = v76, 
            gameRating = v94, 
            gamePlayerCount = v72.playing or 0, 
            votesStatus = v92
        });
        return v107(v111);
    end);
end;
return l_RoactServices_0.connect({
    game = l_AppGame_0, 
    sessionService = l_AppSessionService_0, 
    analytics = l_RoactAnalyticsCommonGameEvents_0
})(l_memo_0(GameCardContainer));