local l_Chat_0 = game:GetService("Chat");
local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Server.ServerUtil);
local v4 = require(l_RobloxGui_0.Modules.Server.SendChatAnalytics);
local function v9(v5, v6) --[[ Line: 11 ]] --[[ Name: LoadScript ]]
    -- upvalues: v3 (copy)
    local v7 = script.Parent:WaitForChild(v5);
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Name = v5;
    if v3.getFFlagServerCoreScriptSourceCode() then
        l_Script_0.Source = v3.getSourceForServerScript(v7);
    else
        l_Script_0.Source = v7.Source;
    end;
    l_Script_0.Parent = v6;
    return l_Script_0;
end;
local function _(v10, v11, v12) --[[ Line: 24 ]] --[[ Name: LoadModule ]]
    -- upvalues: v3 (copy)
    local v13 = v10:WaitForChild(v11);
    local l_ModuleScript_0 = Instance.new("ModuleScript");
    l_ModuleScript_0.Name = v11;
    if v3.getFFlagServerCoreScriptSourceCode() then
        l_ModuleScript_0.Source = v3.getSourceForServerScript(v13);
    else
        l_ModuleScript_0.Source = v13.Source;
    end;
    l_ModuleScript_0.Parent = v12;
    return l_ModuleScript_0;
end;
local function _(v16, v17, v18) --[[ Line: 37 ]] --[[ Name: GetBoolValue ]]
    local l_v16_FirstChild_0 = v16:FindFirstChild(v17);
    if l_v16_FirstChild_0 and l_v16_FirstChild_0:IsA("BoolValue") then
        return l_v16_FirstChild_0.Value;
    else
        return v18;
    end;
end;
local function v23(v21) --[[ Line: 47 ]] --[[ Name: makeDefaultLocalizationTable ]]
    local l_LocalizationTable_0 = Instance.new("LocalizationTable");
    l_LocalizationTable_0.Name = "ChatLocalization";
    l_LocalizationTable_0.Archivable = false;
    l_LocalizationTable_0.SourceLocaleId = "en-us";
    l_LocalizationTable_0:SetEntries(require(script.Parent:WaitForChild("DefaultChatLocalization")));
    l_LocalizationTable_0:SetIsExemptFromUGCAnalytics(true);
    l_LocalizationTable_0.Parent = v21;
