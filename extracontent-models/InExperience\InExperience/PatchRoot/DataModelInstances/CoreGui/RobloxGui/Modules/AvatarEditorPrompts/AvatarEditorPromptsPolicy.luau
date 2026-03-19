local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.PolicyProvider);
local v2 = v1.GetPolicyImplementations.MemStorageService("app-policy");
local v3 = v1.withGetPolicyImplementation(v2);
v3.Mapper = function(v4) --[[ Line: 11 ]]
    return {
        getCustomOutfitNames = function() --[[ Line: 13 ]] --[[ Name: getCustomOutfitNames ]]
            -- upvalues: v4 (copy)
            if v4.CustomCostumeNames ~= nil then
                return v4.CustomCostumeNames;
            else
                return true;
            end;
        end
    };
end;
return v3;