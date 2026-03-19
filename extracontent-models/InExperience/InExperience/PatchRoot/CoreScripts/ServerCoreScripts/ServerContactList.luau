local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_SocialService_0 = game:GetService("SocialService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableIrisRerouteToRCC");
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "ContactListInvokeIrisInvite";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteEvent_0.OnServerEvent:Connect(function(v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 22 ]]
    -- upvalues: l_SocialService_0 (copy), l_game_EngineFeature_0 (copy)
    if typeof(v11) ~= "string" or #v11 > 1000 or typeof(v13) ~= "string" or #v13 > 1000 or typeof(v12) ~= "number" then
        return;
    else
        l_SocialService_0:InvokeIrisInvite(v10, v11, {
            {
                userId = v10.UserId, 
                combinedName = v10.DisplayName, 
                muted = v14, 
                camEnabled = v15, 
                userAgent = if l_game_EngineFeature_0 then v16 else nil, 
                version = if l_game_EngineFeature_0 then v17 else nil
            }, 
            {
                userId = v12, 
                combinedName = v13
            }
        });
        return;
    end;
end);
local l_RemoteEvent_1 = Instance.new("RemoteEvent");
l_RemoteEvent_1.Name = "ContactListIrisInviteTeleport";
l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
local v19 = {};
l_Players_0.PlayerRemoving:Connect(function(v20) --[[ Line: 56 ]]
    -- upvalues: v19 (copy)
    v19[v20.UserId] = nil;
end);
local function _(v21) --[[ Line: 60 ]] --[[ Name: validateCallId ]]
    if typeof(v21) ~= "string" or #v21 > 50 then
        return false;
    else
        return string.match(v21, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil;
    end;
end;
l_RemoteEvent_1.OnServerEvent:Connect(function(v23, v24, _, _, v27) --[[ Line: 69 ]]
    -- upvalues: v19 (copy), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_TeleportService_0 (copy)
    local v28 = v19[v23.UserId];
    if v28 ~= nil and v28 > 5 then
        return;
    else
        if v28 == nil then
            v19[v23.UserId] = 1;
        else
            v19[v23.UserId] = v28 + 1;
        end;
        if typeof(v27) ~= "string" or #v27 > 50 or string.match(v27, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") == nil or typeof(v24) ~= "number" or v24 <= 0 then
            return;
        else
            if typeof(v27) == "string" and #v27 <= 50 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 86 ]]
                    -- upvalues: l_Url_0 (ref), v27 (copy), v23 (copy), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
                    local v29 = l_Url_0.APIS_URL .. ("call/v1/get-call-status-rcc?callId=%*&userId=%*"):format(v27, v23.UserId);
                    local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl(v29);
                    return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
                end);
                if l_status_0 and l_result_0.status == "CallAccepted" and l_result_0.reservedServerAccessCode then
                    local l_TeleportOptions_0 = Instance.new("TeleportOptions");
                    l_TeleportOptions_0.ReservedServerAccessCode = l_result_0.reservedServerAccessCode;
                    l_TeleportService_0:TeleportAsync(v24, {
                        v23
                    }, l_TeleportOptions_0);
                end;
            end;
            return;
        end;
    end;
end);
local l_RemoteEvent_2 = Instance.new("RemoteEvent");
l_RemoteEvent_2.Name = "UpdateCurrentCall";
l_RemoteEvent_2.Parent = l_RobloxReplicatedStorage_0;
local v35 = nil;
local v36 = {};
local function v44() --[[ Line: 109 ]] --[[ Name: enforceCallParticipants ]]
    -- upvalues: v35 (ref), l_Players_0 (copy)
    if v35 ~= nil then
        local v37 = false;
        for _, v39 in pairs(l_Players_0:GetPlayers()) do
            local v40 = tostring(v39.UserId);
            if not (table.find(v35.participants, v40) ~= nil) then
                v37 = true;
                break;
            end;
        end;
        if v37 then
            for _, v42 in pairs(l_Players_0:GetPlayers()) do
                local v43 = tostring(v42.UserId);
                if table.find(v35.participants, v43) ~= nil then
                    v42:Kick();
                end;
            end;
            v35 = nil;
        end;
    end;
