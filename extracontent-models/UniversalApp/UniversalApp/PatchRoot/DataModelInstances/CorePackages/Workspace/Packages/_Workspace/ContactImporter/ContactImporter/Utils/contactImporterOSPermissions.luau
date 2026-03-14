local v0 = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v0.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS);
return {
    getLastOSPermissionSettings = function(_, v3) --[[ Line: 8 ]] --[[ Name: getLastOSPermissionSettings ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v0 (copy)
        if not l_game_EngineFeature_0 then
            return true;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
                -- upvalues: v3 (copy), v0 (ref)
                return v3:GetItem(v0.LOCAL_STORAGE_KEY_LAST_CONTACTS_OS_PERMISSIONS);
            end);
            if l_status_0 then
                return l_result_0 == "true";
            else
                return false;
            end;
        end;
    end, 
    updateOSPermissionSettings = function(_, v7, v8) --[[ Line: 25 ]] --[[ Name: updateOSPermissionSettings ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v0 (copy)
        if not l_game_EngineFeature_0 then
            return;
        else
            pcall(function() --[[ Line: 30 ]]
                -- upvalues: v7 (copy), v0 (ref), v8 (copy)
                v7:SetItem(v0.LOCAL_STORAGE_KEY_LAST_CONTACTS_OS_PERMISSIONS, (tostring(v8)));
                v7:Flush();
            end);
            return;
        end;
    end
};