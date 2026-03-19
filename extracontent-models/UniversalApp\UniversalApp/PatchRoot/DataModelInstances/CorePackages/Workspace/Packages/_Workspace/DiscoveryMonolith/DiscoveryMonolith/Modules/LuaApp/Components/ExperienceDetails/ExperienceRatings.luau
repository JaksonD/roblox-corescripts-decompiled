local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.t);
local v7 = require(l_Parent_0.UIBlox);
local l_VoteStates_0 = v7.App.Indicator.Enum.VoteStates;
local l_RateCount_0 = v7.App.Indicator.RateCount;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_abbreviateCount_0 = require(l_Parent_0.Localization).abbreviateCount;
local v18 = require(l_Parent_0.GameVotesRodux);
local l_FetchGameVotes_0 = v18.GameVotes.FetchGameVotes;
local l_FetchUserGameVotes_0 = v18.UserGameVotes.FetchUserGameVotes;
local l_PatchUserVotes_0 = v18.UserGameVotes.PatchUserVotes;
local l_ReasonForNotVoteable_0 = v18.Enums.ReasonForNotVoteable;
local l_VoteStatus_0 = v18.Enums.VoteStatus;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_ToastType_0 = require(l_Parent_0.ToastRodux).Enums.ToastType;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v28 = require(l_Parent_0.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_GamePlayerFeedbackPrompt_0 = require(l_Parent_0.PlayerFeedback).GamePlayerFeedbackPrompt;
local l_GetGamePlayerFeedbackMetadata_0 = require(l_Parent_0.PlayerFeedback).Thunks.GetGamePlayerFeedbackMetadata;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local l_Vote_0 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents).Vote;
local l_GetFFlagEdpPlayerFeedbackEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled;
local l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 = require(l_Parent_0.SharedFlags).GetFFlagEdpPlayerFeedbackLogIXPExposure;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppGameStatsFallbackRendering_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameStatsFallbackRendering;
local v42 = v4.PureComponent:extend("ExperienceRatings");
v42.validateProps = v6.interface({
    universeId = v6.string, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v6.optional(v6.boolean) else nil, 
    height = v6.optional(v6.number), 
    styleProps = v6.optional(v6.table)
});
local v43 = {
    [l_VoteStatus_0.NotVoted] = l_VoteStates_0.notVoted, 
    [l_VoteStatus_0.VotedDown] = l_VoteStates_0.votedDown, 
    [l_VoteStatus_0.VotedUp] = l_VoteStates_0.votedUp
};
v42.init = function(v44) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), l_Logging_0 (copy), l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_VoteStatus_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_memoize_0 (copy), l_abbreviateCount_0 (copy), l_ReasonForNotVoteable_0 (copy), l_RetrievalStatus_0 (copy), l_Vote_0 (copy), l_ToastType_0 (copy)
    v44.isMounted = false;
    if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
        v44.state = {
            isFeedbackPromptOpen = false, 
            playerFeedbackMetadata = nil
        };
        v44.openInlineFeedbackPrompt = function() --[[ Line: 71 ]]
            -- upvalues: v44 (copy)
            v44:setState({
                isFeedbackPromptOpen = true
            });
        end;
        v44.closeInlineFeedbackPrompt = function() --[[ Line: 76 ]]
            -- upvalues: v44 (copy)
            v44:setState({
                isFeedbackPromptOpen = false
            });
        end;
        v44.onClickFeedbackPromptButton = function() --[[ Line: 81 ]]
            -- upvalues: v44 (copy), l_Logging_0 (ref)
            if not v44.state.playerFeedbackMetadata then
                l_Logging_0.warn("Player feedback metadata is not available from feedback prompt");
                return;
            else
                v44.props.openFeedbackForm(v44.props.universeId, v44.state.playerFeedbackMetadata, v44.closeInlineFeedbackPrompt);
                return;
            end;
        end;
        v44.onVoteSuccess = function(v45) --[[ Line: 92 ]]
            -- upvalues: l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v44 (copy), l_VoteStatus_0 (ref), l_Logging_0 (ref)
            if l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0() then
                l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer);
            end;
            if not v44.props.enablePlayerFeedback then
                return;
            else
                local l_universeId_0 = v44.props.universeId;
                local l_networking_0 = v44.props.networking;
                local l_rootPlaceId_0 = v44.props.rootPlaceId;
                if v45 == l_VoteStatus_0.NotVoted then
                    v44.closeInlineFeedbackPrompt();
                    return;
                else
                    v44.props.getGamePlayerFeedbackMetadata(l_networking_0, l_universeId_0, v45, l_rootPlaceId_0):andThen(function(v49) --[[ Line: 112 ]]
                        -- upvalues: v44 (ref), l_universeId_0 (copy)
                        if v49 and v49.canSubmitReview then
                            if v44.props.showInlineFeedbackPrompt then
                                v44:setState({
                                    playerFeedbackMetadata = v49
                                });
                                v44.openInlineFeedbackPrompt();
                                return;
                            else
                                v44.props.openFeedbackForm(l_universeId_0, v49);
                            end;
                        end;
                    end, function() --[[ Line: 123 ]]
                        -- upvalues: l_Logging_0 (ref)
                        l_Logging_0.warn("Failed to get player feedback metadata");
                    end);
                    return;
                end;
            end;
        end;
    end;
    local v50 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v44.getVoteTexts = l_memoize_0(function(v51, v52, v53, v54) --[[ Line: 132 ]]
        -- upvalues: l_abbreviateCount_0 (ref), v50 (copy)
        local v55 = nil;
        if v51 and v52 then
            v55 = v51 + v52;
        end;
        local v56 = v55 and l_abbreviateCount_0(v55, v50:GetLocale()) or "--";
        v56 = if v53 and v54 then string.upper(v50:Format("Feature.GameDetails.Label.Votes", {
            votes = v56
        })) else string.upper(v50:Format("Feature.GameDetails.Label.Upvoted"));
        return {
            votePercentageText = v55 and v55 > 0 and tostring((math.floor(v51 / v55 * 100))) .. "%" or "--", 
            totalVotesText = v56
        };
    end);
    local v57 = {
        [l_ReasonForNotVoteable_0.PlayGame] = "Feature.Toast.VoteError.PlayGame", 
        [l_ReasonForNotVoteable_0.FloodCheckThresholdMet] = "Feature.Toast.VoteError.FloodCheckThresholdMet", 
        [l_ReasonForNotVoteable_0.AssetNotVoteable] = "Feature.Toast.VoteError.AssetNotVoteable", 
        Default = "Feature.Toast.VoteError.Default"
    };
    v44.onVoteButtonActivated = function(v58) --[[ Line: 164 ]]
        -- upvalues: v44 (copy), l_RetrievalStatus_0 (ref), l_GetFFlagEdpPlayerFeedbackEnabled_0 (ref), l_VoteStatus_0 (ref), l_Vote_0 (ref), v57 (copy), l_ToastType_0 (ref)
        local l_universeId_1 = v44.props.universeId;
        local l_networking_1 = v44.props.networking;
        local l_rootPlaceId_1 = v44.props.rootPlaceId;
        if v44.props.voteDataIsLoading then
            return;
        elseif not v44.isMounted or not l_rootPlaceId_1 then
            return;
        elseif not v44.props.voteDataLoadSucceed then
            if v44.props.gameVotesFetchingStatus == l_RetrievalStatus_0.Failed then
                v44.props.dispatchFetchGameVotes(l_networking_1, l_universeId_1);
            else
                local l_eventIngest_0 = v44.props.eventIngest;
                if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
                    v44.props.patchUserVotes(l_networking_1, l_universeId_1, v58, l_VoteStatus_0.NotVoted):andThen(function(v63) --[[ Line: 188 ]]
                        -- upvalues: v44 (ref), v58 (ref)
                        if v63 ~= nil then
                            v44.onVoteSuccess(v58);
                        end;
                    end);
                else
                    v44.props.patchUserVotes(l_networking_1, l_universeId_1, v58, l_VoteStatus_0.NotVoted);
                end;
                l_Vote_0(l_eventIngest_0, "GameRatings", l_rootPlaceId_1, v58, l_VoteStatus_0.NotVoted);
            end;
            return;
        else
            local l_userGameVotes_0 = v44.props.userGameVotes;
            local l_reasonForNotVoteable_0 = l_userGameVotes_0.reasonForNotVoteable;
            if l_userGameVotes_0.canVote then
                local l_eventIngest_1 = v44.props.eventIngest;
                local l_userVote_0 = l_userGameVotes_0.userVote;
                if l_userVote_0 == v58 then
                    v58 = l_VoteStatus_0.NotVoted;
                end;
                if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
                    v44.props.patchUserVotes(l_networking_1, l_universeId_1, v58, l_userVote_0):andThen(function(v68) --[[ Line: 215 ]]
                        -- upvalues: v44 (ref), v58 (ref)
                        if v68 ~= nil then
                            v44.onVoteSuccess(v58);
                        end;
                    end);
                else
                    v44.props.patchUserVotes(l_networking_1, l_universeId_1, v58, l_userVote_0);
                end;
                l_Vote_0(l_eventIngest_1, "GameRatings", l_rootPlaceId_1, v58, l_userVote_0);
            else
                local v69 = v57[l_reasonForNotVoteable_0] or v57.Default;
                v44.props.setCurrentToastMessage({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = v69
                });
            end;
            return;
        end;
    end;
    v44.onVoteUpActivated = function() --[[ Line: 234 ]]
        -- upvalues: v44 (copy), l_VoteStatus_0 (ref)
        v44.onVoteButtonActivated(l_VoteStatus_0.VotedUp);
    end;
    v44.onVoteDownActivated = function() --[[ Line: 238 ]]
        -- upvalues: v44 (copy), l_VoteStatus_0 (ref)
        v44.onVoteButtonActivated(l_VoteStatus_0.VotedDown);
    end;
