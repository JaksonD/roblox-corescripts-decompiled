local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfileBackground");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v4 = require(l_script_FirstAncestor_0.Components.ProfileBackgroundButton);
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
return function(v6) --[[ Line: 19 ]] --[[ Name: SelectionCarousel ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy), l_View_0 (copy)
    local v7, v8 = v2.useState(v6.currentBackgroundId or v5.BACKGROUND_ASSET_IDS[1]);
    v2.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v6 (copy), v8 (copy)
        if v6.currentBackgroundId then
            v8(v6.currentBackgroundId);
        end;
    end, {
        v6.currentBackgroundId
    });
    local l_BACKGROUND_ASSET_IDS_0 = v5.BACKGROUND_ASSET_IDS;
    local l_buttonsPerRow_0 = v6.buttonsPerRow;
    local l_numRows_0 = v6.numRows;
    local l_buttonSize_0 = v6.buttonSize;
    local v14 = v2.useCallback(function(v13) --[[ Line: 38 ]]
        -- upvalues: v8 (copy), v6 (copy)
        v8(v13);
        task.delay(0.1, function() --[[ Line: 42 ]]
            -- upvalues: v6 (ref), v13 (copy)
            if v6.onBackgroundSelected then
                v6.onBackgroundSelected(v13);
            end;
        end);
    end, {
        v6.onBackgroundSelected
    });
    local function v22(v15, v16, v17) --[[ Line: 49 ]] --[[ Name: renderRow ]]
        -- upvalues: v2 (ref), l_BACKGROUND_ASSET_IDS_0 (copy), v7 (copy), v4 (ref), v14 (copy), l_buttonSize_0 (copy), l_View_0 (ref), l_buttonSize_0 (copy)
        local v18 = {};
        table.insert(v18, v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        }));
        table.insert(v18, v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 0), 
            PaddingRight = UDim.new(0, 0)
        }));
        for v19 = v16, v16 + v17 - 1 do
            local v20 = l_BACKGROUND_ASSET_IDS_0[v19];
            local v21 = v7 == v20;
            table.insert(v18, v2.createElement(v4, {
                LayoutOrder = v19, 
                profileBackgroundId = v20, 
                selected = v21, 
                onActivated = v14, 
                buttonSize = l_buttonSize_0
            }));
        end;
        return v2.createElement(l_View_0, {
            LayoutOrder = v15, 
            Size = UDim2.new(1, -32, 0, l_buttonSize_0)
        }, v18);
    end;
    local v26 = v2.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_numRows_0 (copy), v22 (copy), l_buttonsPerRow_0 (copy)
        local v23 = {};
        table.insert(v23, v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        }));
        table.insert(v23, v2.createElement(l_View_0, {
            LayoutOrder = 0, 
            Size = UDim2.new(1, 0, 0, 0)
        }));
        local v24 = 1;
        for v25 = 1, l_numRows_0 do
            table.insert(v23, v22(v25, v24, l_buttonsPerRow_0));
            v24 = v24 + l_buttonsPerRow_0;
        end;
        return v23;
    end, {
        v7
    });
    return v2.createElement(l_View_0, {
        tag = "bg-surface-0", 
        Size = UDim2.new(1, 0, 0, v6.height)
    }, v26);
end;