local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
local l_OpenUpsellModal_0 = require(l_Parent_0.DiscoveryRouting).OpenUpsellModal;
local l_OpenPlayButtonUpsellDialog_0 = require(l_Parent_0.DiscoveryRouting).OpenPlayButtonUpsellDialog;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local v12 = require(l_Parent_0.DiscoveryTypes);
local l_PlayableUxTreatmentEnum_0 = v12.PlayableUxTreatmentEnum;
local l_PlayabilityStatusEnum_0 = v12.PlayabilityStatusEnum;
local _ = require(l_Parent_0.PlayabilityRodux);
local l_FFlagLuaAppPlayButtonUpsellLinking_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonUpsellLinking;
local function _(v17) --[[ Line: 21 ]] --[[ Name: asReconfirmLaunchModalData ]]
    if not v17 then
        return nil;
    elseif type(v17.titleText) ~= "string" or type(v17.bodyText) ~= "string" or type(v17.primaryActionText) ~= "string" or type(v17.secondaryActionText) ~= "string" then
        return nil;
    else
        return v17;
    end;
end;
return function(v19, v20, v21) --[[ Line: 45 ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), v3 (copy), l_unlockPlayIntent_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_PlayableUxTreatmentEnum_0 (copy), l_flaggedMutedError_0 (copy), l_FFlagLuaAppPlayButtonUpsellLinking_0 (copy), l_OpenPlayButtonUpsellDialog_0 (copy), l_CloseCentralOverlay_0 (copy), l_OpenUpsellModal_0 (copy)
    local v22 = l_useRoactService_0(l_AppEventIngestService_0);
    local v23 = l_useDispatch_0();
    local v25 = v3.useCallback(function(v24) --[[ Line: 53 ]]
        -- upvalues: l_unlockPlayIntent_0 (ref), v22 (copy), v20 (copy), v19 (copy)
        l_unlockPlayIntent_0(v22, {
            universeId = v20, 
            upsellName = v24, 
            playabilityStatus = v19 and v19.playabilityStatus or nil
        });
    end, {
        v22, 
        v20, 
        v19
    });
    return v3.useCallback(function(v26) --[[ Line: 62 ]]
        -- upvalues: v19 (copy), l_PlayabilityStatusEnum_0 (ref), v21 (copy), l_PlayableUxTreatmentEnum_0 (ref), l_flaggedMutedError_0 (ref), v20 (copy), v25 (copy), l_FFlagLuaAppPlayButtonUpsellLinking_0 (ref), v23 (copy), l_OpenPlayButtonUpsellDialog_0 (ref), l_CloseCentralOverlay_0 (ref), l_OpenUpsellModal_0 (ref)
        if not v19 or not v19.playableUxTreatment or not v19.playableUxTreatment.treatment or v19.playabilityStatus ~= l_PlayabilityStatusEnum_0.Playable then
            v21(v26);
            return;
        elseif v19.playableUxTreatment.treatment == l_PlayableUxTreatmentEnum_0.ReconfirmLaunchModal then
            local l_data_0 = v19.playableUxTreatment.data;
            local v28 = if not l_data_0 then nil else if not (type(l_data_0.titleText) == "string" and type(l_data_0.bodyText) == "string" and type(l_data_0.primaryActionText) == "string") or type(l_data_0.secondaryActionText) ~= "string" then nil else l_data_0;
            if not v28 then
                l_flaggedMutedError_0("PlayableUxTreatmentMissingData", (("playableUxTreatment data is missing for treatment %* on universeId %*"):format(l_PlayableUxTreatmentEnum_0.ReconfirmLaunchModal, v20)));
                v21(v26);
                v25("GameLaunch");
                return;
            else
                if l_FFlagLuaAppPlayButtonUpsellLinking_0 then
                    v23(l_OpenPlayButtonUpsellDialog_0(v28.titleText, v28.bodyText, v28.primaryActionText, v28.secondaryActionText, function() --[[ Line: 94 ]]
                        -- upvalues: v23 (ref), l_CloseCentralOverlay_0 (ref), v21 (ref), v26 (copy)
                        v23(l_CloseCentralOverlay_0());
                        v21(v26);
                    end, function() --[[ Line: 98 ]]
                        -- upvalues: v23 (ref), l_CloseCentralOverlay_0 (ref)
                        v23(l_CloseCentralOverlay_0());
                    end, function() --[[ Line: 101 ]]
                        -- upvalues: v23 (ref), l_CloseCentralOverlay_0 (ref)
                        v23(l_CloseCentralOverlay_0());
                    end));
                else
                    v23(l_OpenUpsellModal_0(v28.titleText, v28.bodyText, v28.primaryActionText, v28.secondaryActionText, function() --[[ Line: 113 ]]
                        -- upvalues: v23 (ref), l_CloseCentralOverlay_0 (ref), v21 (ref), v26 (copy)
                        v23(l_CloseCentralOverlay_0());
                        v21(v26);
                    end, function() --[[ Line: 117 ]]
                        -- upvalues: v23 (ref), l_CloseCentralOverlay_0 (ref)
                        v23(l_CloseCentralOverlay_0());
                    end, function() --[[ Line: 120 ]]
                        -- upvalues: v23 (ref), l_CloseCentralOverlay_0 (ref)
                        v23(l_CloseCentralOverlay_0());
                    end));
                end;
                v25("ReconfirmLaunchModal");
                return;
            end;
        else
            l_flaggedMutedError_0("PlayableUxTreatmentUnsupported", (("playableUxTreatment treatment %* is unsupported for universeId %*"):format(v19.playableUxTreatment.treatment, v20)));
            v21(v26);
            v25("GameLaunch");
            return;
        end;
    end, {
        v19, 
        v20, 
        v21, 
        v25, 
        v23
    });
end;