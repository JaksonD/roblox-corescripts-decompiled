local l_Chat_0 = game:GetService("Chat");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v3 = require(l_Parent_0.Signals);
local l_createSignal_0 = v3.createSignal;
local l_createComputed_0 = v3.createComputed;
local v6 = require(script.Parent.Parent.GetChatStatusStore);
local v7 = game:DefineFastFlag("EnableModerateChatUseChatService", false) and game:GetEngineFeature("EnableChatModerationModeLoggingRefactor");
return function() --[[ Line: 24 ]]
    -- upvalues: l_createSignal_0 (copy), v6 (copy), v7 (copy), l_Chat_0 (copy), l_RobloxReplicatedStorage_0 (copy), l_createComputed_0 (copy)
    local v8, v9 = l_createSignal_0(false);
    local v10, v11 = l_createSignal_0(false);
    local v12 = v6(false);
    local v13 = nil;
    local function v15(v14) --[[ Line: 31 ]] --[[ Name: setIsSettingEnabled ]]
        -- upvalues: v7 (ref), l_Chat_0 (ref), v13 (ref)
        if v7 then
            l_Chat_0:RequestModerationModeEnabled(v14);
            return;
        else
            if v13 then
                v13:FireServer(v14);
            end;
            return;
        end;
    end;
    local function v16() --[[ Line: 41 ]] --[[ Name: initialize ]]
        -- upvalues: v7 (ref), l_Chat_0 (ref), v13 (ref)
        if v7 then
            l_Chat_0:RequestModerationModeEnabled(false);
            return;
        else
            if v13 then
                v13:FireServer(false);
            end;
            return;
        end;
    end;
    local v17 = nil;
    if v7 then
        local function v18() --[[ Line: 52 ]]
            -- upvalues: v9 (copy), l_Chat_0 (ref), v11 (copy)
            v9(l_Chat_0.ModerationMode ~= "Unsupported");
            v11(l_Chat_0.ModerationMode == "Enabled");
        end;
        v17 = l_Chat_0:GetPropertyChangedSignal("ModerationMode"):Connect(v18);
        v9(l_Chat_0.ModerationMode ~= "Unsupported");
        v11(l_Chat_0.ModerationMode == "Enabled");
    else
        coroutine.wrap(function() --[[ Line: 59 ]]
            -- upvalues: v13 (ref), l_RobloxReplicatedStorage_0 (ref), v9 (copy), v11 (copy)
            v13 = l_RobloxReplicatedStorage_0:WaitForChild("ModerateChatSettingUpdated", 10);
            if v13 then
                v13.OnClientEvent:Connect(function(v19) --[[ Line: 62 ]]
                    -- upvalues: v9 (ref), v11 (ref)
                    v9(true);
                    v11(v19);
                end);
            end;
        end)();
    end;
    local v21 = l_createComputed_0(function(v20) --[[ Line: 71 ]]
        -- upvalues: v8 (copy), v12 (copy)
        return v8(v20) and v12.getChatStatus(v20) == "Enabled";
    end);
    local v23 = l_createComputed_0(function(v22) --[[ Line: 74 ]]
        -- upvalues: v10 (copy), v12 (copy)
        return v10(v22) and v12.getChatStatus(v22) == "Enabled";
    end);
    return {
        getIsSettingVisible = v21, 
        getIsSettingEnabled = v23, 
        setIsSettingEnabled = v15, 
        initialize = v16, 
        cleanup = function() --[[ Line: 83 ]] --[[ Name: cleanup ]]
            -- upvalues: v17 (ref)
            if v17 then
                v17:Disconnect();
                v17 = nil;
            end;
        end
    };
end;