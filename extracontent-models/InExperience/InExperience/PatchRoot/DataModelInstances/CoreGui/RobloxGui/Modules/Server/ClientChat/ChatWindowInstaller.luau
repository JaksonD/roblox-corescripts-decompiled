local l_Chat_0 = game:GetService("Chat");
local l_Players_0 = game:GetService("Players");
local l_StarterPlayerScripts_0 = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Server.ServerUtil);
local v5 = require(l_RobloxGui_0.Modules.Server.SendChatAnalytics);
local v6 = game:DefineFastFlag("ChatWindowInstallerCheckClassName", false);
local v7 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
v7 = l_status_0 and l_result_0;
l_status_0 = function(v10, v11, v12) --[[ Line: 24 ]] --[[ Name: LoadLocalScript ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v13 = v10:WaitForChild(v11);
    if v6 and v13.ClassName ~= "ModuleScript" then
        return v13:Clone();
    else
        local l_LocalScript_0 = Instance.new("LocalScript");
        l_LocalScript_0.Name = v11;
        if v4.getFFlagServerCoreScriptSourceCode() then
            l_LocalScript_0.Source = v4.getSourceForServerScript(v13);
        else
            l_LocalScript_0.Source = v13.Source;
        end;
        l_LocalScript_0.Parent = v12;
        return l_LocalScript_0;
    end;
end;
l_result_0 = function(v15, v16, v17) --[[ Line: 42 ]] --[[ Name: LoadModule ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v18 = v15:WaitForChild(v16);
    if v6 and v18.ClassName ~= "ModuleScript" then
        return v18:Clone();
    else
        local l_ModuleScript_0 = Instance.new("ModuleScript");
        l_ModuleScript_0.Name = v16;
        if v4.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_0.Source = v4.getSourceForServerScript(v18);
        else
            l_ModuleScript_0.Source = v18.Source;
        end;
        l_ModuleScript_0.Parent = v17;
        return l_ModuleScript_0;
    end;
end;
local function _(v20, v21, v22) --[[ Line: 60 ]] --[[ Name: GetBoolValue ]]
    local l_v20_FirstChild_0 = v20:FindFirstChild(v21);
    if l_v20_FirstChild_0 and l_v20_FirstChild_0:IsA("BoolValue") then
        return l_v20_FirstChild_0.Value;
    else
        return v22;
    end;
end;
return function() --[[ Line: 70 ]] --[[ Name: Install ]]
    -- upvalues: l_Chat_0 (copy), l_status_0 (copy), l_result_0 (copy), v7 (ref), l_StarterPlayerScripts_0 (copy), l_Players_0 (copy), v5 (copy)
    local v25 = {};
    local v26 = true;
    local l_ChatScript_0 = l_Chat_0:FindFirstChild("ChatScript");
    if not l_ChatScript_0 then
        v26 = false;
        l_ChatScript_0 = l_status_0(script.Parent, "ChatScript", l_Chat_0);
        local v28 = l_result_0(script.Parent, "ChatMain", l_ChatScript_0);
        l_result_0(script.Parent, "ChannelsBar", v28);
        l_result_0(script.Parent, "ChatBar", v28);
        l_result_0(script.Parent, "ChatChannel", v28);
        l_result_0(script.Parent, "MessageLogDisplay", v28);
        l_result_0(script.Parent, "ChatWindow", v28);
        l_result_0(script.Parent, "MessageLabelCreator", v28);
        l_result_0(script.Parent, "CommandProcessor", v28);
        l_result_0(script.Parent, "ChannelsTab", v28);
        l_result_0(script.Parent.Parent.Parent.Common, "ObjectPool", v28);
        l_result_0(script.Parent, "MessageSender", v28);
        l_result_0(script.Parent, "CurveUtil", v28);
        if v7 then
            local l_BoolValue_0 = Instance.new("BoolValue");
            l_BoolValue_0.Name = "ChatTranslationEnabled";
            l_BoolValue_0.Value = false;
            l_BoolValue_0.Parent = v28;
        end;
    else
        v25.ChatScript = "True";
    end;
    local v30 = true;
    local l_BubbleChat_0 = l_Chat_0:FindFirstChild("BubbleChat");
    if not l_BubbleChat_0 then
        v30 = false;
        l_BubbleChat_0 = l_status_0(script.Parent.BubbleChat, "BubbleChat", l_Chat_0);
    else
        v25.BubbleChat = "True";
    end;
    local l_ClientChatModules_0 = l_Chat_0:FindFirstChild("ClientChatModules");
    if not l_ClientChatModules_0 then
        l_ClientChatModules_0 = Instance.new("Folder");
        l_ClientChatModules_0.Name = "ClientChatModules";
        l_ClientChatModules_0.Archivable = false;
        l_ClientChatModules_0.Parent = l_Chat_0;
    else
        v25.ClientChatModules = "True";
    end;
    if not l_ClientChatModules_0:FindFirstChild("ChatSettings") then
        l_result_0(script.Parent.DefaultClientChatModules, "ChatSettings", l_ClientChatModules_0);
    else
        v25.ChatSettings = "True";
    end;
    if not l_ClientChatModules_0:FindFirstChild("ChatConstants") then
        l_result_0(script.Parent.DefaultClientChatModules, "ChatConstants", l_ClientChatModules_0);
    else
        v25.ChatConstants = "True";
    end;
    if not l_ClientChatModules_0:FindFirstChild("ChatLocalization") then
        l_result_0(script.Parent.DefaultClientChatModules, "ChatLocalization", l_ClientChatModules_0);
    else
        v25.ChatLocalization = "True";
    end;
    local l_MessageCreatorModules_0 = l_ClientChatModules_0:FindFirstChild("MessageCreatorModules");
    if not l_MessageCreatorModules_0 then
        l_MessageCreatorModules_0 = Instance.new("Folder");
        l_MessageCreatorModules_0.Name = "MessageCreatorModules";
        l_MessageCreatorModules_0.Archivable = false;
        local l_BoolValue_1 = Instance.new("BoolValue");
        l_BoolValue_1.Name = "InsertDefaultModules";
        l_BoolValue_1.Value = true;
        l_BoolValue_1.Parent = l_MessageCreatorModules_0;
        l_MessageCreatorModules_0.Parent = l_ClientChatModules_0;
    end;
    local l_InsertDefaultModules_0 = l_MessageCreatorModules_0:FindFirstChild("InsertDefaultModules");
    if if l_InsertDefaultModules_0 and l_InsertDefaultModules_0:IsA("BoolValue") then l_InsertDefaultModules_0.Value else false then
        local l_Children_0 = script.Parent.DefaultClientChatModules.MessageCreatorModules:GetChildren();
        for v37 = 1, #l_Children_0 do
            if not l_MessageCreatorModules_0:FindFirstChild(l_Children_0[v37].Name) then
                l_result_0(script.Parent.DefaultClientChatModules.MessageCreatorModules, l_Children_0[v37].Name, l_MessageCreatorModules_0);
            else
                v25[l_Children_0[v37].Name] = "True";
            end;
        end;
    end;
    local l_CommandModules_0 = l_ClientChatModules_0:FindFirstChild("CommandModules");
    if not l_CommandModules_0 then
        l_CommandModules_0 = Instance.new("Folder");
        l_CommandModules_0.Name = "CommandModules";
        l_CommandModules_0.Archivable = false;
        l_InsertDefaultModules_0 = Instance.new("BoolValue");
        l_InsertDefaultModules_0.Name = "InsertDefaultModules";
        l_InsertDefaultModules_0.Value = true;
        l_InsertDefaultModules_0.Parent = l_CommandModules_0;
        l_CommandModules_0.Parent = l_ClientChatModules_0;
    end;
    local l_InsertDefaultModules_1 = l_CommandModules_0:FindFirstChild("InsertDefaultModules");
    if if l_InsertDefaultModules_1 and l_InsertDefaultModules_1:IsA("BoolValue") then l_InsertDefaultModules_1.Value else false then
        local l_Children_1 = script.Parent.DefaultClientChatModules.CommandModules:GetChildren();
        for v41 = 1, #l_Children_1 do
            if not l_CommandModules_0:FindFirstChild(l_Children_1[v41].Name) then
                l_result_0(script.Parent.DefaultClientChatModules.CommandModules, l_Children_1[v41].Name, l_CommandModules_0);
            else
                v25[l_Children_1[v41].Name] = "True";
            end;
        end;
    end;
    if not l_StarterPlayerScripts_0:FindFirstChild("ChatScript") then
        local v42 = l_ChatScript_0:Clone();
        v42.Parent = l_StarterPlayerScripts_0;
        v42.Archivable = false;
        l_InsertDefaultModules_1 = l_Players_0:GetPlayers();
        for _, v44 in pairs(l_InsertDefaultModules_1) do
            if v44:FindFirstChildOfClass("PlayerGui") then
                local v45 = l_status_0(script.Parent, "ChatInstallVerifier", v44.PlayerGui);
                local l_StringValue_0 = Instance.new("StringValue");
                l_StringValue_0.Name = "ScriptToVerify";
                l_StringValue_0.Value = "ChatScript";
                l_StringValue_0.Parent = v45;
            end;
        end;
    end;
    l_ChatScript_0.Archivable = v26;
    if not l_StarterPlayerScripts_0:FindFirstChild("BubbleChat") then
        local v47 = l_BubbleChat_0:Clone();
        v47.Parent = l_StarterPlayerScripts_0;
        v47.Archivable = false;
        l_InsertDefaultModules_1 = l_Players_0:GetPlayers();
        for _, v49 in pairs(l_InsertDefaultModules_1) do
            if v49:FindFirstChildOfClass("PlayerGui") then
                local v50 = l_status_0(script.Parent, "ChatInstallVerifier", v49.PlayerGui);
                local l_StringValue_1 = Instance.new("StringValue");
                l_StringValue_1.Name = "ScriptToVerify";
                l_StringValue_1.Value = "BubbleChat";
                l_StringValue_1.Parent = v50;
            end;
        end;
    end;
    l_BubbleChat_0.Archivable = v30;
    v5("LoadClientDefaultChatForkedModules", v25);
end;