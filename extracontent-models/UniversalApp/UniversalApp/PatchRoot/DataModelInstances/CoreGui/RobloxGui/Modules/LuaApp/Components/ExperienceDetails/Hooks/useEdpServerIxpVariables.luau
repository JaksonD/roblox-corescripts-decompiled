local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.SignalsReact);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.getEdpServerIxpVariablesStore);
return function() --[[ Line: 16 ]] --[[ Name: useEdpServerIxpVariables ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.useSignalState(v3().getEdpServerIxpVariablesGetter);
end;