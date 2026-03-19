local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.HttpRequest);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v5 = require(l_Parent_0.Loggers).Logger:new("AppChat.Networking");
local v6 = require(l_script_FirstAncestor_0.analytics.AppChatNetworkingTelemetry);
local l_getFFlagDebugUnfilteredThreads_0 = require(l_Parent_0.SharedFlags).getFFlagDebugUnfilteredThreads;
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v11 = require(l_Parent_0.SocialLuaAnalytics).Telemetry.new({
    name = "AppChat.NetworkResponse", 
    description = "Event when a response is received from AppChat's networking layer", 
    lastUpdated = {
        2024, 
        10, 
        18
    }, 
    backendsList = {
        {
            type = "RobloxTelemetryCounter", 
            format = function(v9) --[[ Line: 23 ]] --[[ Name: format ]]
                local v10 = string.match(v9.url, ".%w+/(.*)");
                return {
                    endpoint = string.match(v10 or "", "([^?#]+)") or "unknown", 
                    statusCode = tostring(v9.statusCode), 
                    isOK = v9.isOK
                };
            end
        }
    }
});
local function v17(v12) --[[ Line: 41 ]] --[[ Name: chunkAndLogString ]]
    -- upvalues: v5 (copy)
    local v13 = {};
    for v14 = 1, #v12, 800 do
        table.insert(v13, v12:sub(v14, v14 + 800 - 1));
    end;
    for _, v16 in v13 do
        v5:debug(v16);
    end;
end;
return {
    default = l_ChallengeRequestWrapper_0((v3.config({
        requestFunction = function(v18, v19, v20) --[[ Line: 53 ]] --[[ Name: requestFunction ]]
            -- upvalues: v5 (copy), l_getFFlagDebugUnfilteredThreads_0 (copy), v17 (copy), v3 (copy)
            v5:info((("Fetching: [ requestMethod = \"%*\", url = \"%*\" ]"):format(v19, v18)));
            if l_getFFlagDebugUnfilteredThreads_0() then
                local v21 = v20 and v20.postBody or {};
                if string.find(v18, "get%-conversations") then
                    local v22 = v21.ids or {};
                    local v23 = "";
                    for _, v25 in v22 do
                        v23 = ("%*, %*"):format(v23, v25);
                    end;
                    v17((("FETCHING CONVERSATIONS%*"):format(v23)));
                elseif string.find(v18, "get%-modal%-sequence") then
                    local v26 = v21.conversation_id or v21.friend_id;
                    v5:debug((("FETCHING MODAL SEQUENCE sequence: %* id: %*"):format(v21.modal_sequence, v26)));
                elseif string.find(v18, "record%-modal%-sequence%-response") then
                    local l_modal_id_0 = v21.modal_id;
                    local l_modal_variant_0 = v21.modal_variant;
                    local v29 = v21.conversation_id or v21.friend_id;
                    v5:debug((("RECORDING MODAL SEQUENCE RESPONSE action: %* sequence: %* id: %* variant: %* conversationId: %*"):format(v21.action_type, v21.modal_sequence, l_modal_id_0, l_modal_variant_0, v29)));
                end;
            end;
            return v3.requestFunctions.RequestInternal(v18, v19, v20);
        end, 
        postRequestFunction = function(v30, v31) --[[ Line: 78 ]] --[[ Name: postRequestFunction ]]
            -- upvalues: v5 (copy), v6 (copy), v11 (copy), l_getFFlagDebugUnfilteredThreads_0 (copy), l_HttpService_0 (copy), v17 (copy)
            v5:debug((("Returned: [ requestMethod = \"%*\", url = \"%*\", statusCode = %*%*]"):format(v31.requestMethod, v31.url, v30.StatusCode, v30.HttpError ~= Enum.HttpError.OK and (", HttpError = %*"):format(v30.HttpError) or "")));
            v6.emit(v11, {
                url = v31.url, 
                statusCode = v30.StatusCode, 
                isOK = v30.HttpError == Enum.HttpError.OK
            });
            if l_getFFlagDebugUnfilteredThreads_0() then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 90 ]]
                    -- upvalues: l_HttpService_0 (ref), v30 (copy)
                    return l_HttpService_0:JSONDecode(v30.Body);
                end);
                if not l_status_0 then
                    return;
                else
                    local v34 = v31.options and v31.options.postBody and (v31.options.postBody.conversation_id or v31.options.postBody.friend_id);
                    if string.find(v31.url, "get%-user%-conversations") or string.find(v31.url, "get%-conversations") then
                        local v35 = l_result_0 and l_result_0.conversations or {};
                        local v36 = "";
                        for _, v38 in v35 do
                            v36 = ("%*, %* %* %*"):format(v36, v38.id, v38.moderation_type, v38.user_pending_status);
                        end;
                        v17((("RETURNED CONVERSATIONS%*"):format(v36)));
                        return;
                    elseif string.find(v31.url, "get%-modal%-sequence") then
                        local v39 = l_result_0 and l_result_0.modal_variant;
                        local v40 = v31.options and v31.options.postBody and v31.options.postBody.modal_sequence;
                        v5:debug((("RETURNED MODAL VARIANT sequence: %* variant: %* conversationId: %*"):format(v40, v39, v34)));
                    end;
                end;
            end;
        end, 
        maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("AppChatNetworkingHttpRetryCount", 4) else nil
    }))), 
    logger = v5
};