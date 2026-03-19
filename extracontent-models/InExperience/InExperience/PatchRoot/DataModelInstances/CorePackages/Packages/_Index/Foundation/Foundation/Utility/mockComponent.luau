local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Enums.Theme);
local v3 = require(l_script_FirstAncestor_0.Providers.Foundation);
local _ = require(l_script_FirstAncestor_0.Providers.Preferences.PreferencesProvider);
local v5 = require(l_script_FirstAncestor_0.Components.View);
return function(v6, v7, v8) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), v5 (copy)
    return v1.createElement(v3, {
        theme = v8 or v2.Dark, 
        preferences = v7
    }, {
        Content = v1.createElement(v5, {
            Size = UDim2.fromScale(1, 1)
        }, v6)
    });
end;