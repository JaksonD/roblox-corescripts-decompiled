local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
local l_OpenUpsellModal_0 = require(l_Parent_0.DiscoveryRouting).OpenUpsellModal;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local v11 = require(l_Parent_0.DiscoveryTypes);
local l_PlayableUxTreatmentEnum_0 = v11.PlayableUxTreatmentEnum;
local l_PlayabilityStatusEnum_0 = v11.PlayabilityStatusEnum;
local _ = require(l_Parent_0.PlayabilityRodux);
local function _(v15) --[[ Line: 18 ]] --[[ Name: asReconfirmLaunchModalData ]]
    if not v15 then
        return nil;
    elseif type(v15.titleText) ~= "string" or type(v15.bodyText) ~= "string" or type(v15.primaryActionText) ~= "string" or type(v15.secondaryActionText) ~= "string" then
        return nil;
    else
        return v15;
    end;
end;
return function(v17, v18, v19) --[[ Line: 42 ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), v3 (copy), l_unlockPlayIntent_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_PlayableUxTreatmentEnum_0 (copy), l_flaggedMutedError_0 (copy), l_OpenUpsellModal_0 (copy), l_CloseCentralOverlay_0 (copy)
    local v20 = l_useRoactService_0(l_AppEventIngestService_0);
    local v21 = l_useDispatch_0();
    local v23 = v3.useCallback(function(v22) --[[ Line: 50 ]]
        -- upvalues: l_unlockPlayIntent_0 (ref), v20 (copy), v18 (copy), v17 (copy)
        l_unlockPlayIntent_0(v20, {
            universeId = v18, 
            upsellName = v22, 
            playabilityStatus = v17 and v17.playabilityStatus or nil
        });
    end, {
        v20, 
        v18, 
        v17
    });
    return v3.useCallback(function(v24) --[[ Line: 59 ]]
        -- upvalues: v17 (copy), l_PlayabilityStatusEnum_0 (ref), v19 (copy), l_PlayableUxTreatmentEnum_0 (ref), l_flaggedMutedError_0 (ref), v18 (copy), v23 (copy), v21 (copy), l_OpenUpsellModal_0 (ref), l_CloseCentralOverlay_0 (ref)
        if not v17 or not v17.playableUxTreatment or not v17.playableUxTreatment.treatment or v17.playabilityStatus ~= l_PlayabilityStatusEnum_0.Playable then
            v19(v24);
            return;
        elseif v17.playableUxTreatment.treatment == l_PlayableUxTreatmentEnum_0.ReconfirmLaunchModal then
            local l_data_0 = v17.playableUxTreatment.data;
            local v26 = if not l_data_0 then nil else if not (type(l_data_0.titleText) == "string" and type(l_data_0.bodyText) == "string" and type(l_data_0.primaryActionText) == "string") or type(l_data_0.secondaryActionText) ~= "string" then nil else l_data_0;
            if not v26 then
                l_flaggedMutedError_0("PlayableUxTreatmentMissingData", (("playableUxTreatment data is missing for treatment %* on universeId %*"):format(l_PlayableUxTreatmentEnum_0.ReconfirmLaunchModal, v18)));
                v19(v24);
                v23("GameLaunch");
                return;
            else
                v21(l_OpenUpsellModal_0(v26.titleText, v26.bodyText, v26.primaryActionText, v26.secondaryActionText, function() --[[ Line: 91 ]]
                    -- upvalues: v21 (ref), l_CloseCentralOverlay_0 (ref), v19 (ref), v24 (copy)
                    v21(l_CloseCentralOverlay_0());
                    v19(v24);
                end, function() --[[ Line: 95 ]]
                    -- upvalues: v21 (ref), l_CloseCentralOverlay_0 (ref)
                    v21(l_CloseCentralOverlay_0());
                end, function() --[[ Line: 98 ]]
                    -- upvalues: v21 (ref), l_CloseCentralOverlay_0 (ref)
                    v21(l_CloseCentralOverlay_0());
                end));
                v23("ReconfirmLaunchModal");
                return;
            end;
        else
            l_flaggedMutedError_0("PlayableUxTreatmentUnsupported", (("playableUxTreatment treatment %* is unsupported for universeId %*"):format(v17.playableUxTreatment.treatment, v18)));
            v19(v24);
            v23("GameLaunch");
            return;
        end;
    end, {
        v17, 
        v18, 
        v19, 
        v23, 
        v21
    });
end;