local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local v7 = require(l_CorePackages_0.Workspace.Packages.GameVotesRodux);
local l_ReasonForNotVoteable_0 = v7.Enums.ReasonForNotVoteable;
local l_VoteStatus_0 = v7.Enums.VoteStatus;
local l_FetchGameVotes_0 = v7.GameVotes.FetchGameVotes;
local l_FetchUserGameVotes_0 = v7.UserGameVotes.FetchUserGameVotes;
local l_PatchUserVotes_0 = v7.UserGameVotes.PatchUserVotes;
local l_ToastType_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Enums.ToastType;
local l_SetCurrentToastMessage_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_Vote_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.Vote;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v19 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v21 = require(l_Modules_0.LuaApp.Components.GenericIconButton);
local v22 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v23 = require(l_Modules_0.LuaApp.Components.PrimaryStatWidget);
local v24 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local l_GetFFlagEdpPlayerFeedbackEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v28 = Rect.new(9, 9, 9, 9);
local v29 = v1.PureComponent:extend("GameRatings");
v29.init = function(v30) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), l_VoteStatus_0 (copy), l_Vote_0 (copy), l_ReasonForNotVoteable_0 (copy), l_ToastType_0 (copy)
    v30.isMounted = false;
    v30.onVoteButtonActivated = function(v31) --[[ Line: 59 ]]
        -- upvalues: v30 (copy), l_RetrievalStatus_0 (ref), l_GetFFlagEdpPlayerFeedbackEnabled_0 (ref), l_VoteStatus_0 (ref), l_Vote_0 (ref), l_ReasonForNotVoteable_0 (ref), l_ToastType_0 (ref)
        local l_universeId_0 = v30.props.universeId;
        local l_networking_0 = v30.props.networking;
        local l_rootPlaceId_0 = v30.props.rootPlaceId;
        if not v30.isMounted or not l_rootPlaceId_0 then
            return;
        elseif not v30.props.dataLoadSucceed then
            if v30.props.gameVotesFetchingStatus == l_RetrievalStatus_0.Failed then
                v30.props.dispatchFetchGameVotes(l_networking_0, l_universeId_0);
            else
                local l_eventIngest_0 = v30.props.eventIngest;
                if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
                    v30.props.patchUserVotes(l_networking_0, l_universeId_0, v31, l_VoteStatus_0.NotVoted):andThen(function(v36) --[[ Line: 78 ]]
                        -- upvalues: v30 (ref), v31 (ref)
                        if v36 ~= nil then
                            v30.props.onVoteSuccess(v31);
                        end;
                    end);
                else
                    v30.props.patchUserVotes(l_networking_0, l_universeId_0, v31, l_VoteStatus_0.NotVoted);
                end;
                l_Vote_0(l_eventIngest_0, "GameRatings", l_rootPlaceId_0, v31, l_VoteStatus_0.NotVoted);
            end;
            return;
        else
            local l_userGameVotes_0 = v30.props.userGameVotes;
            local l_reasonForNotVoteable_0 = l_userGameVotes_0.reasonForNotVoteable;
            if l_userGameVotes_0.canVote then
                local l_eventIngest_1 = v30.props.eventIngest;
                local l_userVote_0 = l_userGameVotes_0.userVote;
                if l_userVote_0 == v31 then
                    v31 = l_VoteStatus_0.NotVoted;
                end;
                if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
                    v30.props.patchUserVotes(l_networking_0, l_universeId_0, v31, l_userVote_0):andThen(function(v41) --[[ Line: 104 ]]
                        -- upvalues: v30 (ref), v31 (ref)
                        if v41 ~= nil then
                            v30.props.onVoteSuccess(v31);
                        end;
                    end);
                else
                    v30.props.patchUserVotes(l_networking_0, l_universeId_0, v31, l_userVote_0);
                end;
                l_Vote_0(l_eventIngest_1, "GameRatings", l_rootPlaceId_0, v31, l_userVote_0);
            elseif l_reasonForNotVoteable_0 == l_ReasonForNotVoteable_0.PlayGame then
                v30.props.setCurrentToastMessage({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = "Feature.Toast.VoteError.PlayGame"
                });
            elseif l_reasonForNotVoteable_0 == l_ReasonForNotVoteable_0.FloodCheckThresholdMet then
                v30.props.setCurrentToastMessage({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet"
                });
            elseif l_reasonForNotVoteable_0 == l_ReasonForNotVoteable_0.AssetNotVoteable then
                v30.props.setCurrentToastMessage({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = "Feature.Toast.VoteError.AssetNotVoteable"
                });
            else
                v30.props.setCurrentToastMessage({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = "Feature.Toast.VoteError.Default"
                });
            end;
            return;
        end;
    end;
    v30.onVoteUpActivated = function() --[[ Line: 136 ]]
        -- upvalues: v30 (copy), l_VoteStatus_0 (ref)
        v30.onVoteButtonActivated(l_VoteStatus_0.VotedUp);
    end;
    v30.onVoteDownActivated = function() --[[ Line: 140 ]]
        -- upvalues: v30 (copy), l_VoteStatus_0 (ref)
        v30.onVoteButtonActivated(l_VoteStatus_0.VotedDown);
    end;
