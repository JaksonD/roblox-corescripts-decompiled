local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Parent_0 = script:FindFirstAncestor("ExpChatServer").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v4 = require(l_Parent_0.ExpChatShared).Logger:new("ExpChat/" .. script.Name);
local v5 = game:DefineFastFlag("StopNaivelyCreatingWhisperChannels", false);
local function _(v6, v7) --[[ Line: 13 ]] --[[ Name: canUsersTalkToEachOther ]]
    -- upvalues: v5 (copy), l_TextChatService_0 (copy), v4 (copy)
    if v5 and v6 == v7 then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
            -- upvalues: l_TextChatService_0 (ref), v6 (copy), v7 (copy)
            return l_TextChatService_0:CanUsersWhisperAsync(v6, v7);
        end);
        local v10 = l_status_0 and l_result_0;
        v4:debug("CanUsersChat: {}", (tostring(v10)));
        return v10;
    end;
end;
local function _(v12, v13) --[[ Line: 28 ]] --[[ Name: whisperChannelAlreadyExists ]]
    -- upvalues: l_TextChatService_0 (copy)
    local v14 = string.format("RBXWhisper:%d_%d", v12 < v13 and v12 or v13, v13 < v12 and v12 or v13);
    return (l_TextChatService_0:FindFirstChild("TextChannels") or l_TextChatService_0):FindFirstChild(v14);
end;
local function v23(v16, v17) --[[ Line: 35 ]] --[[ Name: createWhisperChannel ]]
    -- upvalues: l_TextChatService_0 (copy), l_List_0 (copy)
    local v18 = string.format("RBXWhisper:%d_%d", v16 < v17 and v16 or v17, v17 < v16 and v16 or v17);
    local v19 = l_TextChatService_0:FindFirstChild("TextChannels") or l_TextChatService_0;
    local l_TextChannel_0 = Instance.new("TextChannel");
    l_TextChannel_0.Name = v18;
    l_TextChannel_0.Parent = v19;
    l_TextChannel_0:AddUserAsync(v16);
    l_TextChannel_0:AddUserAsync(v17);
    l_TextChannel_0.ChildRemoved:Connect(function(_) --[[ Line: 47 ]]
        -- upvalues: l_List_0 (ref), l_TextChannel_0 (copy)
        if l_List_0.count(l_TextChannel_0:GetChildren(), function(v22) --[[ Line: 48 ]]
            return v22:IsA("TextSource");
        end) < 2 then
            l_TextChannel_0:Destroy();
        end;
    end);
    return l_TextChannel_0;
end;
local function _(v24, v25, v26) --[[ Line: 60 ]] --[[ Name: createInstance ]]
    local v27 = Instance.new(v24);
    v27.Name = v25;
    v27.Parent = v26;
    return v27;
end;
return function() --[[ Line: 67 ]] --[[ Name: createDispatchRemoteFunction ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy), v4 (copy), v5 (copy), l_TextChatService_0 (copy), v23 (copy)
    local l_ExperienceChat_0 = l_RobloxReplicatedStorage_0:FindFirstChild("ExperienceChat");
    if not l_ExperienceChat_0 then
        local l_l_RobloxReplicatedStorage_0_0 = l_RobloxReplicatedStorage_0;
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "ExperienceChat";
        l_Folder_0.Parent = l_l_RobloxReplicatedStorage_0_0;
        l_ExperienceChat_0 = l_Folder_0;
    end;
    local l_WhisperChat_0 = l_ExperienceChat_0:FindFirstChild("WhisperChat");
    if not l_WhisperChat_0 then
        local l_RemoteFunction_0 = Instance.new("RemoteFunction");
        l_RemoteFunction_0.Name = "WhisperChat";
        l_RemoteFunction_0.Parent = l_ExperienceChat_0;
        l_WhisperChat_0 = l_RemoteFunction_0;
    end;
    if l_WhisperChat_0:IsA("RemoteFunction") then
        l_WhisperChat_0.OnServerInvoke = function(v34, v35) --[[ Line: 76 ]]
            -- upvalues: v4 (ref), v5 (ref), l_TextChatService_0 (ref), v23 (ref)
            v4:trace("WhisperChat remote invoked with: {}", (tostring(v35)));
            local v36 = tonumber(v35);
            local l_UserId_0 = v34.UserId;
            if v36 then
                if v5 then
                    local v38 = string.format("RBXWhisper:%d_%d", l_UserId_0 < v36 and l_UserId_0 or v36, v36 < l_UserId_0 and l_UserId_0 or v36);
                    local l_FirstChild_0 = (l_TextChatService_0:FindFirstChild("TextChannels") or l_TextChatService_0):FindFirstChild(v38);
                    if l_FirstChild_0 then
                        v4:trace("Whisper TextChannel already exists");
                        return l_FirstChild_0;
                    else
                        if v5 and l_UserId_0 == v36 then
                            v38 = false;
                        else
                            local l_status_1, l_result_1 = pcall(function() --[[ Line: 18 ]]
                                -- upvalues: l_TextChatService_0 (ref), l_UserId_0 (copy), v36 (copy)
                                return l_TextChatService_0:CanUsersWhisperAsync(l_UserId_0, v36);
                            end);
                            local v42 = l_status_1 and l_result_1;
                            v4:debug("CanUsersChat: {}", (tostring(v42)));
                            v38 = v42;
                        end;
                        if v38 then
                            v4:trace("Creating whisper TextChannel");
                            return (v23(l_UserId_0, v36));
                        end;
                    end;
                else
                    local v43;
                    if v5 and l_UserId_0 == v36 then
                        v43 = false;
                    else
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 18 ]]
                            -- upvalues: l_TextChatService_0 (ref), l_UserId_0 (copy), v36 (copy)
                            return l_TextChatService_0:CanUsersWhisperAsync(l_UserId_0, v36);
                        end);
                        local v46 = l_status_2 and l_result_2;
                        v4:debug("CanUsersChat: {}", (tostring(v46)));
                        v43 = v46;
                    end;
                    if v43 then
                        v4:trace("Creating whisper TextChannel");
                        return (v23(l_UserId_0, v36));
                    end;
                end;
            end;
            return nil;
        end;
    end;
    return l_WhisperChat_0;
end;