end;
return function() --[[ Line: 57 ]] --[[ Name: Install ]]
    -- upvalues: l_Chat_0 (copy), v23 (copy), v9 (copy), v3 (copy), l_ServerScriptService_0 (copy), v4 (copy)
    local v24 = {};
    local l_ChatLocalization_0 = l_Chat_0:FindFirstChild("ChatLocalization");
    if l_ChatLocalization_0 then
        if l_ChatLocalization_0:IsA("LocalizationTable") then
            l_ChatLocalization_0:SetIsExemptFromUGCAnalytics(true);
        end;
    else
        v23(l_Chat_0);
    end;
    local v26 = true;
    local l_ChatServiceRunner_0 = l_Chat_0:FindFirstChild("ChatServiceRunner");
    if not l_ChatServiceRunner_0 then
        v26 = false;
        l_ChatServiceRunner_0 = v9("ChatServiceRunner", l_Chat_0);
        local l_Parent_0 = script.Parent;
        local l_l_ChatServiceRunner_0_0 = l_ChatServiceRunner_0;
        local l_ChatService_0 = l_Parent_0:WaitForChild("ChatService");
        local l_ModuleScript_1 = Instance.new("ModuleScript");
        l_ModuleScript_1.Name = "ChatService";
        if v3.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_1.Source = v3.getSourceForServerScript(l_ChatService_0);
        else
            l_ModuleScript_1.Source = l_ChatService_0.Source;
        end;
        l_ModuleScript_1.Parent = l_l_ChatServiceRunner_0_0;
        l_Parent_0 = script.Parent;
        l_l_ChatServiceRunner_0_0 = l_ChatServiceRunner_0;
        l_ChatService_0 = l_Parent_0:WaitForChild("ChatChannel");
        l_ModuleScript_1 = Instance.new("ModuleScript");
        l_ModuleScript_1.Name = "ChatChannel";
        if v3.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_1.Source = v3.getSourceForServerScript(l_ChatService_0);
        else
            l_ModuleScript_1.Source = l_ChatService_0.Source;
        end;
        l_ModuleScript_1.Parent = l_l_ChatServiceRunner_0_0;
        l_Parent_0 = script.Parent;
        l_l_ChatServiceRunner_0_0 = l_ChatServiceRunner_0;
        l_ChatService_0 = l_Parent_0:WaitForChild("Speaker");
        l_ModuleScript_1 = Instance.new("ModuleScript");
        l_ModuleScript_1.Name = "Speaker";
        if v3.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_1.Source = v3.getSourceForServerScript(l_ChatService_0);
        else
            l_ModuleScript_1.Source = l_ChatService_0.Source;
        end;
        l_ModuleScript_1.Parent = l_l_ChatServiceRunner_0_0;
        l_Parent_0 = script.Parent;
        l_l_ChatServiceRunner_0_0 = l_ChatServiceRunner_0;
        l_ChatService_0 = l_Parent_0:WaitForChild("Util");
        l_ModuleScript_1 = Instance.new("ModuleScript");
        l_ModuleScript_1.Name = "Util";
        if v3.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_1.Source = v3.getSourceForServerScript(l_ChatService_0);
        else
            l_ModuleScript_1.Source = l_ChatService_0.Source;
        end;
        l_ModuleScript_1.Parent = l_l_ChatServiceRunner_0_0;
    else
        v24.ChatServiceRunner = "True";
    end;
    local l_ChatModules_0 = l_Chat_0:FindFirstChild("ChatModules");
    if not l_ChatModules_0 then
        l_ChatModules_0 = Instance.new("Folder");
        l_ChatModules_0.Name = "ChatModules";
        l_ChatModules_0.Archivable = false;
        local l_BoolValue_0 = Instance.new("BoolValue");
        l_BoolValue_0.Name = "InsertDefaultModules";
        l_BoolValue_0.Value = true;
        l_BoolValue_0.Parent = l_ChatModules_0;
        l_ChatModules_0.Parent = l_Chat_0;
    end;
    assert(l_ChatModules_0, "");
    local l_InsertDefaultModules_0 = l_ChatModules_0:FindFirstChild("InsertDefaultModules");
    if if l_InsertDefaultModules_0 and l_InsertDefaultModules_0:IsA("BoolValue") then l_InsertDefaultModules_0.Value else false then
        if not l_ChatModules_0:FindFirstChild("Utility") then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "Utility";
            l_Folder_0.Parent = l_ChatModules_0;
        end;
        local l_Children_0 = script.Parent.DefaultChatModules:GetChildren();
        for v37 = 1, #l_Children_0 do
            if l_Children_0.className ~= "Folder" and not l_ChatModules_0:FindFirstChild(l_Children_0[v37].Name) then
                local l_DefaultChatModules_0 = script.Parent.DefaultChatModules;
                local l_Name_0 = l_Children_0[v37].Name;
                local l_l_ChatModules_0_0 = l_ChatModules_0;
                local v41 = l_DefaultChatModules_0:WaitForChild(l_Name_0);
                local l_ModuleScript_2 = Instance.new("ModuleScript");
                l_ModuleScript_2.Name = l_Name_0;
                if v3.getFFlagServerCoreScriptSourceCode() then
                    l_ModuleScript_2.Source = v3.getSourceForServerScript(v41);
                else
                    l_ModuleScript_2.Source = v41.Source;
                end;
                l_ModuleScript_2.Parent = l_l_ChatModules_0_0;
            elseif l_Children_0.className ~= "Folder" then
                v24[l_Children_0[v37].Name] = "True";
            end;
        end;
        for _, v44 in pairs(script.Parent.DefaultChatModules.Utility:GetChildren()) do
            if not l_ChatModules_0.Utility:FindFirstChild(v44.Name) then
                local l_Utility_0 = script.Parent.DefaultChatModules.Utility;
                local l_Name_1 = v44.Name;
                local l_Utility_1 = l_ChatModules_0.Utility;
                local v48 = l_Utility_0:WaitForChild(l_Name_1);
                local l_ModuleScript_3 = Instance.new("ModuleScript");
                l_ModuleScript_3.Name = l_Name_1;
                if v3.getFFlagServerCoreScriptSourceCode() then
                    l_ModuleScript_3.Source = v3.getSourceForServerScript(v48);
                else
                    l_ModuleScript_3.Source = v48.Source;
                end;
                l_ModuleScript_3.Parent = l_Utility_1;
            else
                v24[v44.Name] = "True";
            end;
        end;
    end;
    if not l_ServerScriptService_0:FindFirstChild("ChatServiceRunner") then
        local v50 = l_ChatServiceRunner_0:Clone();
        v50.Archivable = false;
        v50.Parent = l_ServerScriptService_0;
    end;
    l_ChatServiceRunner_0.Archivable = v26;
    v4("LoadServerDefaultChatForkedModules", v24);
end;