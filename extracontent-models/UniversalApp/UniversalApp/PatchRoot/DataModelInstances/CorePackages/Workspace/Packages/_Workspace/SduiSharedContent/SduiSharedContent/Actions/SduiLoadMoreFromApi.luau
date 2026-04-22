local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiLoadTimer_0 = v1.SduiLoadTimer;
local l_getSduiApiStore_0 = v1.getSduiApiStore;
local l_SduiPageAnalytics_0 = v1.SduiPageAnalytics;
local v5 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v5.SduiActionType;
local l_SduiErrorType_0 = v5.SduiErrors.SduiErrorType;
local l_FFlagSduiChartsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiChartsSupport;
return function(v9, _, v11) --[[ Line: 20 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_SduiPageAnalytics_0 (copy), l_SduiLoadTimer_0 (copy), l_getSduiApiStore_0 (copy), l_FFlagSduiChartsSupport_0 (copy)
    local v12 = v9 and v9.actionParams or nil;
    if v12 == nil then
        v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.LoadMoreFromApi, 
            message = "Missing actionParams"
        }, v11.appPage);
        return;
    else
        assert(v12, "actionParams must exist");
        local l_configKey_0 = v12.configKey;
        if typeof(l_configKey_0) ~= "string" then
            v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.LoadMoreFromApi, 
                message = ("Invalid or missing configKey: %*"):format(l_configKey_0), 
                propName = "configKey"
            }, v11.appPage);
            return;
        else
            local l_surfaceKey_0 = v12.surfaceKey;
            if typeof(l_surfaceKey_0) ~= "string" then
                v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                    name = l_SduiActionType_0.LoadMoreFromApi, 
                    message = ("Invalid or missing surfaceKey: %*"):format(l_surfaceKey_0), 
                    propName = "surfaceKey"
                }, v11.appPage);
                return;
            else
                l_SduiPageAnalytics_0.sendLoadMoreEvent(l_surfaceKey_0);
                local v15 = l_SduiLoadTimer_0.createLoadTimer(l_surfaceKey_0);
                v15.start("loadMore");
                local v16 = l_getSduiApiStore_0().loadMoreFromApi({
                    configKey = l_configKey_0, 
                    loadTimer = v15
                });
                if l_FFlagSduiChartsSupport_0 then
                    v16:finally(function() --[[ Line: 64 ]]
                        -- upvalues: v15 (copy)
                        v15.logRefreshComplete();
                    end);
                end;
                return;
            end;
        end;
    end;
end;