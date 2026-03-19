local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local v2 = require(script.Parent.Parent.ServerUtil);
local function _() --[[ Line: 11 ]] --[[ Name: HasOldSoundScripts ]]
    -- upvalues: l_ServerScriptService_0 (copy), l_StarterPlayer_0 (copy)
    if l_ServerScriptService_0:FindFirstChild("SoundDispatcher") then
        return true;
    else
        local l_StarterCharacterScripts_0 = l_StarterPlayer_0:FindFirstChildOfClass("StarterCharacterScripts");
        if l_StarterCharacterScripts_0 and l_StarterCharacterScripts_0:FindFirstChild("Sound") then
            return true;
        else
            return false;
        end;
    end;
end;
local function v9(v5, v6) --[[ Line: 24 ]] --[[ Name: LoadScript ]]
    -- upvalues: v2 (copy)
    local v7 = script.Parent:WaitForChild(v5);
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Name = v5;
    if v2.getFFlagServerCoreScriptSourceCode() then
        l_Script_0.Source = v2.getSourceForServerScript(v7);
    else
        l_Script_0.Source = v7.Source;
    end;
    l_Script_0.Parent = v6;
    return l_Script_0;
end;
return function() --[[ Line: 37 ]] --[[ Name: TryInstall ]]
    -- upvalues: l_ServerScriptService_0 (copy), l_StarterPlayer_0 (copy), v9 (copy)
    local v10;
    if l_ServerScriptService_0:FindFirstChild("SoundDispatcher") then
        v10 = true;
    else
        local l_StarterCharacterScripts_1 = l_StarterPlayer_0:FindFirstChildOfClass("StarterCharacterScripts");
        v10 = l_StarterCharacterScripts_1 and l_StarterCharacterScripts_1:FindFirstChild("Sound") and true or false;
    end;
    if not v10 then
        return;
    else
        v10 = true;
        local l_SoundDispatcher_0 = l_ServerScriptService_0:FindFirstChild("SoundDispatcher");
        if not l_SoundDispatcher_0 then
            v10 = false;
            l_SoundDispatcher_0 = v9("SoundDispatcher", l_ServerScriptService_0);
        end;
        if not l_ServerScriptService_0:FindFirstChild("SoundDispatcher") then
            local v13 = l_SoundDispatcher_0:Clone();
            v13.Archivable = false;
            v13.Parent = l_ServerScriptService_0;
        end;
        l_SoundDispatcher_0.Archivable = v10;
        return;
    end;
end;