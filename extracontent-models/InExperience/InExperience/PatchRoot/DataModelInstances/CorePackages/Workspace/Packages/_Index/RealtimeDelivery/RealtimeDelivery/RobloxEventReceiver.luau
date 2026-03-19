local l_Parent_0 = script:FindFirstAncestor("RealtimeDelivery").Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = {};
v3.__index = v3;
v3.observeEvent = function(v4, v5, v6) --[[ Line: 14 ]] --[[ Name: observeEvent ]]
    -- upvalues: l_Signal_0 (copy)
    assert(type(v5) == "string", "Expected namespace to be a string");
    assert(type(v6) == "function", "Expected callback to be a function");
    local v7 = v4.namespaceTable[v5];
    if v7 == nil then
        v7 = l_Signal_0.new();
        v4.namespaceTable[v5] = v7;
    end;
    return v7:connect(v6);
end;
v3.new = function(v8) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy)
    local v9 = {
        namespaceTable = {}
    };
    setmetatable(v9, v3);
    v9.connections = {
        v8.RobloxEventReceived:Connect(function(v10) --[[ Line: 34 ]]
            -- upvalues: v9 (copy), l_HttpService_0 (ref)
            local v11 = v9.namespaceTable[v10.namespace];
            if v11 == nil then
                return;
            else
                local v12 = nil;
                if v10.detail and v10.detail ~= "" then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 43 ]]
                        -- upvalues: l_HttpService_0 (ref), v10 (copy)
                        return l_HttpService_0:JSONDecode(v10.detail);
                    end);
                    v12 = l_status_0 and l_result_0 or v10.detail;
                else
                    v12 = {};
                end;
                v11:fire(v12, v10.detailType);
                return;
            end;
        end), 
        v8.RobloxConnectionChanged:Connect(function(v15, v16, v17, v18) --[[ Line: 60 ]]
            -- upvalues: v9 (copy), l_HttpService_0 (ref)
            local v19 = v9.namespaceTable[v15];
            if v19 == nil then
                return;
            else
                local v20 = nil;
                if v18 then
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 69 ]]
                        -- upvalues: l_HttpService_0 (ref), v18 (copy)
                        return l_HttpService_0:JSONDecode(v18);
                    end);
                    v20 = if l_status_1 then l_result_1 else {};
                end;
                v19:fire(v16, v17, v20);
                return;
            end;
        end)
    };
    return v9;
end;
return v3;