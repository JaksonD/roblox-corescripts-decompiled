local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.Hooks.useChromeWindowItems);
local v5 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.WindowHost);
return function(_) --[[ Line: 13 ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), v3 (copy)
    local v7 = v4();
    local v8 = {};
    for _, v10 in v7 do
        v8["window_" .. v10.integration.id] = v2.createElement(v5, {
            position = v3:windowPosition(v10.integration.id), 
            integration = v10
        });
    end;
    return v8;
end;