local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v5 = require(script.Parent.VRFoundationOverlay);
return function(v6) --[[ Line: 9 ]] --[[ Name: VRFoundationOverlayProvider ]]
    -- upvalues: v2 (copy), l_useIsSpatial_0 (copy), l_CoreGui_0 (copy), v3 (copy), v5 (copy)
    local v7, v8 = v2.useState(nil);
    local v9 = l_useIsSpatial_0();
    local v10, v11 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: l_CoreGui_0 (ref), v11 (copy)
        local v12 = task.spawn(function() --[[ Line: 18 ]]
            -- upvalues: l_CoreGui_0 (ref), v11 (ref)
            l_CoreGui_0:WaitForChild("LuaAppScreenGui"):WaitForChild("MainAppScreen_SurfaceGui");
            v11(true);
        end);
        return function() --[[ Line: 24 ]]
            -- upvalues: v12 (copy)
            task.cancel(v12);
        end;
    end, {});
    if v9 then
        return (v2.createElement(v3.OverlayProvider, {
            gui = v7
        }, {
            Overlay = if v10 then v2.createElement(v5, {
                ref = v8
            }) else nil, 
            Children = v2.createElement(v2.Fragment, nil, v6.children)
        }));
    else
        return (v2.createElement(v2.Fragment, nil, v6.children));
    end;
end;