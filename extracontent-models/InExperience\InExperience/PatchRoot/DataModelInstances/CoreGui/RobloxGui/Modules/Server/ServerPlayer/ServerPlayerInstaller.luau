local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.Server.ServerUtil);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if game:GetService("StarterPlayer"):FindFirstChild("PlayerSettings") == nil then
        local l_ModuleScript_0 = Instance.new("ModuleScript");
        l_ModuleScript_0.Name = "PlayerSettings";
        if v1.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_0.Source = v1.getSourceForServerScript(script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings"));
        else
            l_ModuleScript_0.Source = script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings").Source;
        end;
        l_ModuleScript_0.Parent = game:GetService("StarterPlayer");
        l_ModuleScript_0.Archivable = false;
    end;
end;