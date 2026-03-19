local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_SettingEnum_0 = require(l_Parent_1.SettingsService).SettingEnum;
local v3 = require(l_Parent_1.React);
local l_Fields_0 = l_Parent_0.Fields;
local v5 = require(l_Fields_0.Toggle);
local v6 = require(l_Fields_0.TextButton);
return function(v7) --[[ Line: 19 ]]
    -- upvalues: l_SettingEnum_0 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v8 = {};
    if v7.field_type == l_SettingEnum_0.Toggle then
        return (v3.createElement(v5, v7));
    else
        if v7.field_type == l_SettingEnum_0.TextButton then
            v8 = v3.createElement(v6, v7);
        end;
        return v8;
    end;
end;