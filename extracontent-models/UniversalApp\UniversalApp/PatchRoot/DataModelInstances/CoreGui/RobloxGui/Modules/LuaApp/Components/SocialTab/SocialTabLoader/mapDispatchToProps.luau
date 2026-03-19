local l_CorePackages_0 = game:GetService("CorePackages");
local l_ReceivedCanShowUserAlias_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Http.RoduxAliases.Actions.ReceivedCanShowUserAlias;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_ReceivedCanShowUserAlias_0 (copy)
    return {
        receivedCanShowUserAlias = function(v3) --[[ Line: 8 ]] --[[ Name: receivedCanShowUserAlias ]]
            -- upvalues: v2 (copy), l_ReceivedCanShowUserAlias_0 (ref)
            v2(l_ReceivedCanShowUserAlias_0(v3));
        end
    };
end;