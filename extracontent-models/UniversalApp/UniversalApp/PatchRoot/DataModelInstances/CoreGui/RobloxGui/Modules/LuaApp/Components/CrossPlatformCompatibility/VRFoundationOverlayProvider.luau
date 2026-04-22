local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
return function(v5) --[[ Line: 8 ]] --[[ Name: VRFoundationOverlayProvider ]]
    -- upvalues: v2 (copy), l_useIsSpatial_0 (copy), l_CoreGui_0 (copy), v3 (copy)
    local v6, v7 = v2.useState(nil);
    local v8 = l_useIsSpatial_0();
    v2.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v8 (copy), v7 (copy), l_CoreGui_0 (ref)
        if not v8 then
            v7(nil);
            return;
        else
            local v11 = task.spawn(function() --[[ Line: 18 ]]
                -- upvalues: l_CoreGui_0 (ref), v7 (ref)
                local l_LuaAppScreenGui_0 = l_CoreGui_0:WaitForChild("LuaAppScreenGui");
                local v10 = if l_LuaAppScreenGui_0 then l_LuaAppScreenGui_0:WaitForChild("MainAppScreen_SurfaceGui") else nil;
                if v10 and v10:IsA("SurfaceGui") then
                    v7(v10);
                end;
            end);
            return function() --[[ Line: 28 ]]
                -- upvalues: v11 (copy)
                task.cancel(v11);
            end;
        end;
    end, {
        v8
    });
    if v8 then
        return (v2.createElement(v3.OverlayProvider, {
            gui = v6
        }, {
            Children = v2.createElement(v2.Fragment, nil, v5.children)
        }));
    else
        return (v2.createElement(v2.Fragment, nil, v5.children));
    end;
end;