end;
v29.render = function(v42) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_abbreviateCount_0 (copy), l_withStyle_0 (copy), v1 (copy), v22 (copy), v28 (copy), v23 (copy), v21 (copy), l_VoteStatus_0 (copy)
    local l_Position_0 = v42.props.Position;
    local l_LayoutOrder_0 = v42.props.LayoutOrder;
    local l_width_0 = v42.props.width;
    local l_gameVotes_0 = v42.props.gameVotes;
    local l_userGameVotes_1 = v42.props.userGameVotes;
    local l_gameVotesFetchingStatus_0 = v42.props.gameVotesFetchingStatus;
    local l_isLoading_0 = v42.props.isLoading;
    local l_dataLoadSucceed_0 = v42.props.dataLoadSucceed;
    local l_showGlobalCounters_0 = v42.props.showGlobalCounters;
    local l_showLikesFavoritesCount_0 = v42.props.showLikesFavoritesCount;
    local l_localization_0 = v42.props.localization;
    local v54 = l_gameVotes_0 and l_gameVotes_0.upVotes or 0;
    local v55 = v54 + (l_gameVotes_0 and l_gameVotes_0.downVotes or 0);
    local v56 = l_gameVotesFetchingStatus_0 == l_RetrievalStatus_0.Done and l_abbreviateCount_0(v55, l_localization_0:GetLocale()) or "--";
    v56 = if l_showGlobalCounters_0 and l_showLikesFavoritesCount_0 then string.upper(l_localization_0:Format("Feature.GameDetails.Label.Votes", {
        votes = v56
    })) else string.upper(l_localization_0:Format("Feature.GameDetails.Label.Upvoted"));
    local v57 = v55 > 0 and tostring((math.floor(v54 / v55 * 100))) .. "%" or "--";
    local v58 = l_dataLoadSucceed_0 and l_userGameVotes_1 and l_userGameVotes_1.userVote;
    return l_withStyle_0(function(v59) --[[ Line: 178 ]]
        -- upvalues: v1 (ref), v22 (ref), l_width_0 (copy), l_Position_0 (copy), l_LayoutOrder_0 (copy), v28 (ref), v23 (ref), v57 (copy), v56 (ref), v21 (ref), v58 (copy), l_VoteStatus_0 (ref), l_isLoading_0 (copy), v42 (copy)
        return v1.createElement(v22, {
            Size = UDim2.new(0, l_width_0, 0, 70), 
            Position = l_Position_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = "LuaApp/buttons/buttonFill", 
            ImageColor3 = v59.Theme.UIEmphasis.Color, 
            ImageTransparency = v59.Theme.UIEmphasis.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v28
        }, {
            RatingsStat = v1.createElement(v23, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                icon = "LuaApp/icons/GameDetails/rating_large", 
                number = v57, 
                label = v56, 
                width = l_width_0 - 88 - 30
            }), 
            VoteUp = v1.createElement(v21, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, -10, 0.5, 0), 
                Size = UDim2.new(0, 44, 0, 44), 
                iconImage = v58 == l_VoteStatus_0.VotedUp and "LuaApp/icons/GameDetails/voteUpOn" or "LuaApp/icons/GameDetails/voteUpOff", 
                iconSize = UDim2.new(0, 36, 0, 36), 
                isChecked = v58 == l_VoteStatus_0.VotedUp, 
                isLoading = l_isLoading_0, 
                onActivated = v42.onVoteUpActivated, 
                withNewThemeProvider = true
            }), 
            VoteDown = v1.createElement(v21, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, -64, 0.5, 0), 
                Size = UDim2.new(0, 44, 0, 44), 
                iconImage = v58 == l_VoteStatus_0.VotedDown and "LuaApp/icons/GameDetails/voteDownOn" or "LuaApp/icons/GameDetails/voteDownOff", 
                iconSize = UDim2.new(0, 36, 0, 36), 
                isChecked = v58 == l_VoteStatus_0.VotedDown, 
                isLoading = l_isLoading_0, 
                onActivated = v42.onVoteDownActivated, 
                withNewThemeProvider = true
            })
        });
    end);
