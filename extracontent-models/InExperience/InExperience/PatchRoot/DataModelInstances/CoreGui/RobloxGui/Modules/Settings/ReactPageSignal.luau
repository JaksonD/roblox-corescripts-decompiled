local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Signals);
local _ = require(script.Parent.EnumReactPage);
return v1.createComputed(function() --[[ Line: 11 ]] --[[ Name: ReactPageSignal ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.createSignal(nil);
    return {
        currentReactPage = v3, 
        setCurrentReactPage = v4
    };
end);