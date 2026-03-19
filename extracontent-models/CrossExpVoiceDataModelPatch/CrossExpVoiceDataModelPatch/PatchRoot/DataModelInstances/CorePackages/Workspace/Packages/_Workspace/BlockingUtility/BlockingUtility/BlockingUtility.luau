local l_Parent_0 = script:FindFirstAncestor("BlockingUtility").Parent;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Url_0 = require(l_Parent_0.Http).Url;
local v7 = {};
v7.__index = v7;
local v8 = nil;
spawn(function() --[[ Line: 19 ]]
    -- upvalues: v8 (ref), l_RobloxReplicatedStorage_0 (copy)
    v8 = l_RobloxReplicatedStorage_0:WaitForChild("UpdatePlayerBlockList", 1e999);
end);
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local v12 = false;
local l_BindableEvent_3 = Instance.new("BindableEvent");
local v14 = {};
local v15 = {};
local _ = function() --[[ Line: 32 ]] --[[ Name: getBlockedUserIdsFromBlockedList ]]
    -- upvalues: v14 (ref)
    local v16 = {};
    for v17, _ in v14 do
        table.insert(v16, v17);
    end;
    return v16;
end;
local function v24() --[[ Line: 40 ]] --[[ Name: getBlockedUserIds ]]
    -- upvalues: l_Players_0 (copy), v12 (ref), v14 (ref)
    if l_Players_0.LocalPlayer.UserId > 0 then
        local v20 = 0;
        while true do
            if v12 then
                local v21 = {};
                for v22, _ in v14 do
                    table.insert(v21, v22);
                end;
                return v21;
            else
                v20 = v20 + wait();
                if v20 > 5 then
                    return {};
                end;
            end;
        end;
    else
        return {};
    end;
end;
local function _(v25) --[[ Line: 57 ]] --[[ Name: isBlocked ]]
    -- upvalues: v14 (ref)
    if v14[v25] then
        return true;
    else
        return false;
    end;
end;
local function _(v27) --[[ Line: 64 ]] --[[ Name: isMuted ]]
    -- upvalues: v15 (copy)
    if v15[v27] ~= nil and v15[v27] == true then
        return true;
    else
        return false;
    end;
end;
local function v38(v29) --[[ Line: 71 ]] --[[ Name: BlockPlayerAsync ]]
    -- upvalues: l_Players_0 (copy), v14 (ref), l_BindableEvent_0 (copy), v8 (ref), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_BindableEvent_1 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if v29 and l_LocalPlayer_0 ~= v29 then
        local l_UserId_0 = v29.UserId;
        if l_UserId_0 > 0 then
            if not (v14[l_UserId_0] and true or false) then
                v14[l_UserId_0] = true;
                l_BindableEvent_0:Fire(l_UserId_0, true);
                if v8 then
                    v8:FireServer(l_UserId_0, true);
                end;
                local v32 = nil;
                local v33 = nil;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 85 ]]
                    -- upvalues: l_Url_0 (ref), v29 (copy), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
                    local v34 = l_Url_0.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(v29.UserId) .. "/block-user";
                    local v35 = l_HttpRbxApiService_0:PostAsyncFullUrl(v34, "");
                    if v35 then
                        return (l_HttpService_0:JSONDecode(v35));
                    else
                        return;
                    end;
                end);
                v32 = l_status_0;
                v33 = l_result_0;
                if v32 and v33 then
                    l_BindableEvent_1:Fire(l_UserId_0, true);
                end;
                return v32 and v33;
            else
                return true;
            end;
        end;
    end;
    return false;
end;
local function v47(v39) --[[ Line: 112 ]] --[[ Name: UnblockPlayerAsync ]]
    -- upvalues: v14 (ref), l_BindableEvent_0 (copy), v8 (ref), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_BindableEvent_1 (copy)
    if v39 then
        local l_UserId_1 = v39.UserId;
        if v14[l_UserId_1] and true or false then
            v14[l_UserId_1] = nil;
            l_BindableEvent_0:Fire(l_UserId_1, false);
            if v8 then
                v8:FireServer(l_UserId_1, false);
            end;
            local v41 = nil;
            local v42 = nil;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 125 ]]
                -- upvalues: l_Url_0 (ref), v39 (copy), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
                local v43 = l_Url_0.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(v39.UserId) .. "/unblock-user";
                local v44 = l_HttpRbxApiService_0:PostAsyncFullUrl(v43, "");
                if v44 then
                    v44 = l_HttpService_0:JSONDecode(v44);
                    return v44 and not v44.errors;
                else
                    return;
                end;
            end);
            v41 = l_status_1;
            v42 = l_result_1;
            if v41 and v42 then
                l_BindableEvent_1:Fire(l_UserId_1, false);
            end;
            return v41 and v42;
        else
            return true;
        end;
    else
        return false;
    end;
