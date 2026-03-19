local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local l_FitTextLabel_0 = v3.FitTextLabel;
local v6 = require(l_Parent_1.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_withStyle_0 = v6.Core.Style.withStyle;
local v11 = require(l_Parent_0.Generic.ModelViewport);
local v12 = require(l_Parent_0.Generic.Constants);
local v13 = require(l_Parent_0.Flags.getEnableCondenseRobuxUpsell);
local v14 = l_Images_0["icons/common/robux"];
local v15 = l_Images_0["icons/status/imageunavailable"];
local v16 = require(l_Parent_0.Flags.FFlagPopularFillIconEnabled);
local v17 = require(l_Parent_0.Flags.GetFStringPopularFillIconLocation);
local v18 = if v16 then l_Images_0[v17()] else nil;
local v19 = if v16 then UDim2.new(0, 16, 0, 16) else UDim2.new(0, 0, 0, 0);
local v20 = v2.Component:extend(script.Name);
v20.init = function(v21) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v21.contentRef = v2.createRef();
    v21.state = {
        contentSize = Vector2.new(0, 0)
    };
    v21.changeContentSize = function(v22) --[[ Line: 62 ]]
        -- upvalues: v21 (copy)
        if v21.state.contentSize ~= v22.AbsoluteSize then
            v21:setState({
                contentSize = v22.AbsoluteSize
            });
        end;
    end;
end;
local function v25(v23, v24) --[[ Line: 91 ]] --[[ Name: getPopularityThreshold ]]
    if v24 ~= 1 and v24 ~= 2 then
        return 0;
    elseif v23 <= 2 then
        return 0;
    elseif v23 <= 5 then
        return 1;
    elseif v23 <= 7 then
        if v24 == 1 then
            return 1;
        else
            return 2;
        end;
    elseif v23 <= 9 then
        if v24 == 1 then
            return 2;
        elseif v23 <= 8 then
            return 2;
        else
            return 3;
        end;
    elseif v23 <= 20 then
        if v24 == 1 then
            return 2;
        else
            return 4;
        end;
    elseif v23 <= 50 then
        if v24 == 1 then
            return 3;
        else
            return 5;
        end;
    elseif v23 <= 100 then
        if v24 == 1 then
            return 4;
        else
            return 7;
        end;
    elseif v24 == 1 then
        return 7;
    else
        return 12;
    end;
end;
local function v30(_, v27) --[[ Line: 115 ]] --[[ Name: createItemBadge ]]
    -- upvalues: v16 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v19 (copy), v18 (copy)
    local v28 = nil;
    if v16 and v27.isPopularItem then
        v28 = v2.createElement(l_ImageSetLabel_0, {
            Size = v19, 
            BackgroundTransparency = 1, 
            Image = v18, 
            ImageColor3 = Color3.fromRGB(0, 0, 0), 
            LayoutOrder = 1
        });
    end;
    local v29 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 1)
        }), 
        TextLabel = v2.createElement("TextLabel", {
            Text = v27.badgeText, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 34, 0, 12), 
            AutomaticSize = Enum.AutomaticSize.X, 
            TextColor3 = Color3.fromRGB(25, 27, 29), 
            Font = Enum.Font.BuilderSansBold, 
            TextSize = 12, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 2), 
            PaddingBottom = UDim.new(0, 2)
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(1, 8)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Color = Color3.fromRGB(206, 183, 115), 
            Thickness = 1
        })
    };
    if v28 then
        v29.PopularIcon = v28;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 44, 0, 20), 
        BackgroundColor3 = Color3.fromRGB(239, 215, 109), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = 3, 
        AnchorPoint = Vector2.new(0, 1)
    }, v29);
end;
local function v37(v31, v32, v33, v34, _) --[[ Line: 177 ]] --[[ Name: createItemIconComponent ]]
    -- upvalues: v2 (copy), l_ImageSetLabel_0 (copy), v15 (copy), l_FitFrameVertical_0 (copy)
    local v36 = {
        ItemImage = v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v32, 0, v33), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = v31, 
            ImageTransparency = v31 == v15 and v34.UIDefault.Transparency or 0, 
            ImageColor3 = v31 == v15 and v34.UIDefault.Color or Color3.new(1, 1, 1)
        })
    };
    return v2.createElement(l_FitFrameVertical_0, {
        BackgroundTransparency = 1, 
        width = UDim.new(1, 0), 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        LayoutOrder = 1
    }, v36);
