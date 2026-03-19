local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_FStringAXBackendDrivenCatalogLayersNames_0 = require(l_Parent_0.AvatarExperienceFlags).FStringAXBackendDrivenCatalogLayersNames;
return function() --[[ Line: 6 ]]
    -- upvalues: l_FStringAXBackendDrivenCatalogLayersNames_0 (copy)
    local v2 = l_FStringAXBackendDrivenCatalogLayersNames_0();
    if not v2 or v2 == "" then
        return nil;
    else
        local v3 = {};
        for _, v5 in (string.split(v2, ",")) do
            local v6 = string.gsub(v5, "^%s*(.-)%s*$", "%1");
            if v6 ~= "" and string.len(v6) <= 200 then
                table.insert(v3, v6);
            end;
        end;
        return #v3 > 0 and v3 or nil;
    end;
end;