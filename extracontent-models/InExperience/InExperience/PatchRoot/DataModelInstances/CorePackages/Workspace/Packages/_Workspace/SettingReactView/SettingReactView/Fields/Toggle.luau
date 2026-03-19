local l_Parent_0 = script:FindFirstAncestor("SettingReactView").Parent;
local _ = require(l_Parent_0.SettingsService);
local v2 = require(l_Parent_0.React);
local l_Toggle_0 = require(l_Parent_0.Foundation).Toggle;
return function(v4) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), l_Toggle_0 (copy)
    local v5, v6 = v2.useState(v4.onChanged:get());
    v4.onChanged:connect(function(v7) --[[ Line: 18 ]]
        -- upvalues: v6 (copy)
        v6(v7);
    end);
    local v8 = v2.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v4 (copy), v5 (copy)
        v4.onChanged:set(not v5);
    end, {
        v5
    });
    return v2.createElement(l_Toggle_0, {
        label = "", 
        isDisabled = false, 
        isChecked = v5, 
        onActivated = v8
    });
end;