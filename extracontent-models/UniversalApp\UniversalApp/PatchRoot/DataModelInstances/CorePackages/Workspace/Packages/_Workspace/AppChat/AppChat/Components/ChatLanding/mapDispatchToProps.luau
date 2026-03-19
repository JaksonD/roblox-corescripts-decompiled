local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RoactPaginator_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoactPaginator;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchConversationsByPage);
local v5 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v6 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
return function(v7) --[[ Line: 11 ]]
    -- upvalues: l_RoactPaginator_0 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy)
    return {
        [l_RoactPaginator_0.fetchInit] = function() --[[ Line: 13 ]]
            -- upvalues: v7 (copy), v4 (ref)
            return v7(v4());
        end, 
        [l_RoactPaginator_0.fetchWithCursor] = function(v8) --[[ Line: 17 ]]
            -- upvalues: v3 (ref), v7 (copy), v4 (ref)
            return v3.new(function(v9) --[[ Line: 18 ]]
                -- upvalues: v7 (ref), v4 (ref), v8 (copy)
                coroutine.wrap(function() --[[ Line: 19 ]]
                    -- upvalues: v7 (ref), v4 (ref), v8 (ref), v9 (copy)
                    local v10, v11, v12 = v7(v4(v8)):await();
                    if v10 then
                        v9(v11, v12);
                        return;
                    else
                        v9(nil, v8);
                        return;
                    end;
                end)();
            end);
        end, 
        startOneToOneConversation = function(v13) --[[ Line: 30 ]] --[[ Name: startOneToOneConversation ]]
            -- upvalues: v7 (copy), v5 (ref)
            return v7(v5.StartOneToOneConversation.API(v13));
        end, 
        createOneToOneConversation = function(v14) --[[ Line: 34 ]] --[[ Name: createOneToOneConversation ]]
            -- upvalues: v7 (copy), v6 (ref)
            return v7(v6("one_to_one", {
                v14
            }));
        end
    };
end;