local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Sheet");
local v5 = require(l_script_FirstAncestor_1.SheetContext);
local v6 = require(l_script_FirstAncestor_1.SheetType);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_script_FirstAncestor_0.Utility.Flags);
local v9 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v10 = require(l_script_FirstAncestor_0.Components.View);
return v2.memo(v2.forwardRef(function(v11, v12) --[[ Line: 21 ]] --[[ Name: SheetActions ]]
    -- upvalues: v7 (copy), v2 (copy), v5 (copy), v6 (copy), v10 (copy), v8 (copy), v9 (copy), v3 (copy)
    local v13 = v7();
    local v14 = v2.useContext(v5);
    local l_sheetHeightAvailable_0 = v14.sheetHeightAvailable;
    local l_actionsHeight_0 = v14.actionsHeight;
    local l_setActionsHeight_0 = v14.setActionsHeight;
    local l_hasActionsDivider_0 = v14.hasActionsDivider;
    local l_safeAreaPadding_0 = v14.safeAreaPadding;
    local l_bottomPadding_0 = v14.bottomPadding;
    local l_sheetType_0 = v14.sheetType;
    local l_testId_0 = v14.testId;
    assert(l_sheetHeightAvailable_0 and l_actionsHeight_0 and l_setActionsHeight_0 and l_hasActionsDivider_0 and l_safeAreaPadding_0 and l_bottomPadding_0 and l_testId_0, "SheetActions must be used within a Sheet");
    local l_innerSurface_0 = v14.innerSurface;
    local v24 = l_sheetType_0 == v6.Bottom;
    local v28 = v2.createElement(v10, {
        tag = {
            ["row gap-small size-full-0 auto-y"] = true, 
            ["bg-surface-100"] = v24
        }, 
        padding = {
            top = UDim.new(0, v13.Margin.Small), 
            left = UDim.new(0, v13.Margin.Small), 
            right = UDim.new(0, v13.Margin.Small), 
            bottom = UDim.new(0, l_bottomPadding_0 + v13.Margin.Small)
        }, 
        stroke = {
            Color = v13.Color.Stroke.Default.Color3, 
            Transparency = v13.Color.Stroke.Default.Transparency, 
            Thickness = l_hasActionsDivider_0:map(function(v25) --[[ Line: 62 ]]
                -- upvalues: v13 (copy)
                if v25 then
                    return v13.Stroke.Standard;
                else
                    return 0;
                end;
            end)
        }, 
        onAbsoluteSizeChanged = v24 and function(v26) --[[ Line: 71 ]]
            -- upvalues: l_setActionsHeight_0 (copy), l_bottomPadding_0 (copy)
            l_setActionsHeight_0(v26.AbsoluteSize.Y - l_bottomPadding_0);
        end or nil, 
        ZIndex = 1, 
        testId = ("%*--actions"):format(l_testId_0), 
        Position = if v24 then v2.joinBindings({
            sheetHeightAvailable = l_sheetHeightAvailable_0, 
            actionsHeight = l_actionsHeight_0
        }):map(function(v27) --[[ Line: 81 ]]
            return UDim2.new(0, 0, 1, -math.min(v27.sheetHeightAvailable, v27.actionsHeight));
        end) else nil, 
        LayoutOrder = 3, 
        ref = v12, 
        onActivated = v8.FoundationSheetActionsSinkInput and function() --[[ Line: 91 ]]

        end or nil, 
        selection = if v8.FoundationSheetActionsNotSelectable then {
            Selectable = false
        } else nil, 
        stateLayer = if v8.FoundationSheetActionsSinkInput then {
            affordance = v9.None
        } else nil
    }, v11.children);
    if v24 then
        return l_innerSurface_0 and v3.createPortal(v28, l_innerSurface_0);
    else
        return v28;
    end;
end));