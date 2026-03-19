local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v3 = require(script.Parent.FlyoutNavigationItem);
return function(v4) --[[ Line: 15 ]] --[[ Name: FlyoutNavigationList ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v3 (copy)
    local v5 = l_useTokens_0();
    local v9 = v1.useMemo(function() --[[ Line: 17 ]]
        -- upvalues: v1 (ref), v5 (copy), v4 (copy), v3 (ref)
        local v6 = {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v5.Gap.Small)
            })
        };
        for v7, v8 in ipairs(v4.navigationItems) do
            if v8 and v8.textKey then
                v6[v8.itemType] = v1.createElement(v3, {
                    item = v8, 
                    layoutOrder = v7, 
                    closeDrawer = v4.closeDrawer
                });
            end;
        end;
        return v6;
    end, {
        v4.navigationItems
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v4.layoutOrder
    }, v9);
end;