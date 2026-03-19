local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useGetCurrentCategoryNames);
return function() --[[ Line: 16 ]] --[[ Name: useHandleThumbnailsLoaded ]]
    -- upvalues: v2 (copy), l_useDispatch_0 (copy), v6 (copy), v3 (copy), v4 (copy)
    local v7, v8 = v2.useState({});
    local v9 = l_useDispatch_0();
    local v10 = v2.useRef(false);
    local v11 = v6();
    local v17 = v2.useCallback(function(v12, v13) --[[ Line: 26 ]]
        -- upvalues: v10 (copy), v8 (copy)
        if not v12 or not v13 then
            return;
        elseif v10.current then
            return;
        else
            v8(function(v14) --[[ Line: 37 ]]
                -- upvalues: v12 (copy), v13 (copy)
                local v15 = table.clone(v14);
                local v16 = table.clone(v14[v12] or {});
                table.insert(v16, v13);
                v15[v12] = v16;
                return v15;
            end);
            return;
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v10 (copy)
        if v10.current then
            v10.current = false;
        end;
    end, {
        v11
    });
    v2.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v7 (copy), v3 (ref), v9 (copy), v4 (ref), v10 (copy), v8 (copy)
        if next(v7) == nil then
            return;
        else
            local v20 = v3.Dictionary.filter(v7, function(_, v19) --[[ Line: 59 ]]
                return #v19 > 0;
            end);
            if next(v20) ~= nil then
                v9(v4.AppendThumbnails(v20));
                v10.current = true;
                v8({});
            end;
            return;
        end;
    end, {
        v7, 
        v9
    });
    return v17;
end;