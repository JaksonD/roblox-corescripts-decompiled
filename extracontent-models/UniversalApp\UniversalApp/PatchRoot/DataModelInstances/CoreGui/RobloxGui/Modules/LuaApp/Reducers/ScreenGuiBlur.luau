local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.tutils);
local v5 = require(l_Modules_0.LuaApp.Actions.SetScreenGuiBlur);
return v3.createReducer({
    hasBlur = false, 
    blurDisplayOrder = 0, 
    details = {}
}, {
    [v5.name] = function(v6, v7) --[[ Line: 14 ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v8 = nil;
        v8 = if v7.blur == true then v2.Dictionary.join(v6.details, {
            [v7.source] = v7.displayOrder
        }) else v2.Dictionary.join(v6.details, {
            [v7.source] = v2.None
        });
        local v9 = v4.fieldCount(v8) > 0;
        local v10 = 0;
        for _, v12 in pairs(v8) do
            v10 = math.max(v10, v12);
        end;
        return {
            hasBlur = v9, 
            blurDisplayOrder = v10, 
            details = v8
        };
    end
});