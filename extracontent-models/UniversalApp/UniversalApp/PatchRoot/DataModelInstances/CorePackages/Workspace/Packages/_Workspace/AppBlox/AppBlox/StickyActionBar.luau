local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.UIBlox);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Roact);
local l_GetTextSize_0 = require(l_Parent_0.Style).GetTextSize;
local l_ImageSetLabel_0 = v1.Core.ImageSet.ImageSetLabel;
local l_StyledTextLabel_0 = v1.App.Text.StyledTextLabel;
local l_validateImage_0 = v1.Core.ImageSet.Validator.validateImage;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v1.App.ImageSet.getIconSize;
local l_withStyle_0 = v1.Core.Style.withStyle;
local l_ActionBar_0 = v1.App.Button.ActionBar;
local v12 = l_getIconSize_0(l_IconSize_0.Large);
local v13 = v3.PureComponent:extend("StickyActionBar");
v13.validateProps = v2.strictInterface({
    actionBarProps = v2.optional(v2.table), 
    actionBarWidth = v2.optional(v2.number), 
    infoProps = v2.optional(v2.strictInterface({
        title = v2.string, 
        icon = v2.optional(l_validateImage_0), 
        enableInfoAtStart = v2.optional(v2.boolean), 
        infoSectionWidth = v2.optional(v2.integer)
    })), 
    width = v2.optional(v2.integer), 
    layoutOrder = v2.optional(v2.integer)
});
v13.defaultProps = {
    actionBarProps = nil, 
    actionBarWidth = 380, 
    infoProps = nil, 
    layoutOrder = 1, 
    width = nil
};
v13.init = function(v14) --[[ Line: 70 ]] --[[ Name: init ]]
    -- upvalues: l_GetTextSize_0 (copy)
    v14.state = {
        containerWidth = nil
    };
    v14.onContainerSizeChange = function(v15) --[[ Line: 74 ]]
        -- upvalues: v14 (copy)
        v14:setState(function(_, _) --[[ Line: 75 ]]
            -- upvalues: v15 (copy)
            return {
                containerWidth = v15.AbsoluteSize.X
            };
        end);
    end;
    local function _() --[[ Line: 82 ]]
        -- upvalues: v14 (copy)
        return UDim2.fromOffset(v14.props.actionBarWidth, 48);
    end;
    local function _(v19, v20, v21) --[[ Line: 86 ]]
        -- upvalues: v14 (copy)
        if v21 and v21.infoSectionWidth then
            return v21.infoSectionWidth;
        else
            local l_Offset_0 = UDim2.fromOffset(v14.props.actionBarWidth, 48).X.Offset;
            return v20 and v19 - 80 - l_Offset_0 or v19 - 80;
        end;
    end;
    local function v31(v24, v25, v26, v27) --[[ Line: 97 ]]
        -- upvalues: v14 (copy)
        if v27 or not v26 then
            return {
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                left = 24, 
                right = 24
            };
        else
            local v28 = (v24 - v25) / 2;
            local v29 = nil;
            v29 = v24 < 1280 and 24 or 80;
            local l_Offset_1 = UDim2.fromOffset(v14.props.actionBarWidth, 48).X.Offset;
            return {
                left = math.max(l_Offset_1 + v29, v28) - l_Offset_1, 
                right = 24
            };
        end;
    end;
    local function _(v32, v33, v34) --[[ Line: 121 ]]
        -- upvalues: l_GetTextSize_0 (ref)
        local l_BaseSize_0 = v34.Font.BaseSize;
        local v36 = v33.RelativeSize * l_BaseSize_0;
        local v37 = Vector2.new(10000, 10000);
        return l_GetTextSize_0(v32, v36, v33.Font, v37).X;
    end;
    v14.getLayoutConfig = function(v39, v40, v41, v42, v43, v44, v45) --[[ Line: 128 ]]
        -- upvalues: v14 (copy), l_GetTextSize_0 (ref), v31 (copy)
        local v46 = v14.props.infoProps and v14.props.infoProps.enableInfoAtStart and true or false;
        local l_BaseSize_1 = v45.Font.BaseSize;
        local v48 = v44.RelativeSize * l_BaseSize_1;
        local v49 = Vector2.new(10000, 10000);
        local v50 = l_GetTextSize_0(v43, v48, v44.Font, v49).X + v42 + (v42 > 0 and 12 or 0);
        local v51 = {
            layoutOrder = v46 and {
                infoSection = 1, 
                actionBarSection = 2
            } or {
                infoSection = 2, 
                actionBarSection = 1
            }, 
            infoHorizontalAlignment = Enum.HorizontalAlignment.Left
        };
        if v41 and v41.infoSectionWidth then
            l_BaseSize_1 = v41.infoSectionWidth;
        else
            v48 = UDim2.fromOffset(v14.props.actionBarWidth, 48).X.Offset;
            l_BaseSize_1 = v40 and v39 - 80 - v48 or v39 - 80;
        end;
        v51.infoSectionWidth = l_BaseSize_1;
        v51.infoSectionPadding = v31(v39, v50, v40, v46);
        v51.actionBarSectionSize = UDim2.fromOffset(v14.props.actionBarWidth, 48);
        v51.actionBarSectionMarginOverride = {
            left = 0, 
            right = 0, 
            top = 0, 
            bottom = 0
        };
        return v51;
    end;
