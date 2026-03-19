local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.DisplayType);
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
return require(l_Modules_0.Common.Rodux).makeActionCreator(script.Name, function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v6 = true;
    if v4 ~= nil then
        v6 = v2.isEnumValue(v4) or v3 and typeof(v5) == "table" and v1.isEnumValue(v1.fromRawValue(v5.displayType));
    end;
    assert(v6, "Expected the passed prompt type must either be a valid enum value or nil");
    return {
        isGeneric = v3, 
        promptType = v4, 
        metadata = v5, 
        lastUpdatedPromptTypeAt = DateTime.now()
    };
end);