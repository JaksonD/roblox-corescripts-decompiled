local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.SignalsReact);
local l_Game_0 = require(l_Parent_0.DataHydration).Game;
local v5 = require(l_Parent_0.SduiSharedContent);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(l_Parent_0.UniversalAppPolicy);
local v8 = require(l_Parent_0.SharedFlags);
local v9 = require(l_Parent_0.CentralOverlay);
local v10 = require(l_Parent_0.GenericAbuseReporting);
local v11 = require(l_Parent_0.Localization);
local l_SduiChip_0 = v5.SduiChip;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = v7.useAppPolicy;
local l_CloseCentralOverlay_0 = v9.Thunks.CloseCentralOverlay;
local l_useLocalization_0 = v11.Hooks.useLocalization;
local l_AbuseVector_0 = v10.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v10.Thunks.OpenDynamicAbuseReport;
local l_FFlagAddThumbnailSelectorReport_0 = v8.FFlagAddThumbnailSelectorReport;
local l_FFlagSduiServerCompat_0 = v8.FFlagSduiServerCompat;
return v1.memo(function(v21) --[[ Line: 36 ]] --[[ Name: ExperienceDetailsReportChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useDispatch_0 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_Game_0 (copy), v1 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy), l_CloseCentralOverlay_0 (copy), l_SduiChip_0 (copy), v2 (copy)
    local v22 = nil;
    v22 = if l_FFlagSduiServerCompat_0 then v21.layoutOrder else v21.LayoutOrder;
    local l_universeId_0 = v21.universeId;
    local v24 = l_useDispatch_0();
    local v26 = l_useAppPolicy_0(function(v25) --[[ Line: 46 ]]
        return v25.getGameReportingDisabled();
    end);
    local v27 = l_useLocalization_0({
        report = "Feature.GameDetails.Action.Report"
    });
    local v28 = v3.useSignalState(l_Game_0.getGameInfoStore(false).getAndFetchGameInfo(l_universeId_0).data);
    local v29 = v28 and v28.rootPlaceId;
    local v30 = v1.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v29 (copy), v24 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_FFlagAddThumbnailSelectorReport_0 (ref), l_universeId_0 (copy), l_CloseCentralOverlay_0 (ref)
        if not v29 then
            return;
        else
            v24(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.Place, 
                targetId = v29, 
                custom = if l_FFlagAddThumbnailSelectorReport_0 then {
                    universeId = l_universeId_0
                } else nil, 
                onClose = function() --[[ Line: 70 ]] --[[ Name: onClose ]]
                    -- upvalues: v24 (ref), l_CloseCentralOverlay_0 (ref)
                    v24(l_CloseCentralOverlay_0());
                end
            }));
            return;
        end;
    end, {
        l_universeId_0, 
        v29, 
        v24
    });
    if v26 then
        return nil;
    else
        return v1.createElement(l_SduiChip_0, {
            text = v27.report, 
            leadingIconName = v2.Enums.IconName.Flag, 
            onActivated = v30, 
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then v22 else nil, 
            layoutOrder = if l_FFlagSduiServerCompat_0 then v22 else nil
        });
    end;
end);