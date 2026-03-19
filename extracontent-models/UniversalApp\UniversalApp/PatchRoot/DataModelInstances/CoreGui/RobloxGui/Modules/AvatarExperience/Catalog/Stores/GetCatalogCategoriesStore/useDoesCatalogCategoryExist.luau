local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Signals);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local _ = require(script.Parent.createCatalogCategoriesStore);
return function(v5, v6, v7) --[[ Line: 17 ]] --[[ Name: useDoesCatalogCategoryExist ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v12 = v1.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v2 (ref), v5 (copy), v6 (copy), v7 (copy)
        return v2.createComputed(function(v8) --[[ Line: 25 ]]
            -- upvalues: v5 (ref), v6 (ref), v7 (ref)
            local v9 = v5.getCategoriesMap(v8);
            if not v6 then
                return false;
            else
                local v10 = v9[v6];
                if not v10 then
                    return false;
                elseif v7 then
                    local v11 = false;
                    if v10.SubcategoriesMap ~= nil then
                        v11 = v10.SubcategoriesMap[v7] ~= nil;
                    end;
                    return v11;
                else
                    return true;
                end;
            end;
        end);
    end, {
        v6, 
        v7
    });
    return v3.useSignalState(v12);
end;