local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local v2 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local _ = require(l_Parent_0.PlayabilityRodux);
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_OpenAgeVerificationModal_0 = require(l_Parent_0.VoiceChat).AgeVerificationOverlay.OpenAgeVerificationModal;
local v13 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.useContextualParentalControlsUpsell);
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
return function(v15, v16, v17) --[[ Line: 20 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_unlockPlayIntent_0 (copy), v13 (copy), l_PlayabilityStatusEnum_0 (copy), v2 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_OpenAgeVerificationModal_0 (copy)
    local v18 = l_useRoactService_0(l_RoactNetworking_0);
    local v19 = l_useRoactService_0(l_AppEventIngestService_0);
    local v20 = l_useDispatch_0();
    local v22 = v4.useCallback(function(v21) --[[ Line: 30 ]]
        -- upvalues: l_unlockPlayIntent_0 (ref), v19 (copy), v16 (copy), v15 (copy)
        l_unlockPlayIntent_0(v19, {
            universeId = v16, 
            upsellName = v21, 
            playabilityStatus = v15 and v15.playabilityStatus or nil
        });
    end, {
        v19, 
        v16, 
        v15
    });
    local v23 = v13(v16, v17);
    return (v4.useCallback(function(v24) --[[ Line: 40 ]]
        -- upvalues: v15 (copy), l_PlayabilityStatusEnum_0 (ref), v2 (ref), v20 (copy), l_FetchGamePlayabilityAndProductInfo_0 (ref), v18 (copy), v16 (copy), l_OpenAgeVerificationModal_0 (ref), v22 (copy), v23 (copy), v17 (copy)
        if v15 then
            local v25 = true;
            if v15.playabilityStatus ~= l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser then
                v25 = v15.playabilityStatus == l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls;
            end;
            if v25 and not v2() then
                v20(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v18, v16)):andThen(function(v26) --[[ Line: 49 ]]
                    -- upvalues: l_PlayabilityStatusEnum_0 (ref), v20 (ref), l_OpenAgeVerificationModal_0 (ref), v16 (ref), v22 (ref), v23 (ref), v17 (ref), v24 (copy)
                    if v26 == l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser then
                        v20(l_OpenAgeVerificationModal_0(v16));
                        v22("AgeVerificationUnverifiedSeventeenPlusUser");
                        return;
                    elseif v26 == l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls then
                        v23();
                        return;
                    else
                        v17(v24);
                        v22("GameLaunch");
                        return;
                    end;
                end):catch(function() --[[ Line: 67 ]]
                    -- upvalues: v17 (ref), v24 (copy), v22 (ref)
                    v17(v24);
                    v22("GameLaunch");
                end);
                return;
            else
                v17(v24);
                return;
            end;
        else
            v17(v24);
            return;
        end;
    end, {
        v18, 
        v16, 
        v15, 
        v17, 
        v22, 
        v23
    }));
end;