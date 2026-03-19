local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
game:DefineFastFlag("AppChatChannelsGetNewerMessagesWithPrevCursor", false);
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = require(l_script_FirstAncestor_0.Utils.reportToDiagByCountryCode);
local v6 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local function _(v7) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v8 = tick() - v7;
    v5(v4.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", v8);
end;
return function(v10, _, v12) --[[ Line: 22 ]]
    -- upvalues: v6 (copy), v2 (copy), v5 (copy), v4 (copy), v3 (copy)
    v6:info("Getting new messages for {}", v10);
    return function(v13) --[[ Line: 24 ]]
        -- upvalues: v10 (copy), v2 (ref), v6 (ref), v12 (copy), v5 (ref), v4 (ref), v3 (ref)
        local v14 = {};
        local v15 = v13:getState().ChatAppReducer.Conversations[v10];
        if not v15 then
            table.insert(v14, v13:dispatch(v2.rodux.GetConversationDetails.API(v10)):catch(function(v16) --[[ Line: 31 ]]
                -- upvalues: v6 (ref)
                v6:error((("AppChatNetworking failure in GetConversationDetails: %*"):format((tostring(v16)))));
            end));
        end;
        local v17 = if game:GetFastFlag("AppChatChannelsGetNewerMessagesWithPrevCursor") then v15 and v15.previousCursor or nil else nil;
        table.insert(v14, v13:dispatch(v2.rodux.GetNewerMessages.API(v10, v17)):andThen(function() --[[ Line: 46 ]]
            -- upvalues: v12 (ref), v5 (ref), v4 (ref)
            local l_v12_0 = v12;
            local v19 = tick() - l_v12_0;
            v5(v4.PerformanceMeasurement.LUA_CHAT_RECEIVE_MESSAGE, "MessageReceivedTime", v19);
        end):catch(function(v20) --[[ Line: 49 ]]
            -- upvalues: v6 (ref)
            v6:error((("AppChatNetworking failure in GetNewerMessages: %*"):format((tostring(v20)))));
        end));
        return v3.allSettled(v14);
    end;
end;