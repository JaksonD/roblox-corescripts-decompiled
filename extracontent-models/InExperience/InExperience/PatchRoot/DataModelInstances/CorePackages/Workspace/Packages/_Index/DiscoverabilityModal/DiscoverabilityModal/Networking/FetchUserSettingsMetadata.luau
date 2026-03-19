local l_Parent_0 = script.Parent.Parent;
local l_NetworkingUserSettings_0 = require(l_Parent_0.dependencies).NetworkingUserSettings;
return function() --[[ Line: 5 ]]
    -- upvalues: l_NetworkingUserSettings_0 (copy)
    return function(v2) --[[ Line: 6 ]]
        -- upvalues: l_NetworkingUserSettings_0 (ref)
        v2:dispatch(l_NetworkingUserSettings_0.GetUserSettingsMetadata.API());
    end;
end;