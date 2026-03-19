local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.AppChatNetworking);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
local v4 = require(script.Parent.processConversations);
return function(v5) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy), v4 (copy)
    return function(v6) --[[ Line: 16 ]]
        -- upvalues: v5 (copy), v3 (ref), v1 (ref), v2 (ref), v4 (ref)
        if not v5 or #v5 == 0 then
            return v3.resolve({});
        else
            local v7 = {};
            local l_GET_CONVERSATIONS_0 = v1.Constants.PageSize.GET_CONVERSATIONS;
            for v9 = 1, #v5, l_GET_CONVERSATIONS_0 do
                local v10 = v2.List.getRange(v5, v9, v9 + l_GET_CONVERSATIONS_0 - 1);
                table.insert(v7, v6:dispatch(v1.rodux.MultiGetConversationDetails.API(v10)));
            end;
            return v3.all(v7):andThen(function(v11) --[[ Line: 26 ]]
                -- upvalues: v2 (ref)
                return v2.List.foldLeft(v11, function(v12, v13) --[[ Line: 27 ]]
                    -- upvalues: v2 (ref)
                    local v14 = v13 and v13.responseBody and v13.responseBody.conversations;
                    if not v14 then
                        return v12;
                    else
                        return v2.List.join(v12, v14);
                    end;
                end, {});
            end):tap(function(v15) --[[ Line: 35 ]]
                -- upvalues: v6 (copy), v4 (ref)
                v6:dispatch(v4(v15));
            end);
        end;
    end;
end;