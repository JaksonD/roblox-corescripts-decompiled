local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.isConnectDropdownEnabled);
local l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatAddConnectUnibarForActiveSquad;
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy), l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
    return v1() and l_GetFFlagAppChatAddConnectUnibarForActiveSquad_0() and l_GetFFlagIsSquadEnabled_0();
end;