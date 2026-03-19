local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_GetFFlagMigrateRoactUtilsToReactUtils_0 = require(l_Parent_0.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils;
local v2 = require(l_Parent_0.ReactUtils);
if l_GetFFlagMigrateRoactUtilsToReactUtils_0() then
    return v2.useEventConnection;
else
    local v3 = require(l_Parent_0.React);
    local v4 = require(script.Parent.dependencyArray);
    return function(v5, v6) --[[ Line: 17 ]] --[[ Name: useExternalEvent ]]
        -- upvalues: v3 (copy), v4 (copy)
        v3.useEffect(function() --[[ Line: 18 ]]
            -- upvalues: v5 (copy), v6 (copy)
            if v5 == nil then
                return nil;
            else
                local v7 = v5:Connect(v6);
                return function() --[[ Line: 24 ]]
                    -- upvalues: v7 (copy)
                    v7:Disconnect();
                end;
            end;
        end, v4(v5, v6));
    end;
end;