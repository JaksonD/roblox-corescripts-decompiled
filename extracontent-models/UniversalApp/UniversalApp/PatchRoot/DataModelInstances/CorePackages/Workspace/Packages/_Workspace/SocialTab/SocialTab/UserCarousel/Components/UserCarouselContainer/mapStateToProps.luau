local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_User_0 = v1.SocialLibraries.User;
local v4 = require(l_script_FirstAncestor_0.User);
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugSocialTabCarouselEnabled);
local v7 = require(l_script_FirstAncestor_0.Flags.getFIntDebugSocialTabCarouselFriendsNumber);
local function v13(v8, v9) --[[ Line: 12 ]]
    -- upvalues: l_llama_0 (copy), v4 (copy), l_User_0 (copy), v5 (copy)
    local v10 = v8.SocialTab.Friends.byUserId.localUserId or {};
    local v11, v12 = xpcall(function() --[[ Line: 15 ]]
        -- upvalues: l_llama_0 (ref), v10 (copy), v4 (ref), v8 (copy), v9 (copy), l_User_0 (ref)
        return l_llama_0.List.sort(l_llama_0.List.map(v10, v4.mapToUsers(v8, v9)), l_User_0.sortFriendsByCorrectedPresenceAndRank);
    end, debug.traceback);
    if not v11 then
        v5:info((tostring(v12)));
    end;
    assert(v11, (tostring(v12)));
    return v12;
end;
local function v17(v14) --[[ Line: 28 ]]
    -- upvalues: v7 (copy), l_llama_0 (copy)
    local v15 = v7();
    if v15 == 0 or not v14 then
        return {};
    elseif #v14 < v15 then
        local v16 = {};
        while #v16 < v15 do
            v16 = l_llama_0.List.join(v16, v14);
        end;
        return l_llama_0.List.slice(v16, 1, v15);
    else
        return l_llama_0.List.slice(v14, 1, v15);
    end;
end;
return function(v18, v19) --[[ Line: 45 ]]
    -- upvalues: v6 (copy), v17 (copy), v13 (copy)
    local v20 = v18.SocialTab.Friends.requests.receivedCount or 0;
    return {
        screenSize = v18.ScreenSize, 
        friends = if v6() then v17((v13(v18, v19))) else v13(v18, v19), 
        hasFriendRequests = v20 > 0
    };
end;