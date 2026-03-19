local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_updateUserSettings_0 = require(l_Parent_0.LegallySensitiveContent).updateUserSettings;
local v2 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v2.SduiActionType;
local l_SduiErrorType_0 = v2.SduiErrors.SduiErrorType;
return function(v5, _, v7, _) --[[ Line: 14 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_updateUserSettings_0 (copy)
    local v9 = v5 and v5.actionParams or nil;
    if v9 == nil then
        v7.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.UpdateUserSettings, 
            message = "Missing actionParams"
        }, v7.appPage);
        return;
    else
        assert(v9, "actionParams must exist");
        local l_settings_0 = v9.settings;
        if typeof(l_settings_0) ~= "table" or next(l_settings_0) == nil then
            v7.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.UpdateUserSettings, 
                message = ("Invalid settings %*"):format(l_settings_0)
            }, v7.appPage);
            return;
        else
            local l_auditData_0 = v9.auditData;
            if l_auditData_0 ~= nil and typeof(l_auditData_0) ~= "string" then
                v7.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                    name = l_SduiActionType_0.UpdateUserSettings, 
                    message = ("Invalid auditData %*"):format(l_auditData_0)
                }, v7.appPage);
                return;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 48 ]]
                    -- upvalues: l_updateUserSettings_0 (ref), l_settings_0 (copy), l_auditData_0 (copy), v7 (copy), l_SduiErrorType_0 (ref), l_SduiActionType_0 (ref)
                    l_updateUserSettings_0(l_settings_0, l_auditData_0):catch(function(v12) --[[ Line: 49 ]]
                        -- upvalues: v7 (ref), l_SduiErrorType_0 (ref), l_SduiActionType_0 (ref)
                        v7.dependencies.logger.reportError(l_SduiErrorType_0.FailedToExecuteAction, {
                            name = l_SduiActionType_0.UpdateUserSettings, 
                            message = tostring(v12)
                        }, v7.appPage);
                    end);
                end);
                if not l_status_0 then
                    v7.dependencies.logger.reportError(l_SduiErrorType_0.FailedToExecuteAction, {
                        name = l_SduiActionType_0.UpdateUserSettings, 
                        message = tostring(l_result_0)
                    }, v7.appPage);
                    return;
                else
                    return;
                end;
            end;
        end;
    end;
end;