local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiLoadTimer_0 = v1.SduiLoadTimer;
local l_getSduiApiStore_0 = v1.getSduiApiStore;
local v4 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v4.SduiActionType;
local l_SduiErrorType_0 = v4.SduiErrors.SduiErrorType;
return function(v7, _, v9) --[[ Line: 17 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_SduiLoadTimer_0 (copy), l_getSduiApiStore_0 (copy)
    local v10 = v7 and v7.actionParams or nil;
    if v10 == nil then
        v9.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.RefreshFromApi, 
            message = "Missing actionParams"
        }, v9.appPage);
        return;
    else
        assert(v10, "actionParams must exist");
        local l_configKey_0 = v10.configKey;
        if typeof(l_configKey_0) ~= "string" then
            v9.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.RefreshFromApi, 
                message = ("Invalid or missing configKey: %*"):format(l_configKey_0), 
                propName = "configKey"
            }, v9.appPage);
            return;
        else
            local l_surfaceKey_0 = v10.surfaceKey;
            if typeof(l_surfaceKey_0) ~= "string" then
                v9.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                    name = l_SduiActionType_0.RefreshFromApi, 
                    message = ("Invalid or missing surfaceKey: %*"):format(l_surfaceKey_0), 
                    propName = "surfaceKey"
                }, v9.appPage);
                return;
            else
                local v13 = l_SduiLoadTimer_0.createLoadTimer(l_surfaceKey_0);
                v13.start("refresh");
                return l_getSduiApiStore_0().refreshFromApi({
                    configKey = l_configKey_0, 
                    loadTimer = v13
                }):finally(function() --[[ Line: 59 ]]
                    -- upvalues: v13 (copy)
                    v13.logRefreshComplete();
                end);
            end;
        end;
    end;
end;