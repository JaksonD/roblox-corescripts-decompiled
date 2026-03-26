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
    requestFunction = function(v45, v46, v47) --[[ Line: 70 ]] --[[ Name: requestFunction ]]
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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v64 = {
    networkImpl = v48, 
    eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0), 
    eventIngest = l_EventIngest_0.new(l_EventIngestService_0), 
    placeId = nil, 
    universeId = nil, 
    conversationId = nil, 
    luaChatPlayTogetherEnabled = nil, 
    onDetailsOpened = function() --[[ Line: 118 ]] --[[ Name: onDetailsOpened ]]

    end, 
    onPlayButtonActivated = function(v54) --[[ Line: 120 ]] --[[ Name: onPlayButtonActivated ]]
        -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v28 (copy), v9 (copy), l_GameParams_0 (copy), v51 (copy), l_ExperienceService_0 (copy)
        local l_placeId_0 = v54.placeId;
        local l_senderUserId_0 = v54.senderUserId;
        l_SetGamePlaySession_0(v54.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromChat, true);
        v28(v54, "clickBtnFromLinkCardInChat", "touch");
        if l_placeId_0 then
            local function v58(v57) --[[ Line: 129 ]]
                -- upvalues: v54 (ref), v9 (ref), v28 (ref)
                v54 = v9.Dictionary.join(v54, {
                    joinAttemptId = v57
                });
                v28(v54, "gamePlayIntent", "PlayGameFromLinkCard");
            end;
            local v59 = l_GameParams_0.fromParams({
                userId = l_senderUserId_0, 
                placeId = l_placeId_0
            });
            if v51 then
                game:Shutdown();
            end;
            l_ExperienceService_0:LaunchExperience(v59, "PlayGameFromLinkCard", v58);
        end;
    end, 
    openDetails = function(v60) --[[ Line: 147 ]] --[[ Name: openDetails ]]
        -- upvalues: v28 (copy)
        local l_universeId_0 = v60.universeId;
        local l_placeId_1 = v60.placeId;
        v28(v60, "clickLinkCardInChat", "touch");
        v60.onDetailsOpened();
        v60.openGameDetailsPage(l_universeId_0, "LuaChatAssetCard");
        local v63 = v60.analytics and v60.analytics.reportOpenGameDetailFromChat;
        if v63 then
            v63(l_placeId_1, v60.conversationId, l_universeId_0, "GameDetailFromLinkCard");
        end;
    end
};
local function _(v65, v66) --[[ Line: 164 ]] --[[ Name: getGameIcon ]]
    -- upvalues: l_GameIconReducer_0 (copy)
    local v67 = v65[l_GameIconReducer_0.key][v66];
    if v67 then
        return v67.url;
    else
        return "";
    end;
end;
local function _(v69, v70) --[[ Line: 173 ]] --[[ Name: getGameDetails ]]
    return v69.GameDetails[v70] or {};
end;
local function _(v72, v73) --[[ Line: 177 ]] --[[ Name: getGamePlayabilityStatus ]]
    return v72.PlayabilityStatus[v73] or {};
