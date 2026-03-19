local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RequestTimeDiag_0 = require(l_Parent_0.Analytics).RequestTimeDiag;
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_Parent_0.Promise);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_ResponseStatus_0 = require(l_Parent_0.AppChatNetworking).Constants.ResponseStatus;
return function(v7, _) --[[ Line: 11 ]]
    -- upvalues: l_RequestTimeDiag_0 (copy), v3 (copy), l_StatusCodes_0 (copy), l_ResponseStatus_0 (copy), v4 (copy)
    local v9 = l_RequestTimeDiag_0:new(v3.PerformanceMeasurement.LUA_CHAT_SEND_MESSAGE);
    return function(v10) --[[ Line: 14 ]]
        -- upvalues: v7 (copy), v9 (copy), l_StatusCodes_0 (ref), l_ResponseStatus_0 (ref), v4 (ref)
        v7:onBeforeSendingMessage(v10);
        return v7:sendMessage(v10):andThen(function(v11) --[[ Line: 19 ]]
            -- upvalues: v9 (ref), l_StatusCodes_0 (ref), l_ResponseStatus_0 (ref), v4 (ref)
            v9:report();
            if not v11 or not v11.responseBody or v11.responseCode ~= l_StatusCodes_0.OK or not v11.responseBody.messages or #v11.responseBody.messages == 0 or v11.responseBody.messages[1].status and v11.responseBody.messages[1].status ~= "" and v11.responseBody.messages[1].status ~= l_ResponseStatus_0.SUCCESS then
                return v4.reject(v11);
            else
                return v11;
            end;
        end):andThen(function(v12) --[[ Line: 40 ]]
            -- upvalues: v7 (ref), v10 (copy)
            return v7:onSuccess(v10, v12);
        end):catch(function(v13) --[[ Line: 43 ]]
            -- upvalues: v7 (ref), v10 (copy)
            return v7:onFailure(v10, v13);
        end);
    end;
end;