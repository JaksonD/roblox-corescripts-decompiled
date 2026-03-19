local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local l_useEffectOnce_0 = v4.Hooks.useEffectOnce;
local l_useScreenSize_0 = v5.useScreenSize;
local l_GridView_0 = v6.App.Grid.GridView;
local v10 = require(l_Parent_0.Components.CapturesGallery.GalleryActionContainer);
local v11 = require(l_Parent_0.Components.CapturesGallery.GalleryItem);
local v12 = require(l_Parent_0.Components.Common.ShowMoreButton);
local _ = require(l_Parent_0.Types);
local function _(v14) --[[ Line: 40 ]] --[[ Name: getItemsPerRow ]]
    return (math.clamp(math.floor(v14 / 120), 1, 4));
end;
local function _(v16, v17) --[[ Line: 44 ]] --[[ Name: getGalleryItemSize ]]
    local v18 = math.clamp(math.floor(v17 / 120), 1, 4);
    v17 = v17 - 4 * (v18 - 1);
    local v19 = math.min(v17 / v18, v17);
    local v20 = v19 * v16;
    return Vector2.new(math.floor(v19), (math.floor(v20)));
end;
local function _(v22, v23, v24) --[[ Line: 54 ]] --[[ Name: getItemsPerPage ]]
    if v22 <= 0 then
        return 0;
    else
        local v25 = math.floor(v22 / v24.Y);
        if v22 < v24.Y * v25 + (v25 - 1) * 4 then
            v25 = v25 - 1;
        end;
        return (math.max(v25 * math.clamp(math.floor(v23 / 120), 1, 4), 8));
    end;
end;
local function v29(v27, v28) --[[ Line: 69 ]] --[[ Name: renderGalleryItem ]]
    -- upvalues: v3 (copy), v11 (copy)
    return v3.createElement(v11, {
        capture = v27, 
        captureIndex = v28
    });
end;
return function(v30) --[[ Line: 76 ]]
    -- upvalues: v3 (copy), l_useScreenSize_0 (copy), l_useEffectOnce_0 (copy), v2 (copy), v10 (copy), l_GridView_0 (copy), v29 (copy), v12 (copy)
    local v31, v32 = v3.useState(Vector2.new(0, 0));
    local v33, v34 = v3.useState(0);
    local v35 = l_useScreenSize_0();
    local v36 = v33 < #v30.captures;
    local v37 = false;
    if v31.X > 0 then
        v37 = v31.Y > 0;
    end;
    local v39 = v3.useCallback(function(v38) --[[ Line: 84 ]]
        -- upvalues: v32 (copy)
        v32(v38.AbsoluteSize);
    end, {});
    local v40 = math.clamp(v35.Y / v35.X, 0.42857142857142855, 1);
    local v41 = v31.Y - 12 - 40 - 36;
    local l_X_0 = v31.X;
    local l_v40_0 = v40;
    local l_l_X_0_0 = l_X_0;
    local v45 = math.clamp(math.floor(l_l_X_0_0 / 120), 1, 4);
    l_l_X_0_0 = l_l_X_0_0 - 4 * (v45 - 1);
    local v46 = math.min(l_l_X_0_0 / v45, l_l_X_0_0);
    local v47 = v46 * l_v40_0;
    local v48 = Vector2.new(math.floor(v46), (math.floor(v47)));
    l_l_X_0_0 = l_X_0;
    v45 = v48;
    if v41 <= 0 then
        l_v40_0 = 0;
    else
        v46 = math.floor(v41 / v45.Y);
        if v41 < v45.Y * v46 + (v46 - 1) * 4 then
            v46 = v46 - 1;
        end;
        l_v40_0 = math.max(v46 * math.clamp(math.floor(l_l_X_0_0 / 120), 1, 4), 8);
    end;
    if l_v40_0 < v33 then
        l_X_0 = l_X_0 - 9;
        v45 = v40;
        v46 = l_X_0;
        v47 = math.clamp(math.floor(v46 / 120), 1, 4);
        v46 = v46 - 4 * (v47 - 1);
        local v49 = math.min(v46 / v47, v46);
        local v50 = v49 * v45;
        v48 = Vector2.new(math.floor(v49), (math.floor(v50)));
        v45 = l_X_0;
        v46 = v48;
        if v41 <= 0 then
            l_v40_0 = 0;
        else
            v47 = math.floor(v41 / v46.Y);
            if v41 < v46.Y * v47 + (v47 - 1) * 4 then
                v47 = v47 - 1;
            end;
            l_v40_0 = math.max(v47 * math.clamp(math.floor(v45 / 120), 1, 4), 8);
        end;
    end;
    l_useEffectOnce_0(function() --[[ Line: 106 ]]
        -- upvalues: v34 (copy), l_v40_0 (ref)
        v34(l_v40_0);
    end, l_v40_0 ~= 0);
    v3.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v33 (copy), l_v40_0 (ref), v34 (copy)
        if v33 < l_v40_0 then
            v34(l_v40_0);
        end;
    end, {
        v31
    });
    v45 = v3.useCallback(function() --[[ Line: 116 ]]
        -- upvalues: v34 (copy), v33 (copy), l_v40_0 (ref)
        v34(v33 + l_v40_0);
    end, {
        v33, 
        l_v40_0
    });
    v46 = v3.useMemo(function() --[[ Line: 120 ]]
        -- upvalues: v30 (copy), v33 (copy), v2 (ref)
        local v51 = math.min(#v30.captures, v33);
        return v2.slice(v30.captures, 1, v51);
    end, {
        v30.captures, 
        v33
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v30.LayoutOrder, 
        Size = v30.Size or UDim2.fromScale(1, 1), 
        [v3.Change.AbsoluteSize] = v39
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        GalleryActionContainer = v3.createElement(v10, {
            isDisabled = false, 
            itemCount = #v30.captures, 
            LayoutOrder = 1
        }), 
        ScrollingFrame = v3.createElement("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.fromScale(1, 0), 
            LayoutOrder = 2, 
            ScrollBarThickness = 1, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.new(1, 0, 1, -36)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            GridView = v37 and v3.createElement(l_GridView_0, {
                itemPadding = Vector2.new(4, 4), 
                items = v46, 
                itemSize = v48, 
                LayoutOrder = 1, 
                renderItem = v29
            }), 
            ShowMoreButton = v36 and v3.createElement(v12, {
                LayoutOrder = 2, 
                buttonHeight = 40, 
                onActivated = v45
            })
        })
    });
end;