end;
GameCardContainer = function(v75) --[[ Line: 181 ]] --[[ Name: GameCardContainer ]]
    -- upvalues: v9 (copy), v64 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v7 (copy), v6 (copy), v50 (copy), l_GameIconReducer_0 (copy), v17 (copy), v49 (copy), l_useDispatch_0 (copy), l_ApiFetchGameIcons_0 (copy), l_ApiFetchGameDetails_0 (copy), l_ApiFetchPlayabilityStatus_0 (copy), v34 (copy), v10 (copy), l_useMemo_0 (copy), l_useSignalState_0 (copy), v36 (copy), v37 (copy), l_useEffect_0 (copy), v38 (copy), v35 (copy), v8 (copy), v33 (copy), v43 (copy), v52 (copy), l_withLocalization_0 (copy)
    local v76 = v9.Dictionary.join(v64, v75);
    if not v76.universeId then
        assert("universeId does not exist", "universeId does not exist");
    end;
    local v79 = l_useSelector_0(l_useCallback_0(function(v77) --[[ Line: 187 ]]
        -- upvalues: v76 (copy)
        local l_universeId_1 = v76.universeId;
        return v77.GameDetails[l_universeId_1] or {};
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v76.universeId
    } else l_dependencyArray_0(v76.universeId)));
    local v82 = l_useSelector_0(l_useCallback_0(function(v80) --[[ Line: 191 ]]
        -- upvalues: v76 (copy)
        local l_universeId_2 = v76.universeId;
        return v80.PlayabilityStatus[l_universeId_2] or {};
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v76.universeId
    } else l_dependencyArray_0(v76.universeId)));
    local v83 = v7(v76.placeId, v6.GameCard.THUMBNAIL_WIDTH, v6.GameCard.THUMBNAIL_HEIGHT);
    local v87 = if v50() then ("rbxthumb://type=GameIcon&id=%*&w=%*&h=%*"):format(v76.universeId, 150, 150) else l_useSelector_0(l_useCallback_0(function(v84) --[[ Line: 205 ]]
        -- upvalues: v76 (copy), l_GameIconReducer_0 (ref)
        local l_universeId_3 = v76.universeId;
        local v86 = v84[l_GameIconReducer_0.key][l_universeId_3];
        if v86 then
            return v86.url;
        else
            return "";
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v76.universeId
    } else l_dependencyArray_0(v76.universeId)));
    local v88 = v17({
        v49.GameDetail
    });
    local v89 = v76.placeId or v79.rootPlaceId;
    local l_name_0 = v79.name;
    local v91 = v79.description or "";
    local v92 = v79.price or 0;
    local v93 = l_useDispatch_0();
    local function v96(v94, v95) --[[ Line: 224 ]]
        -- upvalues: v50 (ref), v93 (copy), l_ApiFetchGameIcons_0 (ref), l_ApiFetchGameDetails_0 (ref), l_ApiFetchPlayabilityStatus_0 (ref)
        if not v50() then
            v93(l_ApiFetchGameIcons_0(v94, {
                v95
            }));
        end;
        v93(l_ApiFetchGameDetails_0.Fetch(v94, {
            v95
        }));
        v93(l_ApiFetchPlayabilityStatus_0.Fetch(v94, {
            v95
        }));
    end;
    local v97 = v34.Game.getVotesStore(false);
    local v98 = v10.createSignal(nil);
    local v99 = v10.createSignal("NotReady");
    local v100 = l_useMemo_0(function() --[[ Line: 237 ]]
        -- upvalues: v76 (copy), v98 (copy), v99 (copy), v97 (copy)
        if not v76.universeId then
            return {
                data = v98, 
                status = v99
            };
        else
            return v97.getAndFetchVotes({
                v76.universeId
            })[v76.universeId] or {
                data = v98, 
                status = v99
            };
        end;
    end, {
        v97, 
        v76.universeId
    });
    local v101 = l_useSignalState_0(v100.data);
    local v102 = l_useSignalState_0(v100.status);
    local v104 = l_useMemo_0(function() --[[ Line: 257 ]]
        -- upvalues: v101 (copy)
        if v101 and v101.upVotes and v101.downVotes then
            local v103 = v101.upVotes + v101.downVotes;
            if v103 > 0 then
                return tostring((math.floor(v101.upVotes / v103 * 100))) .. "%";
            end;
        end;
        return "--";
    end, {
        v101
    });
    local v105 = v36(v37.Context);
    l_useEffect_0(function() --[[ Line: 269 ]]
        -- upvalues: v76 (copy), v96 (copy)
        local l_universeId_4 = v76.universeId;
        if not l_universeId_4 then
            return;
        else
            v96(v76.networkImpl, l_universeId_4);
            return;
        end;
    end, {
        v76.universeId, 
        v76.networkImpl
    });
    local v107 = l_useCallback_0(function() --[[ Line: 280 ]]
        -- upvalues: v105 (copy), v38 (ref), v76 (copy), v89 (copy)
        v105.emit(v38.GameCardThumbnailClicked, {
            universeId = v76.universeId, 
            placeId = v89
        });
        v76.openDetails(v76);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v105, 
        v76.openDetails, 
        v76.universeId, 
        v89
    } else l_dependencyArray_0(v105, v76.openDetails, v76.universeId, v89));
    local v108 = l_useCallback_0(function() --[[ Line: 293 ]]
        -- upvalues: v105 (copy), v38 (ref), v76 (copy), v89 (copy)
        v105.emit(v38.GameCardPlayButtonClicked, {
            universeId = v76.universeId, 
            placeId = v89
        });
        v76.onPlayButtonActivated(v76);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v105, 
        v76.onPlayButtonActivated, 
        v76.universeId, 
        v89
    } else l_dependencyArray_0(v105, v76.onPlayButtonActivated, v76.universeId, v89));
    local v109 = l_useCallback_0(function() --[[ Line: 306 ]]
        -- upvalues: v105 (copy), v38 (ref), v76 (copy), v89 (copy)
        v105.emit(v38.GameCardMetadataClicked, {
            universeId = v76.universeId, 
            placeId = v89
        });
        v76.openDetails(v76);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v105, 
        v76.openDetails, 
        v76.universeId, 
        v89
    } else l_dependencyArray_0(v105, v76.openDetails, v76.universeId, v89));
    local function v117(v110) --[[ Line: 318 ]] --[[ Name: renderCard ]]
        -- upvalues: v35 (ref), v107 (copy), v108 (copy), v109 (copy), v8 (ref), v33 (ref)
        local v111 = not v110.universeId or not v110.gameName or not v110.gameThumbnail or v110.votesStatus == "NotReady" or not v110.gamePlayerCount;
        local v112 = false;
        if v110.isPlayButtonEnabled and v110.playabilityStatus then
            v112 = v110.playabilityStatus.isPlayable == true;
        end;
        local v113 = if v110.isStartOfGroup then v35.Top else if v110.isIncoming then v35.TopRight else v35.TopLeft;
        local v114 = if v110.openDetails then v107 else nil;
        local v115 = if v110.onPlayButtonActivated then v108 else nil;
        local v116 = if v110.openDetails then v109 else nil;
        return v8.createElement(v33, {
            gameName = v110.gameName, 
            gameDescription = v110.gameDescription, 
            gameThumbnail = v110.gameThumbnail, 
            gameRating = v110.gameRating, 
            gamePlayerCount = v110.gamePlayerCount, 
            thumbnailAspectRatio = 1.7777777777777777, 
            thumbnailRoundedVariant = v113, 
            shouldShowPlayButton = v112, 
            onPlayButtonActivated = v115, 
            onThumbnailActivated = v114, 
            onMetadataActivated = v116, 
            isRepliedTo = v110.isRepliedTo, 
            isIncoming = v110.isIncoming, 
            isPending = v110.isPending, 
            isLoading = v111, 
            LayoutOrder = v110.layoutOrder
        });
    end;
    local v118 = v43();
    local v119 = not v52() or not v118 or false;
    return l_withLocalization_0({
        purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame", 
        viewDetailsText = "Feature.Chat.Action.ViewAssetDetails", 
        playText = "Common.VisitGame.Label.Play", 
        noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
    })(function(_) --[[ Line: 369 ]]
        -- upvalues: v9 (ref), v76 (copy), v79 (copy), v82 (copy), v87 (copy), v89 (copy), l_name_0 (copy), v91 (copy), v92 (copy), v119 (copy), v88 (copy), v49 (ref), v96 (copy), v83 (copy), v104 (copy), v102 (copy), v117 (copy)
        local v121 = v9.Dictionary.join(v76, {
            details = v79, 
            playabilityStatus = v82, 
            gameIcon = v87, 
            placeId = v89, 
            gameName = l_name_0, 
            gameDescription = v91, 
            gamePrice = v92, 
            isPlayButtonEnabled = v119, 
            viewDetailsEnabled = v88[v49.GameDetail], 
            fetchGameData = v96, 
            gameThumbnail = v83, 
            gameRating = v104, 
            gamePlayerCount = v79.playing or 0, 
            votesStatus = v102
        });
        return v117(v121);
    end);
end;
return l_RoactServices_0.connect({
    game = l_AppGame_0, 
    sessionService = l_AppSessionService_0, 
    analytics = l_RoactAnalyticsCommonGameEvents_0
})(l_memo_0(GameCardContainer));