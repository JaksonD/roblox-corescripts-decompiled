local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrorType_0 = v1.SduiErrors.SduiErrorType;
local l_SduiActionType_0 = v1.SduiActionType;
local l_OpenDynamicAbuseReport_0 = require(l_Parent_0.GenericAbuseReporting).Thunks.OpenDynamicAbuseReport;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v7 = require(l_Parent_0.NavigationRodux);
local l_NavigateDown_0 = v7.Thunks.NavigateDown;
local l_NavigateBack_0 = v7.Thunks.NavigateBack;
local l_SduiLoadTimer_0 = require(l_Parent_0.SduiSharedUtilities).SduiLoadTimer;
local l_fetchBadgeDetailsPage_0 = require(l_Parent_0.Badges).fetchBadgeDetailsPage;
local l_getIsBadgeDetailsSheetOpen_0 = require(l_Parent_0.Badges).BadgeDetailsSheetState.getIsBadgeDetailsSheetOpen;
local l_FFlagCloseBadgeSheetOnAbuseReport_0 = require(l_Parent_0.SharedFlags).FFlagCloseBadgeSheetOnAbuseReport;
return function(v14, _, v16, _) --[[ Line: 24 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_FFlagCloseBadgeSheetOnAbuseReport_0 (copy), l_getIsBadgeDetailsSheetOpen_0 (copy), l_NavigateBack_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_CloseCentralOverlay_0 (copy), l_SduiLoadTimer_0 (copy), l_fetchBadgeDetailsPage_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v18 = v14 and v14.actionParams or nil;
    if v18 == nil then
        v16.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.OpenAbuseReport, 
            message = "Missing action params"
        }, v16.appPage);
        return;
    else
        assert(v18, "actionParams must exist");
        if v18.targetId == nil then
            v16.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenAbuseReport, 
                message = "Missing actionParam: targetId"
            }, v16.appPage);
            return;
        elseif v18.abuseVector == nil then
            v16.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenAbuseReport, 
                message = "Missing actionParam: abuseVector"
            }, v16.appPage);
            return;
        else
            local l_targetId_0 = v18.targetId;
            local l_abuseVector_0 = v18.abuseVector;
            local l_assetTypeName_0 = v18.assetTypeName;
            local l_universeId_0 = v18.universeId;
            local l_dispatch_0 = v16.dependencies.dispatch;
            local v24 = l_FFlagCloseBadgeSheetOnAbuseReport_0 and v16.appPage == "BadgeDetails" and l_getIsBadgeDetailsSheetOpen_0();
            if v24 then
                l_dispatch_0(l_NavigateBack_0());
            end;
            local v25 = if v24 then l_targetId_0 else nil;
            l_dispatch_0(l_OpenDynamicAbuseReport_0({
                abuseVector = l_abuseVector_0, 
                targetId = l_targetId_0, 
                custom = {
                    assetTypeName = l_assetTypeName_0, 
                    universeId = l_universeId_0
                }, 
                onClose = function() --[[ Line: 86 ]] --[[ Name: onClose ]]
                    -- upvalues: l_dispatch_0 (copy), l_CloseCentralOverlay_0 (ref), v25 (copy), l_SduiLoadTimer_0 (ref), l_fetchBadgeDetailsPage_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
                    l_dispatch_0(l_CloseCentralOverlay_0());
                    if v25 then
                        local v26 = l_SduiLoadTimer_0.createLoadTimer("BadgeDetails");
                        v26.start("navigate");
                        l_fetchBadgeDetailsPage_0(v25, v26);
                        l_dispatch_0(l_NavigateDown_0({
                            name = l_AppPage_0.BadgeDetails, 
                            extraProps = {
                                badgeId = v25, 
                                pageTimer = v26
                            }
                        }));
                    end;
                end
            }));
            return;
        end;
    end;
end;