end;
v29.didMount = function(v60) --[[ Line: 225 ]] --[[ Name: didMount ]]
    v60.isMounted = true;
end;
v29.willUnmount = function(v61) --[[ Line: 229 ]] --[[ Name: willUnmount ]]
    v61.isMounted = false;
end;
v29 = v2.connect(function(v62, v63) --[[ Line: 233 ]]
    -- upvalues: l_PatchUserVotes_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v24 (copy), l_FetchGameVotes_0 (copy), l_FetchUserGameVotes_0 (copy), l_GameInfosReducer_0 (copy), l_RetrievalStatus_0 (copy)
    local v64 = l_PatchUserVotes_0.GetPatchingStatus(v62, v63.universeId);
    local v65 = nil;
    local v66 = nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v63.shouldHydrateLegacyIxp then
        v65 = v24.GetFetchingStatus(v62, v63.universeId);
        v66 = v24.GetFetchingStatus(v62, v63.universeId);
    else
        v65 = l_FetchGameVotes_0.GetFetchingStatus(v62, v63.universeId);
        v66 = l_FetchUserGameVotes_0.GetFetchingStatus(v62, v63.universeId);
    end;
    local v67 = v62.GameVotes[v63.universeId];
    local v68 = v62.UserGameVotes[v63.universeId];
    local v69 = nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v63.shouldHydrateLegacyIxp then
        if v62.GameDetailsV2 and v62.GameDetailsV2[v63.universeId] then
            v69 = v62.GameDetailsV2 and v62.GameDetailsV2[v63.universeId].rootPlaceId;
        else
            local v70 = v62.Personalization[l_GameInfosReducer_0.key][v63.universeId];
            if v70 then
                v69 = v70.placeId;
            end;
        end;
    elseif v62.GameDetails and v62.GameDetails[v63.universeId] then
        v69 = v62.GameDetails and v62.GameDetails[v63.universeId].rootPlaceId;
    else
        local v71 = v62.Personalization[l_GameInfosReducer_0.key][v63.universeId];
        if v71 then
            v69 = v71.placeId;
        end;
    end;
    local v72 = {
        gameVotes = v67, 
        userGameVotes = v68, 
        rootPlaceId = v69, 
        gameVotesFetchingStatus = v65
    };
    local v73 = true;
    if v65 ~= l_RetrievalStatus_0.Fetching then
        v73 = true;
        if v66 ~= l_RetrievalStatus_0.Fetching then
            v73 = v64 == l_RetrievalStatus_0.Fetching;
        end;
    end;
    v72.isLoading = v73;
    v72.dataLoadSucceed = v67 and v68;
    return v72;
end, function(v74) --[[ Line: 286 ]]
    -- upvalues: l_SetCurrentToastMessage_0 (copy), l_FetchGameVotes_0 (copy), l_PatchUserVotes_0 (copy)
    return {
        setCurrentToastMessage = function(v75) --[[ Line: 288 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v74 (copy), l_SetCurrentToastMessage_0 (ref)
            return v74(l_SetCurrentToastMessage_0(v75));
        end, 
        dispatchFetchGameVotes = function(v76, v77) --[[ Line: 291 ]] --[[ Name: dispatchFetchGameVotes ]]
            -- upvalues: v74 (copy), l_FetchGameVotes_0 (ref)
            return v74(l_FetchGameVotes_0.Fetch(v76, v77));
        end, 
        patchUserVotes = function(v78, v79, v80, v81) --[[ Line: 294 ]] --[[ Name: patchUserVotes ]]
            -- upvalues: v74 (copy), l_PatchUserVotes_0 (ref)
            return v74(l_PatchUserVotes_0.Patch(v78, v79, v80, v81));
        end
    };
end)(v29);
return l_RoactServices_0.connect({
    localization = v19, 
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0
})(v29);