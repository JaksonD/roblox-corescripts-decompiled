local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_StateLayerAffordance_0 = v2.Enums.StateLayerAffordance;
local v5 = require(script.Parent.DetailsPageLayoutContext);
return v1.memo(v1.forwardRef(function(v6, v7) --[[ Line: 24 ]] --[[ Name: DetailsPageLayoutActions ]]
    -- upvalues: v1 (copy), v5 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy)
    local v8 = v1.useContext(v5);
    local l_setHasActions_0 = v8.setHasActions;
    local l_setActionBarHeight_0 = v8.setActionBarHeight;
    local l_testId_0 = v8.testId;
    assert(l_setHasActions_0 and l_setActionBarHeight_0 and l_testId_0, "DetailsPageLayout.Actions must be used within DetailsPageLayout.Root");
    v1.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: l_setHasActions_0 (copy), l_setActionBarHeight_0 (copy)
        l_setHasActions_0(true);
        return function() --[[ Line: 37 ]]
            -- upvalues: l_setHasActions_0 (ref), l_setActionBarHeight_0 (ref)
            l_setHasActions_0(false);
            l_setActionBarHeight_0(0);
        end;
    end, {});
    return v1.createElement(l_View_0, {
        tag = "row size-full-0 auto-y bg-surface-0 stroke-muted stroke-standard position-bottom-left anchor-bottom-left align-y-center gap-small align-x-center padding-top-large padding-bottom-medium padding-x-large", 
        onAbsoluteSizeChanged = function(v12) --[[ Line: 45 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: l_setActionBarHeight_0 (copy)
            l_setActionBarHeight_0(v12.AbsoluteSize.Y);
        end, 
        ZIndex = 2, 
        testId = if l_testId_0 then ("%*--actions"):format(l_testId_0) else nil, 
        onActivated = function() --[[ Line: 50 ]] --[[ Name: onActivated ]]

        end, 
        selection = {
            Selectable = false
        }, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }, 
        ref = v7
    }, v6.children);
end));