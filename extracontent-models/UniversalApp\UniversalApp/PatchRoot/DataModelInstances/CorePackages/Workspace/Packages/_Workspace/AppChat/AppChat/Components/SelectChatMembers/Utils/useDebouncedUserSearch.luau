local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local l_List_0 = require(l_Parent_0.Cryo).List;
local v6 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v9 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v9.clearTimeout;
local l_setTimeout_0 = v9.setTimeout;
local v12 = require(script.Parent.isUserInConversation);
local v13 = require(script.Parent.Parent.Logger);
return function(v14) --[[ Line: 22 ]] --[[ Name: useDebouncedUserSearch ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v3 (copy), l_setTimeout_0 (copy), v6 (copy), l_List_0 (copy), v4 (copy), v12 (copy), v13 (copy), l_clearTimeout_0 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useLocalUserId_0();
    local v17 = v3.useRef(l_setTimeout_0(function() --[[ Line: 25 ]]

    end, 250));
    local v18 = v3.useRef("");
    local v19, v20 = v3.useState({});
    local v28 = v3.useCallback(function(v21) --[[ Line: 29 ]]
        -- upvalues: v15 (copy), v6 (ref), v16 (copy), l_List_0 (ref), v14 (copy), v20 (copy), v4 (ref), v12 (ref), v13 (ref)
        v15(v6.SearchFriendsByQuery.API(v16, {
            query = v21, 
            limit = 20
        })):andThen(function(v22) --[[ Line: 34 ]]
            -- upvalues: l_List_0 (ref), v14 (ref), v20 (ref), v4 (ref), v12 (ref)
            local v24 = l_List_0.map(v22.responseBody.PageItems, function(v23) --[[ Line: 35 ]]
                return (tostring(v23.id));
            end);
            local v25 = v14 or {
                participants = {}
            };
            v20(v4.List.filter(v24, function(v26) --[[ Line: 39 ]]
                -- upvalues: v12 (ref), v25 (copy)
                return not v12(v26, v25);
            end));
        end):catch(function(v27) --[[ Line: 43 ]]
            -- upvalues: v13 (ref), v20 (ref)
            v13:error("Error searching friends:", v27);
            v20({});
        end);
    end, {
        v15, 
        v16, 
        v14
    });
    local v30 = v3.useCallback(function(v29) --[[ Line: 49 ]]
        -- upvalues: l_clearTimeout_0 (ref), v17 (copy), v18 (copy), l_setTimeout_0 (ref), v28 (copy), v20 (copy)
        l_clearTimeout_0(v17.current);
        v18.current = v29;
        v17.current = l_setTimeout_0(function() --[[ Line: 52 ]]
            -- upvalues: v29 (copy), v28 (ref), v20 (ref)
            if v29 ~= "" then
                v28(v29);
                return;
            else
                v20({});
                return;
            end;
        end, 250);
    end, {
        v28
    });
    v3.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: l_clearTimeout_0 (ref), v17 (copy)
        return function() --[[ Line: 63 ]]
            -- upvalues: l_clearTimeout_0 (ref), v17 (ref)
            l_clearTimeout_0(v17.current);
        end;
    end, {});
    return v19, v30, v18.current;
end;