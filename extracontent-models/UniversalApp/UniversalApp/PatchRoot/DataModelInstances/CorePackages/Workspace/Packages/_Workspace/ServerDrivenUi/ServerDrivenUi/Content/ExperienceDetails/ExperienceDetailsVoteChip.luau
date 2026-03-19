local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.RoactUtils);
local l_Game_0 = require(l_Parent_0.DataHydration).Game;
local l_VotesUtils_0 = l_Game_0.VotesUtils;
local v9 = require(l_Parent_0.SduiSharedContent);
local v10 = require(l_Parent_0.ToastRodux);
local v11 = require(l_Parent_0.DiscoveryAnalytics);
local v12 = require(l_Parent_0.UniversalAppPolicy);
local v13 = require(l_Parent_0.SharedFlags);
local l_IconVariant_0 = v4.Enums.IconVariant;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_SduiDualActionChip_0 = v9.SduiDualActionChip;
local l_ToastType_0 = v10.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v10.Actions.SetCurrentToastMessage;
local l_useAppPolicy_0 = v12.useAppPolicy;
local l_gameVote_0 = v11.Events.gameVote;
local v21 = require(script.Parent.Hooks.useOptimisticUpdateStatus);
local l_GetFFlagEdpPlayerFeedbackEnabled_0 = v13.GetFFlagEdpPlayerFeedbackEnabled;
local l_FFlagSduiServerCompat_0 = v13.FFlagSduiServerCompat;
local function _(v24) --[[ Line: 40 ]] --[[ Name: convertBooleanToVoteForAnalytics ]]
    if v24 == true then
        return "UpVoted";
    elseif v24 == false then
        return "DownVoted";
    else
        return "NotVoted";
    end;
