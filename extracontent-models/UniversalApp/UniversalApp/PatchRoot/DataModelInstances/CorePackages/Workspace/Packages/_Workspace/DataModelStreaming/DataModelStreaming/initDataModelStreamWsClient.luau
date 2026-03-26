game:DefineFastFlag("LuaAppEnableCompactDataModelPayload", false);
game:DefineFastFlag("LuaAppCatchWebSocketServiceError", false);
game:DefineFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming", false);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Loggers).Logger:new("DataModelStreaming");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script.Parent.getDataModelStreamAllowedHosts);
local v4 = require(script.Parent.getDataModelRoot);
local v5 = require(script.Parent.compactDataModelPayload);
local l_WebViewStateTracker_0 = require(l_Parent_0.WebViewUtils).WebViewStateTracker;
local l_FFlagEnableWebViewStateTracker_0 = require(l_Parent_0.SharedFlags).FFlagEnableWebViewStateTracker;
local v8 = v3();
local v9 = 0;
local v10 = nil;
local v11 = nil;
local l_status_0, _ = pcall(function() --[[ Line: 20 ]]
    -- upvalues: v11 (ref)
    v11 = game:GetService("WebSocketService");
end);
if not l_status_0 then
    return function() --[[ Line: 25 ]]
        -- upvalues: v1 (copy)
        v1:error("WebSocketService is not available...");
    end;
else
    local function v18(v14, v15) --[[ Line: 30 ]] --[[ Name: splitIntoChunks ]]
        local v16 = {};
        for v17 = 1, #v14, v15 do
            table.insert(v16, (string.sub(v14, v17, v17 + v15 - 1)));
        end;
        return v16;
    end;
    local function v28(v19, v20, v21) --[[ Line: 38 ]] --[[ Name: streamDataModel ]]
        -- upvalues: l_FFlagEnableWebViewStateTracker_0 (copy), l_WebViewStateTracker_0 (copy), l_HttpService_0 (copy), v5 (copy), v4 (copy), v1 (copy), v18 (copy)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 39 ]]
            -- upvalues: l_FFlagEnableWebViewStateTracker_0 (ref), l_WebViewStateTracker_0 (ref), l_HttpService_0 (ref), v5 (ref), v4 (ref), v21 (copy)
            if l_FFlagEnableWebViewStateTracker_0 and game:GetFastFlag("LuaAppEnableWebViewStateTrackerInDataModelStreaming") and l_WebViewStateTracker_0.isOpen() then
                return l_HttpService_0:JSONEncode({
                    type = "webview", 
                    webViewMetadata = l_WebViewStateTracker_0.getWebViewMetadata()
                });
            elseif game:GetFastFlag("LuaAppEnableCompactDataModelPayload") then
                return l_HttpService_0:JSONEncode(v5(v4(v21)));
            else
                return l_HttpService_0:JSONEncode(v4(v21));
            end;
        end);
        if not l_status_1 then
            v1:error((("Error encoding data model: %*"):format(l_result_1)));
            return;
        else
            v1:info((("Streaming data model, total size: %*"):format(#l_result_1)));
            local v24 = v18(l_result_1, 262144);
            local v25 = #v24;
            for v26, v27 in ipairs(v24) do
                v19:Send((("DM_STREAM_CHUNK:%*:%*:%*:%*"):format(v20, v25, v26, v27)));
            end;
            return;
        end;
    end;
    local function _() --[[ Line: 71 ]] --[[ Name: getHostToTry ]]
        -- upvalues: v10 (ref), v9 (ref), v8 (copy)
        if v10 then
            return v10;
        else
            v9 = v9 + 1;
            if v9 > #v8 then
                return nil;
            else
                return v8[v9];
            end;
        end;
    end;
    local function v30() --[[ Line: 84 ]] --[[ Name: initDataModelStreamWsClient ]]
        -- upvalues: v10 (ref), v9 (ref), v8 (copy), v11 (ref), v1 (copy), v30 (copy), l_HttpService_0 (copy), v28 (copy)
        local v31;
        if v10 then
            v31 = v10;
        else
            v9 = v9 + 1;
            v31 = if v9 > #v8 then nil else v8[v9];
        end;
        if not v31 then
            return;
        else
            local v32 = nil;
            if game:GetFastFlag("LuaAppCatchWebSocketServiceError") then
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 93 ]]
                    -- upvalues: v11 (ref), v31 (copy)
                    return v11:CreateClient(v31);
                end);
                if not l_status_2 or not l_result_2 then
                    v1:error("Failed to create WebSocket client");
                    return;
                else
                    v32 = l_result_2;
                end;
            else
                v32 = v11:CreateClient(v31);
            end;
            v32.Closed:Connect(function() --[[ Line: 105 ]]
                -- upvalues: v30 (ref)
                v30();
            end);
            v32.MessageReceived:Connect(function(v35) --[[ Line: 109 ]]
                -- upvalues: v10 (ref), v31 (copy), l_HttpService_0 (ref), v28 (ref), v32 (ref)
                v10 = v31;
                if v35:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") then
                    print("[" .. "DataModelStreaming" .. "] uuid[" .. v35 .. "]");
                end;
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 120 ]]
                    -- upvalues: l_HttpService_0 (ref), v35 (copy)
                    return l_HttpService_0:JSONDecode(v35);
                end);
                if l_status_3 and l_result_3.type == "data_model" then
                    local v38 = l_HttpService_0:GenerateGUID(false);
                    if l_result_3.request_id then
                        v38 = l_result_3.request_id;
                    end;
                    v28(v32, v38, l_result_3.properties);
                end;
            end);
            return;
        end;
    end;
    return v30;
end;