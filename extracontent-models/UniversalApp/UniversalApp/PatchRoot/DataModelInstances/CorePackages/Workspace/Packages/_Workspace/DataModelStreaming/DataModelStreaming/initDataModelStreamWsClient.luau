game:DefineFastFlag("LuaAppEnableCompactDataModelPayload", false);
game:DefineFastFlag("LuaAppCatchWebSocketServiceError", false);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Loggers).Logger:new("DataModelStreaming");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script.Parent.getDataModelStreamAllowedHosts);
local v4 = require(script.Parent.getDataModelRoot);
local v5 = require(script.Parent.compactDataModelPayload);
local v6 = v3();
local v7 = 0;
local v8 = nil;
local v9 = nil;
local l_status_0, _ = pcall(function() --[[ Line: 17 ]]
    -- upvalues: v9 (ref)
    v9 = game:GetService("WebSocketService");
end);
if not l_status_0 then
    return function() --[[ Line: 22 ]]
        -- upvalues: v1 (copy)
        v1:error("WebSocketService is not available...");
    end;
else
    local function v16(v12, v13) --[[ Line: 27 ]] --[[ Name: splitIntoChunks ]]
        local v14 = {};
        for v15 = 1, #v12, v13 do
            table.insert(v14, (string.sub(v12, v15, v15 + v13 - 1)));
        end;
        return v14;
    end;
    local function v26(v17, v18, v19) --[[ Line: 35 ]] --[[ Name: streamDataModel ]]
        -- upvalues: l_HttpService_0 (copy), v5 (copy), v4 (copy), v1 (copy), v16 (copy)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 36 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (ref), v4 (ref), v19 (copy)
            if game:GetFastFlag("LuaAppEnableCompactDataModelPayload") then
                return l_HttpService_0:JSONEncode(v5(v4(v19)));
            else
                return l_HttpService_0:JSONEncode(v4(v19));
            end;
        end);
        if not l_status_1 then
            v1:error((("Error encoding data model: %*"):format(l_result_1)));
            return;
        else
            v1:info((("Streaming data model, total size: %*"):format(#l_result_1)));
            local v22 = v16(l_result_1, 262144);
            local v23 = #v22;
            for v24, v25 in ipairs(v22) do
                v17:Send((("DM_STREAM_CHUNK:%*:%*:%*:%*"):format(v18, v23, v24, v25)));
            end;
            return;
        end;
    end;
    local function _() --[[ Line: 58 ]] --[[ Name: getHostToTry ]]
        -- upvalues: v8 (ref), v7 (ref), v6 (copy)
        if v8 then
            return v8;
        else
            v7 = v7 + 1;
            if v7 > #v6 then
                return nil;
            else
                return v6[v7];
            end;
        end;
    end;
    local function v28() --[[ Line: 71 ]] --[[ Name: initDataModelStreamWsClient ]]
        -- upvalues: v8 (ref), v7 (ref), v6 (copy), v9 (ref), v1 (copy), v28 (copy), l_HttpService_0 (copy), v26 (copy)
        local v29;
        if v8 then
            v29 = v8;
        else
            v7 = v7 + 1;
            v29 = if v7 > #v6 then nil else v6[v7];
        end;
        if not v29 then
            return;
        else
            local v30 = nil;
            if game:GetFastFlag("LuaAppCatchWebSocketServiceError") then
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 80 ]]
                    -- upvalues: v9 (ref), v29 (copy)
                    return v9:CreateClient(v29);
                end);
                if not l_status_2 or not l_result_2 then
                    v1:error("Failed to create WebSocket client");
                    return;
                else
                    v30 = l_result_2;
                end;
            else
                v30 = v9:CreateClient(v29);
            end;
            v30.Closed:Connect(function() --[[ Line: 92 ]]
                -- upvalues: v28 (ref)
                v28();
            end);
            v30.MessageReceived:Connect(function(v33) --[[ Line: 96 ]]
                -- upvalues: v8 (ref), v29 (copy), l_HttpService_0 (ref), v26 (ref), v30 (ref)
                v8 = v29;
                if v33:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") then
                    print("[" .. "DataModelStreaming" .. "] uuid[" .. v33 .. "]");
                end;
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 107 ]]
                    -- upvalues: l_HttpService_0 (ref), v33 (copy)
                    return l_HttpService_0:JSONDecode(v33);
                end);
                if l_status_3 and l_result_3.type == "data_model" then
                    local v36 = l_HttpService_0:GenerateGUID(false);
                    if l_result_3.request_id then
                        v36 = l_result_3.request_id;
                    end;
                    v26(v30, v36, l_result_3.properties);
                end;
            end);
            return;
        end;
    end;
    return v28;
end;