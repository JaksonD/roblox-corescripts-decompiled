local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryUtils");
local v4 = require(l_script_FirstAncestor_0.Telemetry.DiscoveryEventErrorLogger);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v7 = game:DefineFastInt("LuaAppDiscoveryClientAppStorageCacheTtlDays", 30);
local v8 = game:DefineFastFlag("LuaAppDiscoveryClientAppStorageEmptyCacheTelemetry", false);
local v9 = game:DefineFastInt("DiscoveryClientAppStorageGetItemErrorThrottleHundredthsPercent", 10000);
local v10 = {
    HomeOmniFeedCache = l_LocalStorageKey_0.DiscoveryClientFallbackCache
};
local v11 = v8 and {
    eventName = "discoveryClientAppStorageEmptyCache", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v9, 
    lastUpdated = {
        25, 
        11, 
        19
    }, 
    description = "Cached data not found after omni recommendations fetch fails"
} or nil;
getJsonStorageData = function(v12, v13) --[[ Line: 54 ]] --[[ Name: getJsonStorageData ]]
    -- upvalues: l_AppStorageService_0 (copy), v8 (copy), l_TelemetryService_0 (copy), v11 (copy), l_HttpService_0 (copy), v4 (copy), v7 (copy)
    if not game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
        return nil;
    else
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v12);
        if l_l_AppStorageService_0_Item_0 == nil or l_l_AppStorageService_0_Item_0 == "" then
            if v8 then
                l_TelemetryService_0:LogEvent(v11, {
                    standardizedFields = {
                        "addSessionInfo"
                    }, 
                    customFields = {
                        cacheKey = v12
                    }
                });
            end;
            return nil;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 74 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_AppStorageService_0_Item_0 (copy)
                return l_HttpService_0:JSONDecode(l_l_AppStorageService_0_Item_0);
            end);
            if not l_status_0 then
                v4.reportError("DiscoveryClientAppStorageDataError", l_result_0);
                error((("Failed to decode cache data for key: %*"):format(v12)));
            end;
            if not l_result_0.version then
                v4.reportError("DiscoveryClientAppStorageDataError", (("Cached data version not found for key: %*"):format(v12)));
                error((("Cached data version not found for key: %*"):format(v12)));
            end;
            if not l_result_0.lastUpdatedTime then
                v4.reportError("DiscoveryClientAppStorageDataError", (("Cached data time not found for key: %*"):format(v12)));
                error((("Cached data time not found for key: %*"):format(v12)));
            end;
            if l_result_0.version ~= v13 or l_result_0.lastUpdatedTime and l_result_0.lastUpdatedTime < os.time() - 86400 * v7 then
                return nil;
            else
                return l_result_0.data;
            end;
        end;
    end;
end;
setJsonStorageData = function(v17, v18, v19) --[[ Line: 120 ]] --[[ Name: setJsonStorageData ]]
    -- upvalues: l_HttpService_0 (copy), l_AppStorageService_0 (copy)
    if not game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
        return;
    else
        local v20 = {
            data = v18, 
            lastUpdatedTime = os.time(), 
            version = v19
        };
        local v21 = l_HttpService_0:JSONEncode(v20);
        l_AppStorageService_0:SetItem(v17, v21);
        return;
    end;
end;
return {
    CacheKey = v10, 
    getJsonStorageData = getJsonStorageData, 
    setJsonStorageData = setJsonStorageData
};