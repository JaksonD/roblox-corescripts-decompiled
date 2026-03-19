local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.RoduxSquads);
return function() --[[ Line: 8 ]]
    -- upvalues: l_AppStorageService_0 (copy), v2 (copy), v3 (copy)
    l_AppStorageService_0:SetItem(v2.ACTIVE_SQUAD_APP_STORAGE_KEY, "");
    l_AppStorageService_0:Flush();
    v3.PersistManagers.currentSquadPersistManager.reset();
end;