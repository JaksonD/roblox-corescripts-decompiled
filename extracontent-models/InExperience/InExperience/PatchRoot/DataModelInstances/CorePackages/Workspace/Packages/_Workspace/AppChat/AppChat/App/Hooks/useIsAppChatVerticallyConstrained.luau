local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_useLayerCollector_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.useLayerCollector;
local v2 = game:DefineFastInt("AppChatVerticalConstraintThreshold", 300);
return function() --[[ Line: 10 ]]
    -- upvalues: l_useLayerCollector_0 (copy), v2 (copy)
    return l_useLayerCollector_0().absoluteSize.Y <= v2;
end;