end;
v42.render = function(v70) --[[ Line: 243 ]] --[[ Name: render ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_VoteStatus_0 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), v4 (copy), l_RateCount_0 (copy), v43 (copy), l_withStyle_0 (copy), l_GamePlayerFeedbackPrompt_0 (copy)
    local l_gameVotes_0 = v70.props.gameVotes;
    local l_userGameVotes_1 = v70.props.userGameVotes;
    local l_gameVotesFetchingStatus_0 = v70.props.gameVotesFetchingStatus;
    local l_voteDataLoadSucceed_0 = v70.props.voteDataLoadSucceed;
    local v75 = l_gameVotes_0 and l_gameVotes_0.upVotes;
    local v76 = l_gameVotes_0 and l_gameVotes_0.downVotes;
    if l_gameVotesFetchingStatus_0 == l_RetrievalStatus_0.Done then
        v75 = v75 or 0;
        v76 = v76 or 0;
    end;
    local v77 = l_voteDataLoadSucceed_0 and l_userGameVotes_1 and l_userGameVotes_1.userVote or l_VoteStatus_0.NotVoted;
    local l_showGlobalCounters_0 = v70.props.showGlobalCounters;
    local l_showLikesFavoritesCount_0 = v70.props.showLikesFavoritesCount;
    local v80 = v70.getVoteTexts(v75, v76, l_showGlobalCounters_0, l_showLikesFavoritesCount_0);
    if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
        return v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 10)
            }), 
            RateCount = v4.createElement(l_RateCount_0, {
                height = v70.props.height, 
                rateText = v80.votePercentageText, 
                rateLabel = v80.totalVotesText, 
                voteState = v43[v77], 
                onVoteDownActivated = v70.onVoteDownActivated, 
                onVoteUpActivated = v70.onVoteUpActivated, 
                styleProps = v70.props.styleProps
            }), 
            PlayerFeedbackPrompt = v70.state.isFeedbackPromptOpen and l_withStyle_0(function(v81) --[[ Line: 282 ]]
                -- upvalues: v4 (ref), l_GamePlayerFeedbackPrompt_0 (ref), v70 (copy)
                return v4.createElement(l_GamePlayerFeedbackPrompt_0, {
                    placeId = v70.props.rootPlaceId, 
                    backgroundTransparency = v81.Tokens.Semantic.Color.Background.Contrast.Transparency, 
                    backgroundColor3 = v81.Tokens.Semantic.Color.Background.Contrast.Color3, 
                    onDimiss = v70.closeInlineFeedbackPrompt, 
                    onButtonClick = v70.onClickFeedbackPromptButton
                }) or nil;
            end)
        });
    else
        return v4.createElement(l_RateCount_0, {
            rateText = v80.votePercentageText, 
            rateLabel = v80.totalVotesText, 
            voteState = v43[v77], 
            onVoteDownActivated = v70.onVoteDownActivated, 
            onVoteUpActivated = v70.onVoteUpActivated
        });
    end;
