local l_Parent_0 = script.Parent.Parent;
local l_Types_0 = l_Parent_0.Types;
local v2 = require(l_Parent_0.Reducers.isPhoneVerified);
local v3 = require(l_Parent_0.Reducers.userSettings);
local v4 = require(l_Parent_0.Reducers.userSettingsMetadata);
local _ = require(l_Types_0.ReducerTypes);
local v6 = {
    isPhoneVerified = false, 
    userSettings = {}, 
    userSettingsMetadata = {}
};
return function(v7) --[[ Line: 15 ]]
    -- upvalues: v6 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v8, v9) --[[ Line: 16 ]]
        -- upvalues: v6 (ref), v2 (ref), v7 (copy), v3 (ref), v4 (ref)
        local v10 = v8 or v6;
        local v11 = v2(v7);
        local v12 = v3(v7);
        local v13 = v4(v7);
        return {
            isPhoneVerified = v11(v10.isPhoneVerified, v9), 
            userSettings = v12(v10.userSettings, v9), 
            userSettingsMetadata = v13(v10.userSettingsMetadata, v9)
        };
    end;
end;