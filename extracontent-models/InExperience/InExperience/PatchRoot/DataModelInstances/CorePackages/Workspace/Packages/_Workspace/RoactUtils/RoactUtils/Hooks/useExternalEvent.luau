local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_GetFFlagMigrateRoactUtilsToReactUtils_0 = require(l_Parent_0.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils;
local v2 = require(l_Parent_0.ReactUtils);
if l_GetFFlagMigrateRoactUtilsToReactUtils_0() then
    return v2.useEventConnection;
else
    local v3 = require(l_Parent_0.React);
    local v4 = require(script.Parent.dependencyArray);
    local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
    return function(v6, v7) --[[ Line: 20 ]] --[[ Name: useExternalEvent ]]
        -- upvalues: v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), v4 (copy)
        v3.useEffect(function() --[[ Line: 22 ]]
            -- upvalues: v6 (copy), v7 (copy)
            if v6 == nil then
                return nil;
            else
                local v8 = v6:Connect(v7);
                return function() --[[ Line: 28 ]]
                    -- upvalues: v8 (copy)
                    v8:Disconnect();
                end;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v6, 
            v7
        } else v4(v6, v7));
    end;
end;