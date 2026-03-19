local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.UIBlox);
local l_GuiService_0 = game:GetService("GuiService");
local l_useSelectionCursor_0 = v1.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v1.App.SelectionImage.CursorKind;
local _ = require(script.Parent.Types);
local v6 = require(l_Parent_0.React);
local function v8(v7) --[[ Line: 21 ]] --[[ Name: onSelectionGained ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:Select(v7);
end;
return function(v9) --[[ Line: 25 ]] --[[ Name: DetailsPageRenderItem ]]
    -- upvalues: v6 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v8 (copy)
    local l_item_0 = v9.item;
    local l_safeArea_0 = v9.safeArea;
    local l_itemPadding_0 = v9.itemPadding;
    local v13 = v6.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: l_item_0 (copy)
        return l_item_0.renderComponent();
    end, {
        l_item_0.renderComponent
    });
    local v14, v15 = v6.useBinding(0);
    local v16 = v6.useRef(nil);
    local v22 = v6.useCallback(function(v17) --[[ Line: 37 ]]
        -- upvalues: l_safeArea_0 (copy), l_itemPadding_0 (copy), v15 (copy)
        local l_v17_FirstAncestorOfClass_0 = v17:FindFirstAncestorOfClass("ScrollingFrame");
        if l_v17_FirstAncestorOfClass_0 == nil then
            return nil;
        else
            local v19 = v17.AbsolutePosition.Y - l_v17_FirstAncestorOfClass_0.AbsolutePosition.Y - l_safeArea_0.Y;
            local v20 = -(v17.AbsoluteSize.Y + l_itemPadding_0);
            if v19 < 1 and v20 < v19 + l_safeArea_0.Y + 1 then
                local v21 = v19 / v20;
                v15(v21);
            else
                v15(0);
            end;
            return nil;
        end;
    end, {
        l_safeArea_0, 
        l_itemPadding_0
    });
    local v23 = l_useSelectionCursor_0(l_CursorKind_0.Invisible);
    return v6.createElement("CanvasGroup", {
        key = l_item_0.key, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v16, 
        [v6.Change.AbsolutePosition] = v22, 
        GroupTransparency = v14, 
        BackgroundTransparency = 1, 
        Selectable = l_item_0.useSelectionBumper, 
        SelectionImageObject = v23, 
        [v6.Event.SelectionGained] = v8
    }, {
        Padding = v6.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_safeArea_0.X), 
            PaddingRight = UDim.new(0, l_safeArea_0.X)
        }), 
        View = v13
    });
end;