local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = require(l_Parent_0.Promise);
local l_Response_0 = require(script.Parent.Response).Response;
local l_Request_0 = require(script.Parent.Request).Request;
local function _(v5) --[[ Line: 34 ]] --[[ Name: parseResponse ]]
    -- upvalues: l_Response_0 (copy)
    local l_Body_0 = v5.Body;
    return l_Response_0.new(l_Body_0, {
        status = v5.StatusCode, 
        statusText = v5.StatusMessage, 
        headers = v5.Headers
    });
end;
return function(v8) --[[ Line: 44 ]] --[[ Name: buildFetch ]]
    -- upvalues: v2 (copy), l_Request_0 (copy), l_Error_0 (copy), l_Response_0 (copy)
    return function(v9, v10) --[[ Line: 45 ]] --[[ Name: fetch ]]
        -- upvalues: v2 (ref), l_Request_0 (ref), l_Error_0 (ref), v8 (copy), l_Response_0 (ref)
        return v2.new(function(v11, v12) --[[ Line: 46 ]]
            -- upvalues: l_Request_0 (ref), v9 (copy), v10 (copy), l_Error_0 (ref), v8 (ref), l_Response_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 47 ]]
                -- upvalues: l_Request_0 (ref), v9 (ref), v10 (ref)
                return l_Request_0.new(v9, v10);
            end);
            if not l_status_0 then
                v12(l_Error_0.new(l_result_0));
                return;
            else
                v8:RequestInternal({
                    Url = l_result_0.url, 
                    Method = l_result_0.method, 
                    Body = l_result_0.body, 
                    Headers = l_result_0.headers.headerList, 
                    CachePolicy = l_result_0.cache
                }):Start(function(v15, v16) --[[ Line: 66 ]]
                    -- upvalues: l_result_0 (copy), v12 (copy), l_Error_0 (ref), l_Response_0 (ref), v11 (copy)
                    if not v15 then
                        l_result_0.signal:fire();
                        v12(l_Error_0.new(v16.ErrorMessage));
                        return;
                    else
                        local l_Body_1 = v16.Body;
                        local v18 = l_Response_0.new(l_Body_1, {
                            status = v16.StatusCode, 
                            statusText = v16.StatusMessage, 
                            headers = v16.Headers
                        });
                        v11(v18);
                        return;
                    end;
                end);
                return;
            end;
        end);
    end;
end;