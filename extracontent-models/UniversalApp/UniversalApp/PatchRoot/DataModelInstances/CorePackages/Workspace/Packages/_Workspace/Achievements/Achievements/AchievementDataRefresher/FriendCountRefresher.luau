local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger);
local _ = require(l_Parent_0.Signal);
return {
    init = function(v4, v5, v6) --[[ Line: 25 ]] --[[ Name: init ]]
        v4.fireFriendCountChanged = v5;
        v4.playersService = v6;
        v4.friendIds = {};
        v4.friendCount = 0;
    end, 
    start = function(v7) --[[ Line: 32 ]] --[[ Name: start ]]
        v7.friendIds = v7:_getFriendIds();
        for _, v9 in pairs(v7.playersService:GetPlayers()) do
            v7:_onPlayerAdded(v9);
        end;
        v7.playerAdded = v7.playersService.PlayerAdded:Connect(function(v10) --[[ Line: 37 ]]
            -- upvalues: v7 (copy)
            v7:_onPlayerAdded(v10);
        end);
        v7.playerRemoving = v7.playersService.PlayerRemoving:Connect(function(v11) --[[ Line: 40 ]]
            -- upvalues: v7 (copy)
            v7:_onPlayerRemoving(v11);
        end);
    end, 
    _getFriendIds = function(v12) --[[ Line: 45 ]] --[[ Name: _getFriendIds ]]
        -- upvalues: v2 (copy)
        local _ = function(v13) --[[ Line: 46 ]] --[[ Name: iterPageItems ]]
            return coroutine.wrap(function() --[[ Line: 47 ]]
                -- upvalues: v13 (copy)
                local v14 = 1;
                while true do
                    for _, v16 in ipairs(v13:GetCurrentPage()) do
                        coroutine.yield(v16, v14);
                    end;
                    if not v13.IsFinished then
                        v13:AdvanceToNextPageAsync();
                        v14 = v14 + 1;
                    else
                        break;
                    end;
                end;
            end);
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 62 ]]
            -- upvalues: v12 (copy)
            local v18 = {};
            if v12.playersService.LocalPlayer then
                local l_FriendsAsync_0 = v12.playersService:GetFriendsAsync(v12.playersService.LocalPlayer.UserId);
                for v23, _ in coroutine.wrap(function() --[[ Line: 47 ]]
                    -- upvalues: l_FriendsAsync_0 (copy)
                    local v20 = 1;
                    while true do
                        for _, v22 in ipairs(l_FriendsAsync_0:GetCurrentPage()) do
                            coroutine.yield(v22, v20);
                        end;
                        if not l_FriendsAsync_0.IsFinished then
                            l_FriendsAsync_0:AdvanceToNextPageAsync();
                            v20 = v20 + 1;
                        else
                            break;
                        end;
                    end;
                end) do
                    v18[v23.Id] = true;
                end;
            end;
            return v18;
        end);
        if not l_status_0 then
            v2:warning(l_result_0);
        end;
        return l_status_0 and l_result_0 or {};
    end, 
    _onPlayerAdded = function(v27, v28) --[[ Line: 80 ]] --[[ Name: _onPlayerAdded ]]
        if v27.friendIds[v28.UserId] then
            v27.friendCount = v27.friendCount + 1;
            v27.fireFriendCountChanged(v27.friendCount);
        end;
    end, 
    _onPlayerRemoving = function(v29, v30) --[[ Line: 87 ]] --[[ Name: _onPlayerRemoving ]]
        if v29.friendIds[v30.UserId] then
            v29.friendCount = v29.friendCount - 1;
            v29.fireFriendCountChanged(v29.friendCount);
        end;
    end, 
    stop = function(v31) --[[ Line: 94 ]] --[[ Name: stop ]]
        if v31.playerAdded then
            v31.playerAdded:Disconnect();
            v31.playerAdded = nil;
        end;
        if v31.playerRemoving then
            v31.playerRemoving:Disconnect();
            v31.playerRemoving = nil;
        end;
        v31.friendIds = {};
        v31.friendCount = 0;
    end
};