local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v4 = require(script.Parent.processConversations);
return function(v5) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    v3:info("Fetching conversations by page with cursor {}", v5 or "nil");
    return function(v6) --[[ Line: 17 ]]
        -- upvalues: v2 (ref), v5 (copy), v4 (ref), v3 (ref)
        return v6:dispatch(v2.rodux.GetUserConversations.API(v5)):tap(function(v7) --[[ Line: 20 ]]
            -- upvalues: v6 (copy), v4 (ref)
            v6:dispatch(v4(v7.responseBody.conversations));
        end):andThen(function(v8) --[[ Line: 23 ]]
            -- upvalues: v3 (ref), v5 (ref)
            local l_responseBody_0 = v8.responseBody;
            if l_responseBody_0 and l_responseBody_0.next_cursor and l_responseBody_0.next_cursor ~= "" then
                v3:debug("Next cursor found: {}", l_responseBody_0.next_cursor);
                return v5, l_responseBody_0.next_cursor;
            else
                v3:debug("No next cursor found");
                return v5, "";
            end;
        end):catch(function(v10) --[[ Line: 33 ]]
            -- upvalues: v3 (ref)
            v3:warning("Error in GetUserConversations request. Error: {}", (tostring(v10)));
        end);
    end;
end;