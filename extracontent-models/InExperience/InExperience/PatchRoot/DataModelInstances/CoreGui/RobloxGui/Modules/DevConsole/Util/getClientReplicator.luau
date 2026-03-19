local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = nil;
return function() --[[ Line: 4 ]] --[[ Name: getClientReplicator ]]
    -- upvalues: v1 (ref)
    if v1 == nil then
        local l_game_Service_0 = game:FindService("NetworkClient");
        if l_game_Service_0 then
            v1 = l_game_Service_0:FindFirstChildOfClass("ClientReplicator");
        end;
    end;
    if v1 and v1:IsDescendantOf(game) then
        return v1;
    else
        return nil;
    end;
end;