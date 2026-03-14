local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.React);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v5 = require(l_Parent_0.Core.Control.InteractableList);
local v6 = require(l_Parent_0.Core.Control.Enum.SelectionMode);
local v7 = require(l_Parent_0.App.SelectionCursor.useCursor);
local v8 = require(script.Parent.IconTab);
local v9 = require(script.Parent.HorizontalContainer);
local _ = require(script.Parent.Types);
local v11 = require(script.Parent.Constants);
local v12 = {
    selection = {
        1
    }, 
    items = {}, 
    padding = {
        left = v11.ICON_TAB_PADDING, 
        right = v11.ICON_TAB_PADDING
    }, 
    itemSpacing = UDim.new(0, v11.ICON_TAB_ITEM_SPACING), 
    itemPadding = {
        left = v11.ICON_TAB_ITEM_PADDING_LEFT, 
        right = v11.ICON_TAB_ITEM_PADDING_RIGHT
    }
};
return function(v13) --[[ Line: 43 ]] --[[ Name: IconTabGroup ]]
    -- upvalues: l_Object_0 (copy), v12 (copy), v7 (copy), v9 (copy), v11 (copy), v3 (copy), v5 (copy), v2 (copy), v8 (copy), v6 (copy)
    local v14 = l_Object_0.assign({}, v12, v13);
    local v15 = v7(UDim.new(0.5, 0), 0);
    return v9({
        size = UDim2.new(0, 0, 0, v11.ICON_TAB_GROUP_HEIGHT), 
        showRoundedBackground = false, 
        automaticSize = Enum.AutomaticSize.X, 
        padding = v14.padding
    }, {
        MainTabList = v3.createElement(v5, {
            size = UDim2.new(0, 0, 1, 0), 
            automaticSize = Enum.AutomaticSize.X, 
            fillDirection = Enum.FillDirection.Horizontal, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            sortOrder = Enum.SortOrder.LayoutOrder, 
            itemList = v14.items, 
            itemSize = UDim2.fromScale(0, 0), 
            renderItem = function(v16, v17, v18) --[[ Line: 60 ]] --[[ Name: renderItem ]]
                -- upvalues: v2 (ref), v14 (copy), v15 (copy), v3 (ref), v8 (ref)
                local v19 = {
                    LayoutOrder = v2.List.find(v14.items, v16), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    SelectionImageObject = v15
                };
                return v3.createElement(v8, {
                    item = v16, 
                    selected = v18, 
                    controlState = v17, 
                    padding = v14.itemPadding
                }), v19;
            end, 
            onSelectionChanged = function(v20) --[[ Line: 75 ]] --[[ Name: onSelectionChanged ]]
                -- upvalues: v14 (copy)
                local v21 = v14.items[v20[1]];
                if v21 ~= nil and v21.onActivated ~= nil then
                    v21.onActivated();
                end;
            end, 
            selection = v14.selection, 
            selectionMode = v6.Single, 
            padding = v14.itemSpacing
        })
    });
end;