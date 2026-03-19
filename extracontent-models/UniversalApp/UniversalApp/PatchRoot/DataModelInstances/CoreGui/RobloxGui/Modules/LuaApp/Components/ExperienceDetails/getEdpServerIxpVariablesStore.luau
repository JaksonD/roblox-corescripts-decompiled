local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Signals);
local v2 = nil;
return function() --[[ Line: 34 ]] --[[ Name: getEdpServerIxpVariablesStore ]]
    -- upvalues: v2 (ref), v1 (copy)
    if v2 == nil then
        local v3, v4 = v1.createSignal(nil);
        v2 = {
            getEdpServerIxpVariablesGetter = v3, 
            setEdpServerIxpVariables = v4
        };
    end;
    return v2;
end;