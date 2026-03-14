local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.TopBarPageContent);
local v3 = require(script.Parent.TopBarContentFrame);
return function(v4) --[[ Line: 20 ]] --[[ Name: TopBarPageWrapper ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local l_topBarSlot_0 = v4.topBarSlot;
    local v6 = table.clone(v4);
    v6.topBarSlot = nil;
    if l_topBarSlot_0 then
        return v1.createElement(v1.Fragment, nil, {
            TopBar = l_topBarSlot_0, 
            TopBarPageContent = v1.createElement(v2, v6)
        });
    else
        return v1.createElement(v3, v6);
    end;
end;