end;
v42.didMount = function(v82) --[[ Line: 303 ]] --[[ Name: didMount ]]
    v82.isMounted = true;
end;
v42.willUnmount = function(v83) --[[ Line: 307 ]] --[[ Name: willUnmount ]]
    v83.isMounted = false;
end;
local function _(v84, v85) --[[ Line: 311 ]] --[[ Name: getGameVotesWithFallback ]]
    -- upvalues: l_FFlagLuaAppGameStatsFallbackRendering_0 (copy), l_GameInfosReducer_0 (copy)
    local v86 = v84.GameVotes[v85];
    if v86 then
        return v86;
    else
        if l_FFlagLuaAppGameStatsFallbackRendering_0 then
            local v87 = v84.Personalization[l_GameInfosReducer_0.key][v85];
            if v87 then
                return {
                    upVotes = v87.totalUpVotes or 0, 
                    downVotes = v87.totalDownVotes or 0
                };
            end;
        end;
        return nil;
    end;
end;
v42 = v5.connect(function(v89, v90) --[[ Line: 331 ]]
    -- upvalues: l_FetchGameVotes_0 (copy), l_FetchUserGameVotes_0 (copy), l_PatchUserVotes_0 (copy), l_FFlagLuaAppGameStatsFallbackRendering_0 (copy), l_GameInfosReducer_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_RetrievalStatus_0 (copy)
    local v91 = false;
    local l_universeId_2 = v90.universeId;
    local v93 = l_FetchGameVotes_0.GetFetchingStatus(v89, l_universeId_2);
    local v94 = l_FetchUserGameVotes_0.GetFetchingStatus(v89, l_universeId_2);
    local v95 = l_PatchUserVotes_0.GetPatchingStatus(v89, l_universeId_2);
    local v96 = v89.GameVotes[l_universeId_2];
    local v97;
    if v96 then
        v97 = v96;
    else
        if l_FFlagLuaAppGameStatsFallbackRendering_0 then
            local v98 = v89.Personalization[l_GameInfosReducer_0.key][l_universeId_2];
            if v98 then
                v97 = {
                    upVotes = v98.totalUpVotes or 0, 
                    downVotes = v98.totalDownVotes or 0
                };
                v91 = true;
            end;
        end;
        if not v91 then
            v97 = nil;
        end;
    end;
    v91 = false;
    v96 = v89.UserGameVotes[v90.universeId];
    local v99 = nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v90.shouldHydrateLegacyIxp then
        if v89.GameDetailsV2 and v89.GameDetailsV2[v90.universeId] then
            v99 = v89.GameDetailsV2 and v89.GameDetailsV2[v90.universeId].rootPlaceId;
        else
            local v100 = v89.Personalization[l_GameInfosReducer_0.key][v90.universeId];
            if v100 then
                v99 = v100.placeId;
            end;
        end;
    elseif v89.GameDetails and v89.GameDetails[v90.universeId] then
        v99 = v89.GameDetails and v89.GameDetails[v90.universeId].rootPlaceId;
    else
        local v101 = v89.Personalization[l_GameInfosReducer_0.key][v90.universeId];
        if v101 then
            v99 = v101.placeId;
        end;
    end;
    local v102 = {
        gameVotesFetchingStatus = v93
    };
    local v103 = true;
    if v93 ~= l_RetrievalStatus_0.Fetching then
        v103 = true;
        if v94 ~= l_RetrievalStatus_0.Fetching then
            v103 = v95 == l_RetrievalStatus_0.Fetching;
        end;
    end;
    v102.voteDataIsLoading = v103;
    v102.voteDataLoadSucceed = v97 and v96;
    v102.gameVotes = v97;
    v102.userGameVotes = v96;
    v102.rootPlaceId = v99;
    return v102;
end, function(v104) --[[ Line: 375 ]]
    -- upvalues: l_FetchGameVotes_0 (copy), l_PatchUserVotes_0 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_GetGamePlayerFeedbackMetadata_0 (copy), l_SetCurrentToastMessage_0 (copy)
    return {
        dispatchFetchGameVotes = function(v105, v106) --[[ Line: 377 ]] --[[ Name: dispatchFetchGameVotes ]]
            -- upvalues: v104 (copy), l_FetchGameVotes_0 (ref)
            return v104(l_FetchGameVotes_0.Fetch(v105, v106));
        end, 
        patchUserVotes = function(v107, v108, v109, v110) --[[ Line: 380 ]] --[[ Name: patchUserVotes ]]
            -- upvalues: v104 (copy), l_PatchUserVotes_0 (ref)
            return v104(l_PatchUserVotes_0.Patch(v107, v108, v109, v110));
        end, 
        openFeedbackForm = l_GetFFlagEdpPlayerFeedbackEnabled_0() and function(v111, v112, v113) --[[ Line: 384 ]]
            -- upvalues: v104 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
            return v104(l_SetCentralOverlay_0(l_CentralOverlayType_0.GamePlayerFeedbackForm, {
                universeId = v111, 
                playerFeedbackMetadata = v112, 
                onSubmitted = v113
            }));
        end or nil, 
        getGamePlayerFeedbackMetadata = l_GetFFlagEdpPlayerFeedbackEnabled_0() and function(v114, v115, v116, v117) --[[ Line: 393 ]]
            -- upvalues: v104 (copy), l_GetGamePlayerFeedbackMetadata_0 (ref)
            return v104(l_GetGamePlayerFeedbackMetadata_0.Get(v114, v115, v117, v116));
        end or nil, 
        setCurrentToastMessage = function(v118) --[[ Line: 397 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v104 (copy), l_SetCurrentToastMessage_0 (ref)
            return v104(l_SetCurrentToastMessage_0(v118));
        end
    };
end)(v42);
if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
    v42 = v28.connectUserLayer({
        l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer
    }, function(v119, _) --[[ Line: 406 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        local v121 = v119[l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer] or {};
        return {
            enablePlayerFeedback = v121.ShowFeedbackForm, 
            showInlineFeedbackPrompt = v121.ShowInlinePrompt
        };
    end, false)(v42);
end;
v42 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0
})(v42);
return (l_RoactAppPolicy_0.connect(function(v122) --[[ Line: 420 ]]
    return {
        showGlobalCounters = v122.getShowGlobalCounters(), 
        showLikesFavoritesCount = v122.getEnableAggregateLikesFavoritesCount()
    };
end)(v42));