end;
v13.render = function(v52) --[[ Line: 169 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v12 (copy), v3 (copy), l_ActionBar_0 (copy), l_ImageSetLabel_0 (copy), l_StyledTextLabel_0 (copy)
    local v53 = v52.props.actionBarProps ~= nil;
    local v54 = v52.props.infoProps ~= nil;
    local v55 = v52.props.width or v52.state.containerWidth;
    assert(v53 or v54, "Either actionbar or info should be present!");
    return l_withStyle_0(function(v56) --[[ Line: 174 ]]
        -- upvalues: v54 (copy), v52 (copy), v12 (ref), v55 (copy), v53 (copy), v3 (ref), l_ActionBar_0 (ref), l_ImageSetLabel_0 (ref), l_StyledTextLabel_0 (ref)
        local v57 = v54 and v52.props.infoProps.icon and v12 or 0;
        local v58 = v54 and v52.props.infoProps.title or "";
        local l_Header2_0 = v56.Font.Header2;
        local v60 = v52.getLayoutConfig(v55 or 0, v53, v52.props.infoProps, v57, v58, l_Header2_0, v56);
        return v52:renderHorizontalLayout({
            layoutOrder = v52.props.layoutOrder, 
            size = v52.props.width and UDim2.new(0, v52.props.width, 1, 0) or UDim2.fromScale(1, 1), 
            onContainerSizeChange = v52.onContainerSizeChange, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            padding = {
                left = 56, 
                right = 24
            }
        }, {
            ActionBarSection = v53 and v52:renderHorizontalLayout({
                layoutOrder = v60.layoutOrder.actionBarSection, 
                size = v60.actionBarSectionSize, 
                horizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                ActionBar = v3.createElement(l_ActionBar_0, {
                    button = v52.props.actionBarProps.button, 
                    icons = v52.props.actionBarProps.icons, 
                    marginOverride = v60.actionBarSectionMarginOverride, 
                    enableButtonAtStart = true
                })
            }) or nil, 
            InfoSection = v54 and v55 ~= nil and v52:renderHorizontalLayout({
                layoutOrder = v60.layoutOrder.infoSection, 
                width = v60.infoSectionWidth, 
                horizontalAlignment = v60.infoHorizontalAlignment, 
                padding = v60.infoSectionPadding, 
                internalSpacing = 12
            }, {
                Icon = v52.props.infoProps.icon and v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, v57, 0, v57), 
                    LayoutOrder = 1, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Image = v52.props.infoProps.icon, 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Crop
                }, {
                    RoundCorner = v3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }) or nil, 
                Title = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    size = UDim2.new(0, 0, 0, 48), 
                    automaticSize = Enum.AutomaticSize.X, 
                    text = v58, 
                    fluidSizing = false, 
                    textWrapped = true, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    colorStyle = v56.Theme.TextEmphasis, 
                    fontStyle = l_Header2_0, 
                    textTruncate = Enum.TextTruncate.AtEnd
                })
            })
        });
    end);
end;
v13.renderHorizontalLayout = function(_, v62, v63) --[[ Line: 245 ]] --[[ Name: renderHorizontalLayout ]]
    -- upvalues: v3 (copy)
    return v3.createElement("Frame", {
        Size = v62.size and v62.size or UDim2.new(0, v62.width, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v62.layoutOrder, 
        [v3.Change.AbsoluteSize] = v62.onContainerSizeChange
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v62.horizontalAlignment, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v62.internalSpacing or 0)
        }), 
        Padding = if v62.padding then v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v62.padding.left or 0), 
            PaddingRight = UDim.new(0, v62.padding.right or 0), 
            PaddingTop = UDim.new(0, v62.padding.top or 0), 
            PaddingBottom = UDim.new(0, v62.padding.bottom or 0)
        }) else nil, 
        Elements = v3.createFragment(v63)
    });
end;
return v13;