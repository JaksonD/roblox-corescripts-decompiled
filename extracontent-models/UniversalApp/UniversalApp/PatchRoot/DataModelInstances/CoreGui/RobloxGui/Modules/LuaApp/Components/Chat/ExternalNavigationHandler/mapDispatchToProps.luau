local l_CorePackages_0 = game:GetService("CorePackages");
local l_CompleteExternalNavigationIntoChat_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.CompleteExternalNavigationIntoChat;
return function(v2) --[[ Line: 4 ]]
    -- upvalues: l_CompleteExternalNavigationIntoChat_0 (copy)
    return {
        completeExternalNavigation = function(v3) --[[ Line: 6 ]] --[[ Name: completeExternalNavigation ]]
            -- upvalues: v2 (copy), l_CompleteExternalNavigationIntoChat_0 (ref)
            v2(l_CompleteExternalNavigationIntoChat_0(v3));
        end
    };
end;