end;
local _ = function(v45) --[[ Line: 138 ]] --[[ Name: terminateCall ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    local l_status_1, _ = pcall(function() --[[ Line: 139 ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v45 (copy), l_HttpRbxApiService_0 (ref)
        local v46 = l_Url_0.APIS_URL .. "call/v1/force-terminate-call-rcc";
        local v47 = l_HttpService_0:JSONEncode({
            callId = v45
        });
        local v48 = l_HttpRbxApiService_0:PostAsyncFullUrl(v46, v47);
        return l_HttpService_0:JSONDecode(v48);
    end);
    return l_status_1;
end;
local function v55(v52) --[[ Line: 148 ]] --[[ Name: validateCallParticipants ]]
    if typeof(v52) ~= "table" or v52 == nil or #v52 ~= 2 then
        return false;
    else
        for _, v54 in ipairs(v52) do
            if typeof(v54) ~= "string" or #v54 > 50 or tonumber(v54) == nil then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v68(v56, v57, v58) --[[ Line: 161 ]] --[[ Name: validateCall ]]
    -- upvalues: v55 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    if typeof(v57) ~= "string" or #v57 > 50 or string.match(v57, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") == nil or not v55(v58) then
        return 400;
    else
        local l_status_2, _ = pcall(function() --[[ Line: 165 ]]
            -- upvalues: l_Url_0 (ref), v58 (copy), v57 (copy), v56 (copy), l_HttpService_0 (ref), l_HttpRbxApiService_0 (ref)
            local v59 = l_Url_0.APIS_URL .. "call/v1/verify-valid-call";
            local v60 = {};
            for v61, v62 in ipairs(v58) do
                v60[v61] = tonumber(v62);
            end;
            local v63 = {
                callId = v57, 
                userId = v56.UserId, 
                instanceId = game.JobId, 
                callParticipants = v60
            };
            local v64 = l_HttpService_0:JSONEncode(v63);
            local v65 = l_HttpRbxApiService_0:PostAsyncFullUrl(v59, v64);
            return l_HttpService_0:JSONDecode(v65);
        end);
        if l_status_2 then
            return 200;
        else
            return 400;
        end;
    end;
end;
l_RemoteEvent_2.OnServerEvent:Connect(function(v69, v70) --[[ Line: 190 ]]
    -- upvalues: v36 (copy), v68 (copy), v35 (ref), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), v44 (copy)
    if v36[v69.UserId] ~= nil and v36[v69.UserId] > 10 then
        return;
    else
        if v36[v69.UserId] ~= nil then
            v36[v69.UserId] = v36[v69.UserId] + 1;
        else
            v36[v69.UserId] = 1;
        end;
        local v71 = true;
        if v70 ~= nil then
            v71 = v68(v69, v70.callId, v70.participants) == 200;
        end;
        if not v71 then
            v69:Kick();
            return;
        else
            if v35 ~= nil and v70 ~= nil and v35.callId ~= v70.callId then
                local l_callId_0 = v35.callId;
                local _, _ = pcall(function() --[[ Line: 139 ]]
                    -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), l_callId_0 (copy), l_HttpRbxApiService_0 (ref)
                    local v73 = l_Url_0.APIS_URL .. "call/v1/force-terminate-call-rcc";
                    local v74 = l_HttpService_0:JSONEncode({
                        callId = l_callId_0
                    });
                    local v75 = l_HttpRbxApiService_0:PostAsyncFullUrl(v73, v74);
                    return l_HttpService_0:JSONDecode(v75);
                end);
                v44();
            end;
            v35 = v70;
            v44();
            return;
        end;
    end;
end);
l_Players_0.PlayerAdded:Connect(function(_) --[[ Line: 227 ]]
    -- upvalues: v44 (copy)
    v44();
end);
l_Players_0.PlayerRemoving:Connect(function(v79) --[[ Line: 231 ]]
    -- upvalues: v36 (copy), v35 (ref), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    v36[v79.UserId] = nil;
    if v35 ~= nil then
        local v80 = tostring(v79.UserId);
        if table.find(v35.participants, v80) ~= nil then
            local l_callId_1 = v35.callId;
            local l_status_4, _ = pcall(function() --[[ Line: 139 ]]
                -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), l_callId_1 (copy), l_HttpRbxApiService_0 (ref)
                local v82 = l_Url_0.APIS_URL .. "call/v1/force-terminate-call-rcc";
                local v83 = l_HttpService_0:JSONEncode({
                    callId = l_callId_1
                });
                local v84 = l_HttpRbxApiService_0:PostAsyncFullUrl(v82, v83);
                return l_HttpService_0:JSONDecode(v84);
            end);
            if l_status_4 then
                v35 = nil;
            end;
        end;
    end;
end);