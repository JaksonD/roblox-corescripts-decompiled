local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local v1 = require(l_script_FirstAncestor_0.PlayButtonStates);
local v2 = require(l_script_FirstAncestor_0.FetchGamePlayButtonData);
local v3 = require(l_script_FirstAncestor_0.ApiPostPreparePurchase);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v6 = require(l_Parent_0.React);
local _ = require(l_Parent_0.PlayabilityRodux);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v10 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v10.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v10.Hooks.RoactRodux.useSelector;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local l_useCurrentSquadSelector_0 = require(l_Parent_0.RoduxSquads).Hooks.useCurrentSquadSelector;
local l_useIsExperienceInvitePending_0 = require(l_Parent_0.Squads).Hooks.useIsExperienceInvitePending;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_FFlagLuaAppParentUpsellPolicy_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppParentUpsellPolicy;
local l_FFlagLuaAppEnablePlayableStateWhenLoading_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading;
local function v28(v20, v21, v22, v23, v24, v25, v26) --[[ Line: 30 ]] --[[ Name: selectPlayButtonState ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v1 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
    local v27 = nil;
    v27 = if v20 == l_RetrievalStatus_0.Done and v21 ~= nil then if v21.isPlayable == true then v1.Playable else if v21.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired and v22 ~= nil and v22.isForSale == true then v1.PaidAccess else if v21.playabilityStatus == l_PlayabilityStatusEnum_0.FiatPurchaseRequired and v22 ~= nil and v22.isForSale == true then v1.FiatPaidAccess else if v21.playabilityStatus == l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser then v1.ActionNeeded else if (not l_FFlagLuaAppParentUpsellPolicy_0 or v26) and v21.playabilityStatus == l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls then v1.ActionNeeded else v1.UnplayableOther else v1.Playable;
    if l_GetFFlagIsSquadEnabled_0() and v27 == v1.Playable and v23 and #v23.members > 1 and (not v25 or not v25.maxPlayers or v25.maxPlayers > 1) then
        if v24 then
            return v1.WaitingForParty;
        else
            v27 = v1.PlayableWithParty;
        end;
    end;
    return v27;
end;
return function(v29, v30, v31, v32) --[[ Line: 94 ]]
    -- upvalues: l_useDispatch_0 (copy), v6 (copy), v2 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_useAppPolicy_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useIsExperienceInvitePending_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppEnablePlayableStateWhenLoading_0 (copy), v1 (copy), v3 (copy), l_RetrievalStatus_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_GamesProductInfoReducer_0 (copy), v28 (copy)
    local v33 = l_useDispatch_0();
    v6.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v31 (copy), v33 (copy), v2 (ref), v29 (copy), v30 (copy)
        local v34 = nil;
        if v31 ~= nil and v31 > 0 then
            v34 = task.delay(v31, function() --[[ Line: 100 ]]
                -- upvalues: v34 (ref), v33 (ref), v2 (ref), v29 (ref), v30 (ref)
                v34 = nil;
                v33(v2.Fetch(v29, v30));
            end);
        else
            v33(v2.Fetch(v29, v30));
        end;
        return function() --[[ Line: 108 ]]
            -- upvalues: v34 (ref)
            if v34 ~= nil then
                task.cancel(v34);
            end;
        end;
    end, {
        v30, 
        v31
    });
    local v35 = nil;
    if l_FFlagLuaAppParentUpsellPolicy_0 then
        v35 = l_useAppPolicy_0(function(v36) --[[ Line: 117 ]]
            return v36.getShouldShowVpcPlayButtonUpsells();
        end);
    end;
    local v37 = if l_GetFFlagIsSquadEnabled_0() then l_useCurrentSquadSelector_0() else nil;
    local v38 = if l_GetFFlagIsSquadEnabled_0() then l_useIsExperienceInvitePending_0() else nil;
    local v40 = l_useSelector_0(function(v39) --[[ Line: 124 ]]
        -- upvalues: v30 (copy)
        return v39.PlayabilityStatus and v39.PlayabilityStatus[v30] or nil;
    end);
    return {
        playButtonState = l_useSelector_0(function(v41) --[[ Line: 127 ]]
            -- upvalues: v2 (ref), v30 (copy), l_FFlagLuaAppEnablePlayableStateWhenLoading_0 (ref), v32 (copy), l_GetFFlagIsSquadEnabled_0 (ref), v37 (copy), v38 (copy), v1 (ref), v3 (ref), l_RetrievalStatus_0 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), l_GamesProductInfoReducer_0 (ref), v28 (ref), v40 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (ref), v35 (ref)
            if v2.IsLoading(v41, v30) then
                if l_FFlagLuaAppEnablePlayableStateWhenLoading_0 then
                    if v32 then
                        if l_GetFFlagIsSquadEnabled_0() and v37 and #v37.members > 1 then
                            if v38 then
                                return v1.WaitingForParty;
                            else
                                return v1.PlayableWithParty;
                            end;
                        else
                            return v1.Playable;
                        end;
                    else
                        return v1.Loading;
                    end;
                else
                    return v1.Loading;
                end;
            elseif v3.GetFetchingStatus(v41, v30) == l_RetrievalStatus_0.Fetching then
                return v1.Loading;
            else
                local v42 = l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v41, v30);
                local v43 = v41[l_GamesProductInfoReducer_0.key] and v41[l_GamesProductInfoReducer_0.key][v30] or nil;
                if l_GetFFlagIsSquadEnabled_0() then
                    local v44 = v41.GameDetails[v30];
                    return (v28(v42, v40, v43, v37, v38, v44, if l_FFlagLuaAppParentUpsellPolicy_0 then v35 else nil));
                else
                    return (v28(v42, v40, v43, nil, nil, nil, if l_FFlagLuaAppParentUpsellPolicy_0 then v35 else nil));
                end;
            end;
        end), 
        playabilityStatus = v40
    };
end;