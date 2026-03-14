local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.Constants);
local v3 = require(l_Parent_0.React);
local l_useLayerCollector_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.useLayerCollector;
return function(v5) --[[ Line: 46 ]] --[[ Name: useScrollFrameHeightCalculation ]]
    -- upvalues: l_useLayerCollector_0 (copy), v3 (copy), v2 (copy)
    local l_absoluteSize_0 = l_useLayerCollector_0().absoluteSize;
    local v7, v8 = v3.useState(v5.initialInnerContentHeight or 0);
    local v10 = v3.useCallback(function(v9) --[[ Line: 50 ]]
        -- upvalues: v8 (copy)
        v8(v9.AbsoluteSize.Y);
    end, {});
    local v11 = v5.scrollFrameHeaderFooterHeight or v2.DIALOG_HEADER_HEIGHT;
    local v12 = math.ceil((math.min(l_absoluteSize_0.Y - v2.UNIBAR_HEIGHT - v11, v7)));
    local v13 = v12 < v7;
    return {
        onInnerContentSizeChanged = v10, 
        scrollFrameContainerHeight = v12, 
        shouldShowScrollBar = v13
    };
end;