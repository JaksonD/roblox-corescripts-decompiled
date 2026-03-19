local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiLoadTimer_0 = v1.SduiLoadTimer;
local l_getSduiApiStore_0 = v1.getSduiApiStore;
local l_SduiPageAnalytics_0 = v1.SduiPageAnalytics;
local v5 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v5.SduiActionType;
local l_SduiErrorType_0 = v5.SduiErrors.SduiErrorType;
return function(v8, _, v10) --[[ Line: 18 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_SduiPageAnalytics_0 (copy), l_SduiLoadTimer_0 (copy), l_getSduiApiStore_0 (copy)
    local v11 = v8 and v8.actionParams or nil;
    if v11 == nil then
        v10.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.LoadMoreFromApi, 
            message = "Missing actionParams"
        }, v10.appPage);
        return;
    else
        assert(v11, "actionParams must exist");
        local l_configKey_0 = v11.configKey;
        if typeof(l_configKey_0) ~= "string" then
            v10.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.LoadMoreFromApi, 
                message = ("Invalid or missing configKey: %*"):format(l_configKey_0), 
                propName = "configKey"
            }, v10.appPage);
            return;
        else
            local l_surfaceKey_0 = v11.surfaceKey;
            if typeof(l_surfaceKey_0) ~= "string" then
                v10.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                    name = l_SduiActionType_0.LoadMoreFromApi, 
                    message = ("Invalid or missing surfaceKey: %*"):format(l_surfaceKey_0), 
                    propName = "surfaceKey"
                }, v10.appPage);
                return;
            else
                l_SduiPageAnalytics_0.sendLoadMoreEvent(l_surfaceKey_0);
                local v14 = l_SduiLoadTimer_0.createLoadTimer(l_surfaceKey_0);
                v14.start("loadMore");
                l_getSduiApiStore_0().loadMoreFromApi({
                    configKey = l_configKey_0, 
                    loadTimer = v14
                });
                return;
            end;
        end;
    end;
end;