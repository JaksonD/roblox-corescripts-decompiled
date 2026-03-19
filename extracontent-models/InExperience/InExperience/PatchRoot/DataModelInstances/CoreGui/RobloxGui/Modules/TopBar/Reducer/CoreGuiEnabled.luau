local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateCoreGuiRodux) then
    return nil;
else
    local l_Actions_0 = l_Parent_0.Actions;
    local v6 = require(l_Actions_0.UpdateCoreGuiEnabled);
    local v7 = require(l_RobloxGui_0.Modules.Flags.FFlagMountCoreGuiBackpack);
    local v8 = nil;
    v8 = if v7 then {
        [Enum.CoreGuiType.PlayerList] = true, 
        [Enum.CoreGuiType.Health] = true, 
        [Enum.CoreGuiType.Chat] = true, 
        [Enum.CoreGuiType.EmotesMenu] = true
    } else {
        [Enum.CoreGuiType.PlayerList] = true, 
        [Enum.CoreGuiType.Health] = true, 
        [Enum.CoreGuiType.Backpack] = true, 
        [Enum.CoreGuiType.Chat] = true, 
        [Enum.CoreGuiType.EmotesMenu] = true
    };
    return (v2.createReducer(v8, {
        [v6.name] = function(v9, v10) --[[ Line: 41 ]]
            -- upvalues: v3 (copy)
            if v10.coreGuiType == Enum.CoreGuiType.All then
                local v11 = {};
                for v12, _ in pairs(v9) do
                    v11[v12] = v10.enabled;
                end;
                return v11;
            else
                return v3.Dictionary.join(v9, {
                    [v10.coreGuiType] = v10.enabled
                });
            end;
        end
    }));
end;