end;
return v3.memo(function(v26) --[[ Line: 50 ]] --[[ Name: ExperienceDetailsVoteChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useDispatch_0 (copy), v5 (copy), l_Game_0 (copy), v3 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), v21 (copy), l_Players_0 (copy), l_gameVote_0 (copy), l_VotesUtils_0 (copy), l_IconVariant_0 (copy), l_useAppPolicy_0 (copy), l_SduiDualActionChip_0 (copy), v4 (copy)
    local v27 = nil;
    v27 = if l_FFlagSduiServerCompat_0 then v26.layoutOrder else v26.LayoutOrder;
    local l_universeId_0 = v26.universeId;
    local v29 = l_useDispatch_0();
    local v30 = v5.useSignalState(l_Game_0.getVotesStore(false).getAndFetchVote(l_universeId_0).data);
    local v31 = v5.useSignalState(l_Game_0.getVotesStore(false).getAndFetchUserVote(l_universeId_0).data);
    local v32 = l_Game_0.getGameInfoStore(false);
    local v33 = v5.useSignalState(v32.getAndFetchGameInfo(l_universeId_0).data);
    local v34 = v33 and v33.rootPlaceId;
    local v36 = v3.useCallback(function(v35) --[[ Line: 71 ]]
        -- upvalues: l_Game_0 (ref), l_universeId_0 (copy)
        return l_Game_0.getVotesStore(false).updateUserVote(l_universeId_0, v35);
    end, {
        l_universeId_0
    });
    local v41 = v3.useCallback(function(v37) --[[ Line: 76 ]]
        -- upvalues: v29 (copy), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), l_GetFFlagEdpPlayerFeedbackEnabled_0 (ref), v34 (copy), l_Game_0 (ref)
        if v37 == nil then
            return;
        elseif v37.type == "error" then
            local v38 = "Feature.Toast.VoteError.Default";
            local l_reasonForNotVoteable_0 = v37.reasonForNotVoteable;
            if l_reasonForNotVoteable_0 == "PlayGame" then
                v38 = "Feature.Toast.VoteError.PlayGame";
            elseif l_reasonForNotVoteable_0 == "FloodCheckThresholdMet" then
                v38 = "Feature.Toast.VoteError.FloodCheckThresholdMet";
            elseif l_reasonForNotVoteable_0 == "AssetNotVoteable" then
                v38 = "Feature.Toast.VoteError.AssetNotVoteable";
            end;
            v29(l_SetCurrentToastMessage_0({
                toastType = l_ToastType_0.NetworkingError, 
                toastMessage = v38
            }));
            return;
        else
            if v37.type == "success" then
                local l_userVote_0 = v37.userVote;
                if l_GetFFlagEdpPlayerFeedbackEnabled_0() and l_userVote_0 ~= nil and v34 then
                    l_Game_0.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(v34);
                end;
            end;
            return;
        end;
    end, {
        v34, 
        v29
    });
    local v42 = v21(v36, v41);
    local v50 = v3.useCallback(function(v43) --[[ Line: 110 ]]
        -- upvalues: v31 (copy), v34 (copy), l_Players_0 (ref), l_gameVote_0 (ref), l_GetFFlagEdpPlayerFeedbackEnabled_0 (ref), l_Game_0 (ref), v42 (copy)
        local v44 = v31 and v31.userVote;
        local l_v43_0 = v43;
        if v44 == v43 then
            l_v43_0 = nil;
        end;
        if v34 then
            local v46 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId;
            local l_l_gameVote_0_0 = l_gameVote_0;
            local v48 = {
                uid = tostring(v46), 
                placeId = v34
            };
            local l_l_v43_0_0 = l_v43_0;
            v48.vote = l_l_v43_0_0 == true and "UpVoted" or l_l_v43_0_0 == false and "DownVoted" or "NotVoted";
            v48.prevVote = v44 == true and "UpVoted" or v44 == false and "DownVoted" or "NotVoted";
            l_l_gameVote_0_0(v48, "ExperienceDetailsVoteChip");
        end;
        if l_GetFFlagEdpPlayerFeedbackEnabled_0() and v34 then
            l_Game_0.getUserVoteFeedbackMetadataStore(false).clearItem(v34);
        end;
        v42(l_v43_0);
    end, {
        l_universeId_0, 
        v31, 
        v34, 
        v42, 
        v29
    });
    local v51 = v3.useCallback(function() --[[ Line: 149 ]]
        -- upvalues: v50 (copy)
        v50(true);
    end, {
        v50
    });
    local v52 = v3.useCallback(function() --[[ Line: 153 ]]
        -- upvalues: v50 (copy)
        v50(false);
    end, {
        v50
    });
    local v53 = v3.useMemo(function() --[[ Line: 157 ]]
        -- upvalues: l_VotesUtils_0 (ref), v30 (copy)
        return l_VotesUtils_0.getRatingDisplayText(v30);
    end, {
        v30
    });
    local v54 = v3.useMemo(function() --[[ Line: 161 ]]
        -- upvalues: v31 (copy), l_IconVariant_0 (ref)
        if v31 and v31.userVote == true then
            return l_IconVariant_0.Filled;
        else
            return l_IconVariant_0.Regular;
        end;
    end, {
        v31
    });
    local v55 = v3.useMemo(function() --[[ Line: 168 ]]
        -- upvalues: v31 (copy), l_IconVariant_0 (ref)
        if v31 and v31.userVote == false then
            return l_IconVariant_0.Filled;
        else
            return l_IconVariant_0.Regular;
        end;
    end, {
        v31
    });
    if not l_useAppPolicy_0(function(v56) --[[ Line: 175 ]]
        return v56.getGamePlaysAndRatings();
    end) then
        return nil;
    else
        return v3.createElement(l_SduiDualActionChip_0, {
            text = v53, 
            leadingIconName = v4.Enums.IconName.ThumbUp, 
            leadingIconVariant = v54, 
            leadingOnActivated = v51, 
            trailingIconName = v4.Enums.IconName.ThumbDown, 
            trailingIconVariant = v55, 
            trailingOnActivated = v52, 
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v27 else nil, 
            layoutOrder = if l_FFlagSduiServerCompat_0 then v27 else nil
        });
    end;
end);