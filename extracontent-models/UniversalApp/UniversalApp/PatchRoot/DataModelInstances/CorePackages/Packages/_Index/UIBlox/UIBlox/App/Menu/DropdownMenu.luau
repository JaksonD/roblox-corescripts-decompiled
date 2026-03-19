local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_0.App.ImageSet.Images);
local v6 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v7 = require(l_Parent_0.App.Menu.DropdownMenuList);
local v8 = require(l_Parent_0.App.Menu.DropdownMenuCell);
local v9 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v10 = require(l_Parent_0.Utility.bind);
local v11 = require(l_Parent_0.Core.Style.useStyle);
local v12 = require(script.Parent.StyleDefaults);
local function _(v13) --[[ Line: 27 ]] --[[ Name: getCellDataKey ]]
    if v13.key ~= nil then
        return v13.key;
    else
        return v13.text;
    end;
end;
local v15 = v2.Component:extend("DropdownMenu");
v15.validateProps = v3.strictInterface({
    placeholder = v3.string, 
    onChange = v3.callback, 
    height = v3.optional(v3.UDim), 
    screenSize = v3.Vector2, 
    showDropShadow = v3.optional(v3.boolean), 
    fixedListHeight = v3.optional(v3.number), 
    errorState = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    onMenuOpenChange = v3.optional(v3.callback), 
    menuListBackground = v3.optional(v9), 
    cellDatas = v3.array(v3.strictInterface({
        icon = v3.optional(v3.union(v3.table, v3.string)), 
        text = v3.string, 
        key = v3.optional(v3.string), 
        disabled = v3.optional(v3.boolean), 
        keyCodeLabel = v3.optional(v3.union(v3.enum(Enum.KeyCode), v3.strictInterface({
            key = v3.enum(Enum.KeyCode), 
            axis = v3.optional(v3.string)
        }))), 
        iconColorOverride = v3.optional(v3.Color3), 
        textColorOverride = v3.optional(v3.Color3)
    })), 
    menuStateColors = v3.optional(v3.strictInterface({
        buttonDefault = v3.optional(v9), 
        contentDefault = v3.optional(v9), 
        alert = v3.optional(v9)
    })), 
    enableTokenOverride = v3.optional(v3.boolean), 
    isForcedClosed = v3.optional(v3.boolean), 
    selectionOrder = v3.optional(v3.number), 
    dropdownMenuListPositionFixed = v3.optional(v3.boolean), 
    defaultKey = v3.optional(v3.string)
});
v15.defaultProps = {
    showDropShadow = false, 
    fixedListHeight = nil, 
    enableTokenOverride = false, 
    dropdownMenuListPositionFixed = false, 
    defaultKey = nil
};
v15.didUpdate = function(v16, _, v18) --[[ Line: 129 ]] --[[ Name: didUpdate ]]
    if v16.props.onMenuOpenChange and v16.state.menuOpen ~= v18.menuOpen then
        v16.props.onMenuOpenChange(v16.state.menuOpen);
    end;
