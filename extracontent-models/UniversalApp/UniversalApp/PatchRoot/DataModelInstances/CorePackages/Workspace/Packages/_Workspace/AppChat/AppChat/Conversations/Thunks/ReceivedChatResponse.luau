local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedMessages);
local v2 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v3 = require(l_script_FirstAncestor_0.Utils.reportAnalyticsForNewMessages);
return function(v4, v5, v6) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    return function(v7) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v5 (copy), v4 (copy), v6 (copy), v3 (ref), v1 (ref)
        local v8 = v2.fromSentChannelsApi(v5, v4, v6);
        if not v8 then
            return;
        else
            v3(v8, v4);
            local v9 = v7:getState().ChatAppReducer.Conversations[v4];
            if v9.messages:Length() > 0 then
                v8.previousMessageId = v9.messages:Last().id;
            end;
            v7:dispatch(v1(v4, {
                v8
            }));
            return;
        end;
    end;
end;