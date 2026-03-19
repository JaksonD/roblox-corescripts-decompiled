local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.Common.Rodux);
local v4 = require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout);
local v5 = require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdatePromptType);
local v6 = {
    isGeneric = nil, 
    promptType = nil, 
    metadata = nil, 
    lastUpdatedPromptTypeAt = nil, 
    accountPinUnlockedUntil = nil
};
return v3.createReducer(v6, {
    [v4.name] = function(v7, v8) --[[ Line: 20 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            accountPinUnlockedUntil = v8.accountPinUnlockedUntil or v2.None
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 26 ]]
        -- upvalues: v2 (copy)
        local v11 = v2.Dictionary.join(v9, {
            isGeneric = v10.isGeneric or v2.None, 
            promptType = v10.promptType or v2.None, 
            metadata = v10.metadata or v2.None
        });
        if v9.promptType ~= v10.promptType then
            v11 = v2.Dictionary.join(v11, {
                lastUpdatedPromptTypeAt = v10.lastUpdatedPromptTypeAt
            });
        end;
        return v11;
    end
});