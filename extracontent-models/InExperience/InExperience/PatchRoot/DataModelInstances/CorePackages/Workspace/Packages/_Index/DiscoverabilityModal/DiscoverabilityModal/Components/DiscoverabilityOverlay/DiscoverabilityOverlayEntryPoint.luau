local l_Parent_0 = script.Parent.Parent.Parent;
local l_React_0 = require(l_Parent_0.dependencies).React;
local v2 = require(l_Parent_0.Components.DiscoverabilityContext.DiscoverabilityContext);
local v3 = require(l_Parent_0.Components.DiscoverabilityOverlay.DiscoverabilityOverlayContainer);
return function(v4) --[[ Line: 10 ]] --[[ Name: DiscoverabilityOverlayEntryPoint ]]
    -- upvalues: l_React_0 (copy), v2 (copy), v3 (copy)
    return l_React_0.createElement(v2(v3), v4);
end;