end;
v15.init = function(v19) --[[ Line: 135 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v10 (copy)
    v19:setState({
        menuOpen = false, 
        selectedKey = v19.props.defaultKey, 
        absoluteSize = Vector2.new(0, 0)
    });
    v19.openMenu = function() --[[ Line: 142 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            menuOpen = true
        });
    end;
    v19.closeMenu = function() --[[ Line: 148 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            menuOpen = false
        });
    end;
    v19.onSelect = function(v20) --[[ Line: 154 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            menuOpen = false, 
            selectedKey = v20
        });
        v19.props.onChange(v20);
    end;
    v19.mapCellData = function(v21) --[[ Line: 162 ]]
        -- upvalues: v4 (ref), v10 (ref), v19 (copy)
        local v22 = if v21.key ~= nil then v21.key else v21.text;
        local v23 = v4.Dictionary.join(v21, {
            key = v4.None
        });
        v23.onActivated = v10(v19.onSelect, v22);
        v23.selected = v19.state.selectedKey == v22;
        return v23;
    end;
    v19.onResize = function(v24) --[[ Line: 172 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            absoluteSize = v24.AbsoluteSize
        });
    end;
end;
v15.getDerivedStateFromProps = function(v25, v26) --[[ Line: 179 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v2 (copy)
    local v27 = false;
    for _, v29 in v25.cellDatas do
        if (if v29.key ~= nil then v29.key else v29.text) == v26.selectedKey then
            v27 = true;
            break;
        end;
    end;
    if not v27 then
        return {
            selectedKey = v2.None
        };
    else
        return nil;
    end;
end;
v15.render = function(v30) --[[ Line: 197 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v6 (copy), v2 (copy), v8 (copy), v5 (copy), v7 (copy)
    local l_cellDatas_0 = v30.props.cellDatas;
    local v32 = v4.List.map(l_cellDatas_0, v30.mapCellData);
    local l_selectionOrder_0 = v30.props.selectionOrder;
    local v35 = v4.List.findWhere(v32, function(v34) --[[ Line: 203 ]]
        return v34.selected;
    end);
    local v36 = if v35 ~= nil then v32[v35].text else v30.props.placeholder;
    local v37 = v30.state.absoluteSize.X > 640;
    local v38 = nil;
    local v39 = nil;
    if v30.props.enableTokenOverride then
        local l_buttonDefault_0 = v30.props.menuStateColors.buttonDefault;
        local l_contentDefault_0 = v30.props.menuStateColors.contentDefault;
        if v30.props.errorState then
            l_buttonDefault_0 = v30.props.menuStateColors.alert;
        end;
        v38 = {
            [v6.Default] = l_buttonDefault_0
        };
        v39 = {
            [v6.Default] = l_contentDefault_0
        };
    else
        local v42 = "SecondaryDefault";
        local v43 = "SecondaryOnHover";
        if v30.state.menuOpen then
            v43 = v42;
        end;
        if v30.props.errorState then
            v42 = "Alert";
            v43 = "Alert";
        end;
        v38 = {
            [v6.Default] = v42, 
            [v6.Hover] = v43
        };
        v39 = {
            [v6.Default] = "TextEmphasis"
        };
    end;
    if v30.props.isForcedClosed and v30.state.menuOpen then
        v30:setState({
            menuOpen = false
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(UDim.new(1, 0), v30.props.height), 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v30.onResize, 
        [v2.Ref] = v30.props[v2.Ref]
    }, {
        InnerFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            SpawnButton = v2.createElement(v8, {
                Size = UDim2.fromScale(1, 1), 
                buttonImage = v5["component_assets/circle_17_stroke_1"], 
                buttonStateColorMap = v38, 
                contentStateColorMap = v39, 
                icon = v30.state.menuOpen and v5["truncate_arrows/actions_truncationCollapse"] or v5["truncate_arrows/actions_truncationExpand"], 
                text = v36, 
                isDisabled = v30.props.isDisabled, 
                isLoading = false, 
                isActivated = v30.state.menuOpen, 
                hasContent = v35 ~= nil, 
                userInteractionEnabled = true, 
                onActivated = function() --[[ Line: 276 ]] --[[ Name: onActivated ]]
                    -- upvalues: v30 (copy)
                    if v30.state.menuOpen then
                        v30.closeMenu();
                        return;
                    else
                        v30.openMenu();
                        return;
                    end;
                end, 
                enableTokenOverride = v30.props.enableTokenOverride, 
                SelectionOrder = l_selectionOrder_0
            }), 
            DropdownMenuList = v2.createElement(v7, {
                buttonProps = v32, 
                zIndex = 2, 
                open = v30.state.menuOpen, 
                openPositionY = UDim.new(0, 12), 
                buttonSize = UDim2.fromScale(1, 1), 
                closeBackgroundVisible = false, 
                menuListBackground = v30.props.menuListBackground, 
                screenSize = v30.props.screenSize, 
                showDropShadow = v30.props.showDropShadow, 
                fixedListHeight = v30.props.fixedListHeight, 
                onDismiss = v30.closeMenu, 
                enableTokenOverride = v30.props.enableTokenOverride, 
                selectionOrder = if l_selectionOrder_0 then l_selectionOrder_0 + 1 else nil, 
                menuPositionFixed = v30.props.dropdownMenuListPositionFixed
            }), 
            UISizeConstraint = v37 and v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(300, 1e999)
            }) or nil
        }) or nil
    });
end;
return v2.forwardRef(function(v44, v45) --[[ Line: 311 ]]
    -- upvalues: v11 (copy), v12 (copy), v4 (copy), v2 (copy), v15 (copy)
    local v46 = nil;
    if v44.enableTokenOverride then
        local v47 = v11();
        local v48 = v12.getDropdownMenuDefaultTokens(v47);
        local v49 = v4.Dictionary.join(v48.menuStateColors, v44.menuStateColors or {});
        v46 = v4.Dictionary.join(v44, {
            height = v44.height or v48.height, 
            menuStateColors = v49
        });
    else
        v46 = v44;
    end;
    return v2.createElement(v15, v4.Dictionary.join(v46, {
        [v2.Ref] = v45
    }));
end);