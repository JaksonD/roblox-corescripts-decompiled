local l_Parent_0 = script:FindFirstAncestor("SocialServerDrivenUi").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v2 = require(l_Parent_0.SduiCoreSystem);
local v3 = require(l_Parent_0.SocialUpsell);
local l_startFacialAgeEstimation_0 = v3.Thunks.startFacialAgeEstimation;
local l_SocialUpsellType_0 = v3.Enums.SocialUpsellType;
local l_UpsellEntrySurfaceType_0 = v3.Analytics.Enum.UpsellEntrySurfaceType;
local l_SduiErrorType_0 = v2.SduiErrors.SduiErrorType;
local l_SduiActionType_0 = v2.SduiActionType;
return function(v9, _, v11, _) --[[ Line: 19 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_AppPage_0 (copy), l_SocialUpsellType_0 (copy), l_UpsellEntrySurfaceType_0 (copy), l_startFacialAgeEstimation_0 (copy)
    local v13 = v9 and v9.actionParams or nil;
    if v13 == nil then
        v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.OpenFacialAgeEstimation, 
            message = "Missing actionParams"
        }, v11.appPage);
        return;
    else
        assert(v13, "actionParams must exist");
        local l_source_0 = v13.source;
        if l_source_0 == nil then
            v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenFacialAgeEstimation, 
                message = "Missing actionParam: source", 
                propName = "source"
            }, v11.appPage);
        end;
        local v15 = if l_source_0 == l_AppPage_0.ProfilePlatform then l_SocialUpsellType_0.FacialAgeEstimation .. l_UpsellEntrySurfaceType_0.ProfileCompletion else l_SocialUpsellType_0.FacialAgeEstimation .. l_UpsellEntrySurfaceType_0.Unknown;
        v11.dependencies.dispatch(l_startFacialAgeEstimation_0(v15, nil, nil, l_source_0, false));
        return;
    end;
end;