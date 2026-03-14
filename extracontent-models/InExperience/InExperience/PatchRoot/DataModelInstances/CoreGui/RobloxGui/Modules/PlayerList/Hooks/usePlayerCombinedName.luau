local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserProfileStore_0 = require(l_CorePackages_0.Workspace.Packages.UserProfiles).Stores.UserProfileStore;
local v2 = require(l_CorePackages_0.Packages.SignalsReact);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: usePlayerCombinedName ]]
    -- upvalues: l_UserProfileStore_0 (copy), v2 (copy)
    local v5 = l_UserProfileStore_0.get().fetchNamesByUserIds({
        v3
    })(false).data[1];
    return v2.useSignalBinding(v5.names.getInExperienceCombinedName):map(function(v6) --[[ Line: 9 ]]
        -- upvalues: v4 (copy)
        if string.len(v6) == 0 then
            return v4;
        else
            return v6;
        end;
    end);
end;