end;
local function v51(v48) --[[ Line: 155 ]] --[[ Name: AddPlayerToBlockList ]]
    -- upvalues: l_Players_0 (copy), v14 (ref), l_BindableEvent_0 (copy), v8 (ref), l_BindableEvent_1 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    if v48 and l_LocalPlayer_1 ~= v48 then
        local l_UserId_2 = v48.UserId;
        if l_UserId_2 > 0 then
            if not (v14[l_UserId_2] and true or false) then
                v14[l_UserId_2] = true;
                l_BindableEvent_0:Fire(l_UserId_2, true);
                if v8 then
                    v8:FireServer(l_UserId_2, true);
                end;
                if l_BindableEvent_1 then
                    l_BindableEvent_1:Fire(l_UserId_2, true);
                end;
            end;
            return true;
        end;
    end;
    return false;
end;
local function v54(v52) --[[ Line: 183 ]] --[[ Name: RemovePlayerFromBlockList ]]
    -- upvalues: v14 (ref), l_BindableEvent_0 (copy), v8 (ref), l_BindableEvent_1 (copy)
    if v52 then
        local l_UserId_3 = v52.UserId;
        if v14[l_UserId_3] and true or false then
            v14[l_UserId_3] = nil;
            l_BindableEvent_0:Fire(l_UserId_3, false);
            if v8 then
                v8:FireServer(l_UserId_3, false);
            end;
            if l_BindableEvent_1 then
                l_BindableEvent_1:Fire(l_UserId_3, false);
            end;
        end;
        return true;
    else
        return false;
    end;
end;
local function v58(v55) --[[ Line: 205 ]] --[[ Name: MutePlayer ]]
    -- upvalues: l_Players_0 (copy), v15 (copy), l_BindableEvent_2 (copy)
    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
    if v55 and l_LocalPlayer_2 ~= v55 then
        local l_UserId_4 = v55.UserId;
        if l_UserId_4 > 0 and not (v15[l_UserId_4] ~= nil and v15[l_UserId_4] == true) then
            v15[l_UserId_4] = true;
            l_BindableEvent_2:Fire(l_UserId_4, true);
        end;
    end;
end;
local function v61(v59) --[[ Line: 218 ]] --[[ Name: UnmutePlayer ]]
    -- upvalues: v15 (copy), l_BindableEvent_2 (copy)
    if v59 then
        local l_UserId_5 = v59.UserId;
        v15[l_UserId_5] = nil;
        l_BindableEvent_2:Fire(l_UserId_5, false);
    end;
end;
local l_BindableEvent_4 = Instance.new("BindableEvent");
local l_BindableEvent_5 = Instance.new("BindableEvent");
local l_BindableEvent_6 = Instance.new("BindableEvent");
local l_BindableEvent_7 = Instance.new("BindableEvent");
l_BindableEvent_0.Event:Connect(function(v66, v67) --[[ Line: 233 ]] --[[ Name: blockedStatusChanged ]]
    -- upvalues: l_Players_0 (copy), l_BindableEvent_4 (copy), l_BindableEvent_5 (copy)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v66);
    if l_l_Players_0_PlayerByUserId_0 then
        if v67 then
            l_BindableEvent_4:Fire(l_l_Players_0_PlayerByUserId_0);
            return;
        else
            l_BindableEvent_5:Fire(l_l_Players_0_PlayerByUserId_0);
        end;
    end;
end);
l_BindableEvent_2.Event:Connect(function(v69, v70) --[[ Line: 246 ]] --[[ Name: muteStatusChanged ]]
    -- upvalues: l_Players_0 (copy), l_BindableEvent_6 (copy), l_BindableEvent_7 (copy)
    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v69);
    if l_l_Players_0_PlayerByUserId_1 then
        if v70 then
            l_BindableEvent_6:Fire(l_l_Players_0_PlayerByUserId_1);
            return;
        else
            l_BindableEvent_7:Fire(l_l_Players_0_PlayerByUserId_1);
        end;
    end;
