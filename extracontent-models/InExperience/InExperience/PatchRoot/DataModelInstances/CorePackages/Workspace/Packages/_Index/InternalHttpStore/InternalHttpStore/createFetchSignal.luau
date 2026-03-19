local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local v3 = require(l_Parent_1.HttpSignals);
local l_StatusCodes_0 = require(l_Parent_1.Http).StatusCodes;
local _ = require(l_Parent_0.HttpStoreTypes);
local v6 = require(l_Parent_0.createParsedResponse);
local v7 = {
    [l_StatusCodes_0.REQUEST_TIMEOUT] = true, 
    [l_StatusCodes_0.SERVICE_UNAVAILABLE] = true, 
    [l_StatusCodes_0.GATEWAY_TIMEOUT] = true
};
local function v38(v8) --[[ Line: 31 ]] --[[ Name: createHttpFetchWithRetry ]]
    -- upvalues: v2 (copy), v3 (copy), v7 (copy), l_StatusCodes_0 (copy)
    local v9 = v8.MaxRetryCount or 4;
    local v10 = v8.RetryJitterMinMs or 0;
    local v11 = v8.RetryJitterMaxMs or 4000;
    local v12 = nil;
    local v13 = nil;
    local v14, v15 = v2.createSignal(0);
    local v16, v17 = v2.createSignal(false);
    local function _() --[[ Line: 42 ]] --[[ Name: cleanupCurrentFetch ]]
        -- upvalues: v12 (ref), v13 (ref)
        if v12 ~= nil then
            task.cancel(v12);
            v12 = nil;
        end;
        if v13 ~= nil then
            v13();
            v13 = nil;
        end;
    end;
    local function v19() --[[ Line: 53 ]] --[[ Name: dispose ]]
        -- upvalues: v17 (copy), v12 (ref), v13 (ref)
        v17(true);
        if v12 ~= nil then
            task.cancel(v12);
            v12 = nil;
        end;
        if v13 ~= nil then
            v13();
            v13 = nil;
        end;
    end;
    local function v25(v20) --[[ Line: 58 ]] --[[ Name: scheduleRetry ]]
        -- upvalues: v12 (ref), v14 (copy), v11 (copy), v10 (copy), v15 (copy)
        if v12 ~= nil then
            return;
        else
            local l_v20_0 = v20;
            if l_v20_0 == nil or l_v20_0 > 16 then
                local v22 = math.pow(2, v14() + 1);
                local v23 = v11 - v10;
                l_v20_0 = math.max(v22 + (v10 + math.random() * v23) / 1000, 0);
            end;
            v12 = task.delay(l_v20_0, function() --[[ Line: 72 ]]
                -- upvalues: v12 (ref), v15 (ref)
                v12 = nil;
                v15(function(v24) --[[ Line: 74 ]]
                    return v24 + 1;
                end);
            end);
            return;
        end;
    end;
    local v32 = v2.createComputed(function(v26) --[[ Line: 80 ]]
        -- upvalues: v14 (copy), v8 (copy), v12 (ref), v13 (ref), v3 (ref)
        local v27 = v14(v26);
        local l_v8_0 = v8;
        if v27 > 0 then
            l_v8_0 = table.clone(v8);
            local v29 = if v8.Headers then table.clone(v8.Headers) else {};
            v29["X-Retry-Attempt"] = tostring(v27);
            l_v8_0.Headers = v29;
        end;
        if v12 ~= nil then
            task.cancel(v12);
            v12 = nil;
        end;
        if v13 ~= nil then
            v13();
            v13 = nil;
        end;
        local v30, v31 = v3.fetch(l_v8_0);
        v13 = v31;
        return v30;
    end);
    return v2.createComputed(function(v33) --[[ Line: 98 ]]
        -- upvalues: v16 (copy), v32 (copy), v14 (copy), v9 (copy), v7 (ref), v25 (copy), l_StatusCodes_0 (ref)
        if v16(v33) then
            return {
                status = "error", 
                error = {
                    HttpError = Enum.HttpError.Aborted
                }
            };
        else
            local v34 = v32(v33)(v33);
            if v34.status == "pending" then
                return v34;
            elseif v34.status == "success" then
                local l_data_0 = v34.data;
                local l_StatusCode_0 = l_data_0.StatusCode;
                if l_data_0.Stats and l_data_0.Stats.WasRequestRetried then
                    return v34;
                elseif l_StatusCode_0 >= 200 and l_StatusCode_0 < 400 then
                    return v34;
                else
                    if v14() < v9 then
                        if v7[l_StatusCode_0] then
                            v25();
                            return {
                                status = "pending"
                            };
                        elseif l_data_0.IsPrefetch and l_StatusCode_0 == l_StatusCodes_0.UNAUTHORIZED then
                            v25();
                            return {
                                status = "pending"
                            };
                        elseif l_StatusCode_0 == l_StatusCodes_0.TOO_MANY_REQUESTS and l_data_0.Headers["Retry-After"] then
                            local v37 = tonumber(l_data_0.Headers["Retry-After"]);
                            if v37 ~= nil and v37 <= 16 then
                                v25(v37);
                                return {
                                    status = "pending"
                                };
                            end;
                        end;
                    end;
                    return v34;
                end;
            elseif v34.status == "error" then
                if v14() < v9 then
                    v25();
                    return {
                        status = "pending"
                    };
                else
                    return v34;
                end;
            else
                return v34;
            end;
        end;
    end), v19;
end;
return function(v39) --[[ Line: 154 ]] --[[ Name: createFetchHttpHandler ]]
    -- upvalues: v38 (copy), v6 (copy)
    if v39.MaxRetryCount ~= nil and v39.MaxRetryCount < 0 then
        error((("MaxRetryCount must be >= 0, was provided: %*"):format(v39.MaxRetryCount)));
    end;
    if v39.RetryJitterMinMs ~= nil and v39.RetryJitterMaxMs ~= nil and v39.RetryJitterMinMs >= v39.RetryJitterMaxMs then
        error("RetryJitterMinMs must be smaller than RetryJitterMaxMs if both are provided");
    end;
    local v40, v41 = v38(v39);
    return v6(v40, v39), v41;
end;