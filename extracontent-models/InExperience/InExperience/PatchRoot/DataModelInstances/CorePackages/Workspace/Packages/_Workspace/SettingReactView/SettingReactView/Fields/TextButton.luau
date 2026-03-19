local l_Parent_0 = script:FindFirstAncestor("SettingReactView").Parent;
local _ = require(l_Parent_0.SettingsService);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Button_0 = v3.Button;
local l_Enums_0 = v3.Enums;
local l_ButtonVariant_0 = l_Enums_0.ButtonVariant;
local l_ButtonSize_0 = l_Enums_0.ButtonSize;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v9 = nil;
    local _ = nil;
    if v8.text and type(v8.text) == "table" then
        local v11, v12 = v2.useState(v8.text:get());
        v9 = v11;
        v8.text:connect(v12);
    else
        v9 = v8.text;
    end;
    local v13 = not v8.onActivated;
    local v14 = v2.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v8 (copy)
        if v8.onActivated then
            v8.onActivated:signal():fire();
        end;
    end, {
        v8.onActivated
    });
    return v2.createElement(l_Button_0, {
        onActivated = v14, 
        text = v9, 
        isDisabled = v13, 
        variant = l_ButtonVariant_0.Standard, 
        size = l_ButtonSize_0.Medium
    });
end;