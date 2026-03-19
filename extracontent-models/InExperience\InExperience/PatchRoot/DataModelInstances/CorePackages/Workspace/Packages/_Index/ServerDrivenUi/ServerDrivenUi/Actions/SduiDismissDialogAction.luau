local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v2 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrorType_0 = v2.SduiErrors.SduiErrorType;
local l_SduiActionType_0 = v2.SduiActionType;
return function(v5, _, v7, _) --[[ Line: 14 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_CloseCentralOverlay_0 (copy)
    local v9 = v5 and v5.actionParams or nil;
    if v9 == nil then
        v7.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.DismissDialog, 
            message = "Missing actionParams"
        }, v7.appPage);
        return;
    else
        assert(v9, "actionParams must exist");
        if v9.dialogType == "centralOverlay" then
            v7.dependencies.dispatch(l_CloseCentralOverlay_0());
        end;
        return;
    end;
end;