local l_CorePackages_0 = game:GetService("CorePackages");
require(l_CorePackages_0.Packages.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Components.UniversalApp);
return function() --[[ Line: 12 ]] --[[ Name: createUniversalApp ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Parent = game:GetService("CoreGui");
    local v6 = v2.createRoot(l_Folder_0);
    v6:render(v1.createElement(v4));
    return function() --[[ Line: 19 ]]
        -- upvalues: v6 (copy)
        v6:unmount();
    end;
end;