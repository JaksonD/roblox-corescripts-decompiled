local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v3 = require(l_Actions_0.UpdateHealth);
local v4 = require(l_Actions_0.SetIsDead);
if require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then
    return nil;
else
    local v5 = {
        isDead = false, 
        currentHealth = 100, 
        maxHealth = 100
    };
    return (v1.createReducer(v5, {
        [v3.name] = function(v6, v7) --[[ Line: 25 ]]
            return {
                isDead = v6.isDead, 
                currentHealth = v7.health, 
                maxHealth = v7.maxHealth
            };
        end, 
        [v4.name] = function(v8, v9) --[[ Line: 33 ]]
            return {
                isDead = v9.isDead, 
                currentHealth = v8.currentHealth, 
                maxHealth = v8.maxHealth
            };
        end
    }));
end;