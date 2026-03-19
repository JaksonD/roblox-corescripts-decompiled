local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AppBlox);
return function(v3, v4) --[[ Line: 11 ]] --[[ Name: useVisibleMediaGalleryItems ]]
    -- upvalues: v1 (copy)
    return (v1.useMemo(function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v3 (copy)
        local v5 = {};
        for v6 = 1, 3 do
            local v7 = v4 + v6 - 1 - 1;
            if v7 >= 1 and #v3 >= v7 then
                table.insert(v5, v3[v7]);
            end;
        end;
        return v5;
    end, {
        v3, 
        v4
    }));
end;