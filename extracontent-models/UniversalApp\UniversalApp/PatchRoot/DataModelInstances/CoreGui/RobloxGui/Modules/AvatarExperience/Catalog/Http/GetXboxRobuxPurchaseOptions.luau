local v0 = nil;
pcall(function() --[[ Line: 7 ]]
    -- upvalues: v0 (ref)
    v0 = game:GetService("PlatformService");
end);
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local function _(v3) --[[ Line: 18 ]] --[[ Name: parseRobuxValue ]]
    local v4 = v3 and v3.Name;
    local v5 = string.gsub(v4, ",", "");
    v5 = v5 and string.match(v5, "[0-9]+") or nil;
    return v5 and tonumber(v5) or 1000;
end;
local function v14(v7) --[[ Line: 25 ]] --[[ Name: createAvailableProductsTable ]]
    local v8 = {};
    for _, v10 in v7 do
        local v11 = {};
        local v12 = v10 and v10.Name;
        local v13 = string.gsub(v12, ",", "");
        v13 = v13 and string.match(v13, "[0-9]+") or nil;
        v11.robuxValue = v13 and tonumber(v13) or 1000;
        v11.productId = v10.ProductId;
        table.insert(v8, v11);
    end;
    return v8;
end;
return function() --[[ Line: 39 ]]
    -- upvalues: v2 (copy), v0 (ref), v14 (copy)
    return v2.new(function(v15, v16) --[[ Line: 40 ]]
        -- upvalues: v0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
            -- upvalues: v0 (ref)
            return v0:BeginGetCatalogInfo();
        end);
        if l_status_0 and l_result_0 then
            v15(l_result_0);
            return;
        else
            v16(l_result_0);
            return;
        end;
    end):andThen(function(v19) --[[ Line: 50 ]]
        -- upvalues: v2 (ref), v14 (ref)
        return v2.resolve((v14(v19)));
    end);
end;