end);
l_StarterGui_0:RegisterGetCore("PlayerBlockedEvent", function() --[[ Line: 259 ]]
    -- upvalues: l_BindableEvent_4 (copy)
    return l_BindableEvent_4;
end);
l_StarterGui_0:RegisterGetCore("PlayerUnblockedEvent", function() --[[ Line: 262 ]]
    -- upvalues: l_BindableEvent_5 (copy)
    return l_BindableEvent_5;
end);
l_StarterGui_0:RegisterGetCore("PlayerMutedEvent", function() --[[ Line: 265 ]]
    -- upvalues: l_BindableEvent_6 (copy)
    return l_BindableEvent_6;
end);
l_StarterGui_0:RegisterGetCore("PlayerUnmutedEvent", function() --[[ Line: 268 ]]
    -- upvalues: l_BindableEvent_7 (copy)
    return l_BindableEvent_7;
end);
task.spawn(function() --[[ Line: 272 ]]
    -- upvalues: v14 (ref), v12 (ref), l_BindableEvent_3 (copy)
    game:GetService("RobloxReplicatedStorage"):WaitForChild("SendPlayerBlockList", 1e999).OnClientEvent:Connect(function(v72) --[[ Line: 275 ]]
        -- upvalues: v14 (ref), v12 (ref), l_BindableEvent_3 (ref)
        local v73 = {};
        for v74, _ in v72 do
            v73[tonumber(v74)] = true;
        end;
        v14 = v73;
        v12 = true;
        l_BindableEvent_3:Fire();
    end);
end);
task.spawn(function() --[[ Line: 289 ]]
    -- upvalues: v14 (ref), l_BindableEvent_0 (copy)
    game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdateLocalPlayerBlockList", 1e999).OnClientEvent:Connect(function(v76, v77) --[[ Line: 293 ]]
        -- upvalues: v14 (ref), l_BindableEvent_0 (ref)
        v14[v76] = v77;
        l_BindableEvent_0:Fire(v76, v77);
    end);
end);
v7.BlockPlayerAsync = function(_, v79) --[[ Line: 299 ]] --[[ Name: BlockPlayerAsync ]]
    -- upvalues: v38 (copy)
    return (v38(v79));
end;
v7.UnblockPlayerAsync = function(_, v81) --[[ Line: 303 ]] --[[ Name: UnblockPlayerAsync ]]
    -- upvalues: v47 (copy)
    return (v47(v81));
end;
v7.MutePlayer = function(_, v83) --[[ Line: 307 ]] --[[ Name: MutePlayer ]]
    -- upvalues: v58 (copy)
    return v58(v83);
end;
v7.UnmutePlayer = function(_, v85) --[[ Line: 311 ]] --[[ Name: UnmutePlayer ]]
    -- upvalues: v61 (copy)
    return v61(v85);
end;
v7.IsPlayerBlockedByUserId = function(_, v87) --[[ Line: 315 ]] --[[ Name: IsPlayerBlockedByUserId ]]
    -- upvalues: v14 (ref)
    if v14[v87] then
        return true;
    else
        return false;
    end;
end;
v7.GetBlockedStatusChangedEvent = function(_) --[[ Line: 319 ]] --[[ Name: GetBlockedStatusChangedEvent ]]
    -- upvalues: l_BindableEvent_0 (copy)
    return l_BindableEvent_0.Event;
end;
v7.GetAfterBlockedStatusChangedEvent = function(_) --[[ Line: 325 ]] --[[ Name: GetAfterBlockedStatusChangedEvent ]]
    -- upvalues: l_BindableEvent_1 (copy)
    return l_BindableEvent_1.Event;
end;
v7.GetMutedStatusChangedEvent = function(_) --[[ Line: 329 ]] --[[ Name: GetMutedStatusChangedEvent ]]
    -- upvalues: l_BindableEvent_2 (copy)
    return l_BindableEvent_2.Event;
end;
v7.IsPlayerMutedByUserId = function(_, v92) --[[ Line: 333 ]] --[[ Name: IsPlayerMutedByUserId ]]
    -- upvalues: v15 (copy)
    if v15[v92] ~= nil and v15[v92] == true then
        return true;
    else
        return false;
    end;
end;
v7.GetBlockedUserIdsAsync = function(_) --[[ Line: 337 ]] --[[ Name: GetBlockedUserIdsAsync ]]
    -- upvalues: v24 (copy)
    return (v24());
end;
v7.AddPlayerToBlockList = function(_, v95) --[[ Line: 341 ]] --[[ Name: AddPlayerToBlockList ]]
    -- upvalues: v51 (copy)
    return (v51(v95));
end;
v7.RemovePlayerFromBlockList = function(_, v97) --[[ Line: 345 ]] --[[ Name: RemovePlayerFromBlockList ]]
    -- upvalues: v54 (copy)
    return (v54(v97));
end;
return v7;