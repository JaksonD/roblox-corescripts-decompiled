local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(script.Parent.KeybindContext);
local v4 = require(l_Parent_0.Configs.BindingConfigs);
return v2.memo(function(v5) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v6, _ = v2.useState(v4.ControlGroups);
    local v8, _ = v2.useState(v4.Controls);
    return v2.createElement(v3.Provider, {
        value = {
            groups = v6, 
            controls = v8
        }
    }, v5.children);
end);