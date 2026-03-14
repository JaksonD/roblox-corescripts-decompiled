local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.Types.ReducerTypes);
local v4 = {
    prefillDiscoverabilitySetting = false
};
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_networkingUserSettings_0 = v5.networkingUserSettings;
    return v2.createReducer(v4, {
        [l_networkingUserSettings_0.GetUserSettingsMetadata.Succeeded.name] = function(_, v8) --[[ Line: 14 ]]
            return {
                prefillDiscoverabilitySetting = v8.responseBody and v8.responseBody.prefillDiscoverabilitySetting
            };
        end
    });
end;