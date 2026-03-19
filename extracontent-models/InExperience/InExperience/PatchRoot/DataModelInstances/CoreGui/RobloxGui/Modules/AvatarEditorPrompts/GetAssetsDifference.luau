local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Packages.Promise);
local v3 = require(script.Parent.GetCurrentHumanoidDescription);
local v4 = require(script.Parent.GetAssetIdsFromDescription);
local v5 = require(script.Parent.GetAssetNamesForIds);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v5 (copy)
    local function v13(v7, v8) --[[ Line: 11 ]] --[[ Name: getAddedAndRemovedIds ]]
        -- upvalues: v1 (ref)
        local v9 = v1.List.toSet(v7);
        local v10 = v1.List.toSet(v8);
        return v1.List.filter(v8, function(v11) --[[ Line: 15 ]]
            -- upvalues: v9 (copy)
            return v9[v11] == nil;
        end), (v1.List.filter(v7, function(v12) --[[ Line: 19 ]]
            -- upvalues: v10 (copy)
            return v10[v12] == nil;
        end));
    end;
    return v3():andThen(function(v14) --[[ Line: 26 ]]
        -- upvalues: v4 (ref), v6 (copy), v13 (copy), v1 (ref), v5 (ref)
        local v15 = v4(v14);
        local v16 = v4(v6);
        local v17, v18 = v13(v15, v16);
        local v19 = v1.List.join(v17, v18);
        return v5(v19):andThen(function(v20) --[[ Line: 33 ]]
            -- upvalues: v17 (copy), v18 (copy)
            local v21 = {};
            for _, v23 in ipairs(v17) do
                table.insert(v21, v20[v23]);
            end;
            local v24 = {};
            for _, v26 in ipairs(v18) do
                table.insert(v24, v20[v26]);
            end;
            return {
                addedNames = v21, 
                removedNames = v24, 
                addedAssetIds = v17, 
                removedAssetIds = v18
            };
        end);
    end);
end;