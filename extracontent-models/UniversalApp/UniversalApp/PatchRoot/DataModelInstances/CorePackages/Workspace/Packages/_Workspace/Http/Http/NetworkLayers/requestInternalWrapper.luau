local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.NetworkProfiler);
local _ = require(l_script_FirstAncestor_0.RequestTypes);
local v6 = require(l_script_FirstAncestor_0.StatusCodes);
local v7 = require(l_script_FirstAncestor_0.NetworkLayers.HttpCanceller);
local v8 = require(l_script_FirstAncestor_0.Logger.GreenlistedEndpointsForLogging);
local v9 = game:DefineFastFlag("LuaAppHttpSupportNoContent", false);
local v10 = game:DefineFastFlag("EnableRetryOnPrefetch401", false);
local l_None_0 = Enum.HttpCachePolicy.None;
local v12 = {
    [v6.REQUEST_TIMEOUT] = true, 
    [v6.SERVICE_UNAVAILABLE] = true, 
    [v6.GATEWAY_TIMEOUT] = true
};
local v13 = {};
v13.__index = v13;
local function _(v14) --[[ Line: 37 ]] --[[ Name: parseResponseBody ]]
    -- upvalues: v6 (copy), l_HttpService_0 (copy)
    if v14.StatusCode == v6.NO_CONTENT then
        return true, nil;
    else
        local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v14.Body);
        return l_status_0, l_result_0;
    end;
end;
v13.new = function(v18, v19, v20, v21) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), l_None_0 (copy), v13 (copy)
    local v22 = {
        resolve = nil, 
        reject = nil, 
        retryCount = 0, 
        maxRetryCount = v21 and v21.maxRetryCount or 4, 
        httpRequest = nil, 
        canceled = false, 
        httpService = v18, 
        session = v7.currentSession(), 
        internalOptions = {
            Url = v19, 
            Method = v20 and v20 or "GET", 
            Body = v21 and v21.postBody or nil, 
            Timeout = v21 and v21.timeout or 15000, 
            CachePolicy = v21 and v21.cachePolicy or l_None_0, 
            Priority = v21 and v21.priority or 0, 
            Headers = v21 and v21.headers or nil, 
            RequestType = v21 and v21.requestType or nil
        }
    };
    if (v20 == "POST" or v20 == "PATCH") and (v22.internalOptions.Headers == nil or v22.internalOptions.Headers["Content-Type"] == nil) then
        v22.internalOptions.Headers = v22.internalOptions.Headers or {};
        v22.internalOptions.Headers["Content-Type"] = "application/json";
    end;
    setmetatable(v22, v13);
    return v22;
end;
v13.start = function(v23, v24, v25) --[[ Line: 80 ]] --[[ Name: start ]]
    v23.resolve = v24;
    v23.reject = v25;
    v23:makeRequest();
end;
v13.processResponse = function(v26, v27) --[[ Line: 86 ]] --[[ Name: processResponse ]]
    -- upvalues: v9 (copy), v6 (copy), l_HttpService_0 (copy), v4 (copy), v8 (copy)
    local v28 = nil;
    local v29 = nil;
    if v9 then
        local v30, v31;
        if v27.StatusCode == v6.NO_CONTENT then
            v30 = true;
            v31 = nil;
        else
            local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v27.Body);
            v30 = l_status_1;
            v31 = l_result_1;
        end;
        v28 = v30;
        v29 = v31;
    else
        local l_status_2, l_result_2 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v27.Body);
        v28 = l_status_2;
        v29 = l_result_2;
    end;
    if not v28 then
        v26.reject({
            HttpError = Enum.HttpError.OK, 
            isJSONValid = false
        });
        return;
    else
        v4:track({
            queued = v27.Stats.DurationInQueue, 
            nameLookup = v27.Stats.DurationNameLookup, 
            connect = v27.Stats.DurationConnect, 
            sslHandshake = v27.Stats.DurationSSLHandshake, 
            makeRequest = v27.Stats.DurationMakeRequest, 
            receiveResponse = v27.Stats.DurationReceiveResponse
        });
        local v36 = v27.Stats.RoundTripTime * 1000;
        local v37 = if v27.Body and typeof(v27.Body) == "string" then #v27.Body else 0;
        local v38 = {
            responseCode = v27.StatusCode, 
            requestUrl = v26.internalOptions.Url, 
            responseTimeMs = v36, 
            isJSONValid = true, 
            v29, 
            responseBody = v29, 
            responseStats = v27.Stats, 
            responseSize = v37
        };
        v26.resolve(v38);
        v8.sendStatusCodeCounter(v26.internalOptions.Url, v27.StatusCode);
        return;
    end;
