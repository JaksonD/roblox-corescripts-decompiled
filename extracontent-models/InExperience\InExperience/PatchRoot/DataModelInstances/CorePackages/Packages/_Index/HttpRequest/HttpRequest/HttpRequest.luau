local l_Parent_0 = script:FindFirstAncestor("HttpRequest").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script.Parent.StatusCode);
local v4 = require(script.Parent.HttpSession);
local v5 = require(script.Parent.HttpResponse);
local v6 = {
    [v3.REQUEST_TIMEOUT] = true, 
    [v3.SERVICE_UNAVAILABLE] = true, 
    [v3.GATEWAY_TIMEOUT] = true
};
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9, v10, v11) --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v4 (copy), v7 (copy)
    v8 = v8 or {};
    v11 = v11 or {};
    local v12 = {
        resolve = nil, 
        reject = nil, 
        retryCount = 0, 
        httpRequest = nil, 
        canceled = false, 
        requestFunction = v8.requestFunction, 
        postRequestFunction = v8.postRequestFunction, 
        url = v9, 
        requestMethod = v10, 
        options = v1.Dictionary.join(v8.defaultOptions or {}, v11), 
        waitImpl = v8.waitImpl or delay, 
        maxRetryCount = v8.maxRetryCount or 4, 
        maxWaitTime = v8.maxWaitTime or 16, 
        session = v4.currentSession()
    };
    setmetatable(v12, v7);
    return v12;
end;
v7.start = function(v13, v14, v15) --[[ Line: 59 ]] --[[ Name: start ]]
    v13.resolve = v14;
    v13.reject = v15;
    v13:makeRequest();
end;
v7.processResponse = function(v16, v17) --[[ Line: 65 ]] --[[ Name: processResponse ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v17.Body);
    if l_status_0 then
        if v16.postRequestFunction then
            pcall(v16.postRequestFunction, v17, {
                url = v16.url, 
                requestMethod = v16.requestMethod, 
                options = v16.options, 
                retryCount = v16.retryCount
            });
        end;
        v16.resolve(v5.success(v17.StatusCode, l_result_0));
        return;
    else
        v16.reject(v5.error(Enum.HttpError.OK));
        return;
    end;
end;
v7.retry = function(v20, v21, v22) --[[ Line: 84 ]] --[[ Name: retry ]]
    v20.retryCount = v20.retryCount + 1;
    if v20.retryCount > v20.maxRetryCount then
        v20.reject(v21);
        return;
    else
        v20:wait(v22 or math.pow(2, v20.retryCount));
        return;
    end;
end;
v7.wait = function(v23, v24) --[[ Line: 94 ]] --[[ Name: wait ]]
    v23.waitImpl(v24, function() --[[ Line: 95 ]]
        -- upvalues: v23 (copy)
        v23:makeRequest();
    end);
end;
v7.makeRequest = function(v25) --[[ Line: 100 ]] --[[ Name: makeRequest ]]
    -- upvalues: v4 (copy), v6 (copy), v3 (copy), v5 (copy)
    if v25.canceled then
        return;
    else
        v25.httpRequest = v25.requestFunction(v25.url, v25.requestMethod, v25.options);
        v25.httpRequest:Start(function(v26, v27) --[[ Line: 105 ]]
            -- upvalues: v25 (copy), v4 (ref), v6 (ref), v3 (ref), v5 (ref)
            if v25.session ~= v4.currentSession() then
                warn("Http request aborted", v25.url);
                return;
            elseif v26 then
                if v27.StatusCode >= 200 and v27.StatusCode < 400 then
                    v25:processResponse(v27);
                    return;
                elseif v6[v27.StatusCode] then
                    v25:retry(v27);
                    return;
                elseif v27.StatusCode == v3.TOO_MANY_REQUESTS and v27.Headers["Retry-After"] then
                    local v28 = tonumber(v27.Headers["Retry-After"]);
                    if v28 ~= nil and v28 <= v25.maxWaitTime then
                        v25:retry(v27, v28);
                        return;
                    else
                        v25.reject(v27);
                        return;
                    end;
                else
                    v25.reject(v27);
                    return;
                end;
            else
                if not v25.canceled then
                    v25:retry(v5.error(v27.HttpError));
                end;
                return;
            end;
        end);
        return;
    end;
end;
v7.cancel = function(v29) --[[ Line: 132 ]] --[[ Name: cancel ]]
    -- upvalues: v5 (copy)
    v29.canceled = true;
    v29.reject(v5.error(Enum.HttpError.Aborted));
    if v29.httpRequest then
        v29.httpRequest:Cancel();
    end;
end;
return v7;