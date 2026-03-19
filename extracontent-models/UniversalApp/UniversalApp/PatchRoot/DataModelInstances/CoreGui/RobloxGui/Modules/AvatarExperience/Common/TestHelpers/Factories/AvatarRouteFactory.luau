local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v6 = {
    makeMockRouteInfo = function(v2) --[[ Line: 12 ]] --[[ Name: makeMockRouteInfo ]]
        return {
            name = v2, 
            key = v2, 
            params = {}
        };
    end, 
    makeMockRoute = function(v3, v4, v5) --[[ Line: 21 ]]
        return {
            current = v4, 
            previousPages = v5, 
            opaque = v3, 
            isVisible = true, 
            isOverlayVisible = false
        };
    end
};
v6.makeMockRouteSimplified = function(v7) --[[ Line: 44 ]]
    -- upvalues: v6 (copy)
    local v8 = v6.makeMockRouteInfo(v7);
    return {
        current = v8, 
        previousPages = {
            v8
        }, 
        opaque = v8, 
        isVisible = true, 
        isOverlayVisible = false
    };
end;
return v6;