end;
v13.retry = function(v39, v40, v41) --[[ Line: 123 ]] --[[ Name: retry ]]
    local v42 = true;
    if v40.Stats and v40.Stats.WasRequestRetried then
        v42 = false;
    end;
    if v42 then
        v39.retryCount = v39.retryCount + 1;
        if v39.retryCount > v39.maxRetryCount then
            v42 = false;
        end;
    end;
    if not v42 then
        v39.reject(v40);
        return;
    else
        if v39.internalOptions.Headers == nil then
            v39.internalOptions.Headers = {};
        end;
        v39.internalOptions.Headers["X-Retry-Attempt"] = tostring(v39.retryCount);
        local v43 = v41 or math.pow(2, v39.retryCount);
        delay(v43, function() --[[ Line: 149 ]]
            -- upvalues: v39 (copy)
            v39:makeRequest();
        end);
        return;
    end;
end;
v13.makeRequest = function(v44) --[[ Line: 154 ]] --[[ Name: makeRequest ]]
    -- upvalues: v7 (copy), v12 (copy), v10 (copy), v6 (copy), v8 (copy)
    if v44.canceled then
        return;
    else
        v44.httpRequest = v44.httpService:RequestInternal(v44.internalOptions);
        v44.httpRequest:Start(function(v45, v46) --[[ Line: 161 ]]
            -- upvalues: v44 (copy), v7 (ref), v12 (ref), v10 (ref), v6 (ref), v8 (ref)
            if v44.session ~= v7.currentSession() then
                warn("Http request aborted", v44.internalOptions.Url);
                return;
            elseif v45 then
                if v46.StatusCode >= 200 and v46.StatusCode < 400 then
                    v44:processResponse(v46);
                    return;
                elseif v12[v46.StatusCode] then
                    v44:retry(v46);
                    return;
                elseif v10 and v46.IsPrefetch and v46.StatusCode == v6.UNAUTHORIZED then
                    v44:retry(v46);
                    return;
                elseif v46.StatusCode == v6.TOO_MANY_REQUESTS and v46.Headers["Retry-After"] then
                    local v47 = tonumber(v46.Headers["Retry-After"]);
                    if v47 ~= nil and v47 <= 16 then
                        v44:retry(v46, v47);
                        return;
                    else
                        v8.sendStatusCodeCounter(v44.internalOptions.Url, v46.StatusCode);
                        v44.reject(v46);
                        return;
                    end;
                else
                    v8.sendStatusCodeCounter(v44.internalOptions.Url, v46.StatusCode);
                    v44.reject(v46);
                    return;
                end;
            else
                if not v44.canceled then
                    v44:retry({
                        HttpError = v46.HttpError
                    });
                end;
                return;
            end;
        end);
        return;
    end;
end;
v13.cancel = function(v48) --[[ Line: 201 ]] --[[ Name: cancel ]]
    v48.canceled = true;
    v48.reject({
        HttpError = Enum.HttpError.Aborted
    });
    if v48.httpRequest then
        v48.httpRequest:Cancel();
    end;
end;
return function(v49) --[[ Line: 209 ]] --[[ Name: createRequestInternalWrapper ]]
    -- upvalues: l_HttpService_0 (copy), v13 (copy), v3 (copy)
    if not v49 then
        v49 = l_HttpService_0;
    end;
    return function(v50, v51, v52) --[[ Line: 214 ]] --[[ Name: makeRequest ]]
        -- upvalues: v13 (ref), v49 (ref), v3 (ref)
        local v53 = v13.new(v49, v50, v51, v52);
        return v3.new(function(v54, v55) --[[ Line: 217 ]]
            -- upvalues: v53 (copy)
            v53:start(v54, v55);
        end), function() --[[ Line: 221 ]] --[[ Name: cancel ]]
            -- upvalues: v53 (copy)
            v53:cancel();
        end;
    end;
end;