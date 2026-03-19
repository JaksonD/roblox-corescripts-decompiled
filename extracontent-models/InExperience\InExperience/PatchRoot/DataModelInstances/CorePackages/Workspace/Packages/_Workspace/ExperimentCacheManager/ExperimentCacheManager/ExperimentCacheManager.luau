local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_IXPService_0 = game:GetService("IXPService");
local l_HttpService_0 = game:GetService("HttpService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_Parent_0 = script:FindFirstAncestor("ExperimentCacheManager").Parent;
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_AppStorageJsonCacheUtils_0 = require(l_Parent_0.AppCommonLib).Utils.AppStorageJsonCacheUtils;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v10 = require(script.Parent.GetExperimentCacheLayers);
local v11 = game:DefineFastFlag("EnableAppStorageJsonDecodeCache", false);
local v12 = game:DefineFastFlag("LuaAppStopSpammingBacktraceExpCache", false);
local v13 = {};
v13.__index = v13;
v13.new = function(v14, v15, v16) --[[ Line: 74 ]] --[[ Name: new ]]
    -- upvalues: l_IXPService_0 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v10 (copy), v13 (copy)
    local v17 = {
        _ixpService = v14 or l_IXPService_0, 
        _eventIngest = v15 or l_EventIngest_0.new(l_EventIngestService_0), 
        _cache = {}, 
        _loadingStatusChanged = nil, 
        _layersToCache = v16 or v10(), 
        _exposureLoggingTable = {}, 
        _hasLoggedMissingLayerError = nil
    };
    setmetatable(v17, v13);
    return v17;
end;
v13._getCachedVariables = function(_) --[[ Line: 89 ]] --[[ Name: _getCachedVariables ]]
    -- upvalues: v11 (copy), l_AppStorageJsonCacheUtils_0 (copy), l_LocalStorageKey_0 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    if v11 then
        local v19 = l_AppStorageJsonCacheUtils_0.default:getCachedJsonForKey(l_LocalStorageKey_0.ExperimentCache, true);
        if v19 == nil then
            return {};
        else
            return v19;
        end;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 99 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ExperimentCache);
        end);
        if l_status_0 then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 104 ]]
                -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                return l_HttpService_0:JSONDecode(l_result_0);
            end);
            if l_status_1 then
                return l_result_1;
            end;
        end;
        return {};
    end;
end;
v13._flushToCache = function(_, v25) --[[ Line: 116 ]] --[[ Name: _flushToCache ]]
    -- upvalues: l_HttpService_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    assert(type(v25) == "table", "expected table type for cache to persist");
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 120 ]]
        -- upvalues: l_HttpService_0 (ref), v25 (copy)
        return l_HttpService_0:JSONEncode(v25);
    end);
    if l_status_2 then
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 125 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_result_2 (copy)
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ExperimentCache, l_result_2);
            l_AppStorageService_0:Flush();
        end);
        if not l_status_3 then
            warn(l_result_3);
        end;
    end;
end;
v13._onIXPInitialized = function(v30) --[[ Line: 136 ]] --[[ Name: _onIXPInitialized ]]
    local l_UserLayerLoadingStatus_0 = v30._ixpService:GetUserLayerLoadingStatus();
    if l_UserLayerLoadingStatus_0 ~= Enum.IXPLoadingStatus.Pending and v30._loadingStatusChanged then
        v30._loadingStatusChanged:disconnect();
        v30._loadingStatusChanged = nil;
    end;
    if l_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Initialized then
        local v32 = {};
        for _, v34 in ipairs(v30._layersToCache) do
            local v35 = nil;
            do
                local l_v35_0 = v35;
                pcall(function() --[[ Line: 152 ]]
                    -- upvalues: l_v35_0 (ref), v30 (copy), v34 (copy)
                    l_v35_0 = v30._ixpService:GetUserLayerVariables(v34);
                end);
                v32[v34] = l_v35_0;
            end;
        end;
        v30:_flushToCache(v32);
    end;
end;
v13._logCustomExposure = function(v37, v38) --[[ Line: 164 ]] --[[ Name: _logCustomExposure ]]
    assert(type(v38) == "string", "expected layerName to be a string");
    v37._eventIngest:setRBXEventStream("experimentCacheManager", "exposureLog", {
        layerName = v38
    });
end;
v13._containsLayer = function(v39, v40) --[[ Line: 171 ]] --[[ Name: _containsLayer ]]
    -- upvalues: l_memoize_0 (copy)
    return l_memoize_0(function(v41) --[[ Line: 172 ]]
        -- upvalues: v39 (copy)
        for _, v43 in ipairs(v39._layersToCache) do
            if v43 == v41 then
                return true;
            end;
        end;
        return false;
    end)(v40);
end;
v13.initialize = function(v44) --[[ Line: 184 ]] --[[ Name: initialize ]]
    v44._cache = v44:_getCachedVariables();
    if v44._ixpService:GetUserLayerLoadingStatus() == Enum.IXPLoadingStatus.Initialized then
        v44:_onIXPInitialized();
        return;
    else
        v44._loadingStatusChanged = v44._ixpService.OnUserLayerLoadingStatusChanged:Connect(function(v45) --[[ Line: 192 ]]
            -- upvalues: v44 (copy)
            if v45 == Enum.IXPLoadingStatus.Initialized then
                v44:_onIXPInitialized();
            end;
        end);
        return;
    end;
end;
v13.getLayerVariables = function(v46, v47, _) --[[ Line: 200 ]] --[[ Name: getLayerVariables ]]
    -- upvalues: v12 (copy), l_mutedError_0 (copy)
    assert(type(v47) == "string", "expected layerName to be a string");
    if not v46:_containsLayer(v47) and (not v12 or not v46._hasLoggedMissingLayerError) then
        if v12 then
            v46._hasLoggedMissingLayerError = true;
        end;
        l_mutedError_0("Layer " .. v47 .. " has not been configured to be cached, please add layer to `GetExperimentCacheLayers`");
    end;
    return v46._cache[v47] or nil;
end;
v13.clearCache = function(v49) --[[ Line: 222 ]] --[[ Name: clearCache ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    v49._cache = {};
    v49._exposureLoggingTable = {};
    pcall(function() --[[ Line: 226 ]]
        -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
        l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ExperimentCache, "");
        l_AppStorageService_0:Flush();
    end);
end;
v13.sendCustomExposureLog = function(v50, v51) --[[ Line: 232 ]] --[[ Name: sendCustomExposureLog ]]
    if v50._exposureLoggingTable[v51] == nil then
        v50:_logCustomExposure(v51);
        v50._exposureLoggingTable[v51] = true;
    end;
end;
v13.logLayerExposure = function(v52, v53) --[[ Line: 240 ]] --[[ Name: logLayerExposure ]]
    v52._ixpService:LogUserLayerExposure(v53);
end;
v13.default = v13.new();
return v13;