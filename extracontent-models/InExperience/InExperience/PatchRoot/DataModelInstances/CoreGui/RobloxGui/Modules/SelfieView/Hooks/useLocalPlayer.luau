local l_Packages_0 = game:GetService("CorePackages").Packages;
local v1 = require(l_Packages_0.React);
local l_Players_0 = game:GetService("Players");
return function() --[[ Line: 8 ]] --[[ Name: useLocalPlayer ]]
    -- upvalues: v1 (copy), l_Players_0 (copy)
    return v1.useMemo(function() --[[ Line: 9 ]]
        -- upvalues: l_Players_0 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        assert(l_LocalPlayer_0 ~= nil);
        return l_LocalPlayer_0;
    end);
end;