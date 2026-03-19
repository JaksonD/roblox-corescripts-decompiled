local l_CorePackages_0 = game:GetService("CorePackages");
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
return function(v2) --[[ Line: 4 ]] --[[ Name: shouldShowPeekViewShadow ]]
    -- upvalues: l_PeekViewState_0 (copy)
    local v3 = true;
    if v2 ~= l_PeekViewState_0.Hidden then
        v3 = true;
        if v2 ~= l_PeekViewState_0.Closed then
            v3 = v2 == l_PeekViewState_0.SuperBrief;
        end;
    end;
    return not v3;
end;