end;
local function v43(v38, v39, v40, v41) --[[ Line: 198 ]] --[[ Name: createItemDetailsComponent ]]
    -- upvalues: v2 (copy), l_FitTextLabel_0 (copy), l_FitFrameVertical_0 (copy), l_ImageSetLabel_0 (copy), v14 (copy), v25 (copy), v30 (copy)
    local v42 = {
        ItemName = v2.createElement(l_FitTextLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            width = l_FitTextLabel_0.Width.FitToText, 
            maximumWidth = v39 * 0.55, 
            Font = v41.Header2.Font, 
            Text = v38.itemName, 
            TextSize = v41.BaseSize * v41.Header2.RelativeSize, 
            TextColor3 = v40.TextEmphasis.Color, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        ItemCostFrame = v2.createElement(l_FitFrameVertical_0, {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            width = UDim.new(0.5, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            contentPadding = UDim.new(0, 2)
        }, {
            RobuxIcon = v2.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 24, 0, 24), 
                ScaleType = Enum.ScaleType.Stretch, 
                Image = v14, 
                ImageColor3 = v40.IconEmphasis.Color, 
                ImageTransparency = v40.IconEmphasis.Transparency
            }), 
            ItemCost = v2.createElement(l_FitTextLabel_0, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                width = l_FitTextLabel_0.Width.FitToText, 
                maximumWidth = v39, 
                Font = v41.Header2.Font, 
                Text = tostring(v38.itemRobuxCost), 
                TextSize = v41.BaseSize * v41.Header2.RelativeSize, 
                TextColor3 = v40.TextEmphasis.Color
            })
        })
    };
    if v38.userVariant and v38.catalogSize and v38.salesRank and v25(v38.catalogSize, v38.userVariant) >= v38.salesRank then
        v42.ItemBadge = v30(v41, v38);
    end;
    return v2.createElement(l_FitFrameVertical_0, {
        LayoutOrder = 2, 
        BackgroundTransparency = 1, 
        width = UDim.new(0.45, 0), 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        contentPadding = UDim.new(0, 5)
    }, v42);
end;
v20.render = function(v44) --[[ Line: 262 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v12 (copy), l_IconSize_0 (copy), v13 (copy), v2 (copy), v11 (copy), v15 (copy), v37 (copy), v43 (copy), l_FitFrameVertical_0 (copy)
    local l_props_0 = v44.props;
    return l_withStyle_0(function(v46) --[[ Line: 265 ]]
        -- upvalues: v12 (ref), l_props_0 (copy), l_IconSize_0 (ref), v13 (ref), v2 (ref), v11 (ref), v15 (ref), v37 (ref), v43 (ref), v44 (copy), l_FitFrameVertical_0 (ref)
        local l_Theme_0 = v46.Theme;
        local l_Font_0 = v46.Font;
        local l_NORMAL_ICON_SIZE_0 = v12.NORMAL_ICON_SIZE;
        if l_props_0.model == nil and l_props_0.itemIcon == nil then
            l_NORMAL_ICON_SIZE_0 = l_IconSize_0.Large;
        end;
        local v50 = if v13() then l_props_0.itemIconWidth or l_NORMAL_ICON_SIZE_0 else l_NORMAL_ICON_SIZE_0;
        local v51 = if v13() then l_props_0.itemIconHeight or l_NORMAL_ICON_SIZE_0 else l_NORMAL_ICON_SIZE_0;
        local v52 = nil;
        if l_props_0.model ~= nil then
            v52 = v2.createElement(v11, {
                model = l_props_0.model, 
                Position = UDim2.fromOffset(5, 5), 
                Size = UDim2.fromOffset(v50, v51)
            });
        else
            local v53 = l_props_0.itemIcon or v15;
            v52 = v37(v53, v50, v51, l_Theme_0, l_props_0);
        end;
        local v54 = v43(l_props_0, v44.state.contentSize.X, l_Theme_0, l_Font_0);
        return v2.createElement(l_FitFrameVertical_0, {
            LayoutOrder = l_props_0.layoutOrder, 
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            contentPadding = UDim.new(0, 6), 
            [v2.Ref] = v44.contentRef, 
            [v2.Change.AbsoluteSize] = v44.changeContentSize
        }, {
            ItemIconFrame = v2.createElement(l_FitFrameVertical_0, {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                width = UDim.new(0.45, 0), 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                margin = {
                    top = 0, 
                    bottom = 0, 
                    left = 0, 
                    right = 20
                }
            }, {
                ItemIcon = v52
            }), 
            ItemDetailsFrame = v54
        });
    end);
end;
return v20;