local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
return function(v2) --[[ Line: 4 ]] --[[ Name: filterOutPasskeyUpsell ]]
    -- upvalues: v1 (copy)
    if typeof(v2) ~= "table" or #v2 == 0 then
        return v2;
    else
        local v3 = {};
        for v4 = 1, #v2 do
            local v5 = v2[v4];
            if v5 and v1.fromRawValue(v5.promptType) ~= v1.PasskeyUpsell then
                table.insert(v3, v5);
            end;
        end;
        return v3;
    end;
end;