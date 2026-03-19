local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.TooltipContext);
local _ = require(script.Parent.TooltipProvider);
useIsTooltipTurn = function(v4) --[[ Line: 9 ]] --[[ Name: useIsTooltipTurn ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1.useContext(v2);
    return v5 and v5.isCurrentTooltip(v4);
end;
return useIsTooltipTurn;