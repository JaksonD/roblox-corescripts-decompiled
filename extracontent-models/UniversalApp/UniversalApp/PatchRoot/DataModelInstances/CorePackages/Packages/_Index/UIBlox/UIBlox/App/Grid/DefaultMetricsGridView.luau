local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.GridView);
local function v7(v6) --[[ Line: 15 ]] --[[ Name: validateWindowHeight ]]
    if v6.windowHeight ~= nil and v6.windowHeight > v6.maxHeight then
        return false, ("windowHeight must be less than or equal to maxHeight\nmaxHeight: %f\nwindowHeight: %f"):format(v6.maxHeight, v6.windowHeight);
    else
        return true;
    end;
end;
local v8 = v2.PureComponent:extend("DefaultMetricsGridView");
v8.validateProps = v4.strictInterface({
    getItemHeight = v4.callback, 
    getItemMetrics = v4.callback, 
    windowHeight = v4.optional(v4.numberMin(0)), 
    renderItem = v4.callback, 
    itemPadding = v4.Vector2, 
    items = v4.table, 
    maxHeight = v4.numberMin(0), 
    LayoutOrder = v4.optional(v4.integer), 
    onNumItemsPerRowChanged = v4.optional(v4.callback), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    frameRef = v4.optional(v4.table), 
    restorePreviousChildFocus = v4.optional(v4.boolean), 
    onFocusGained = v4.optional(v4.callback), 
    defaultChildIndex = v4.optional(v4.numberMin(1)), 
    isRoactGamepadEnabled = v4.optional(v4.boolean)
});
v8.defaultProps = {
    maxHeight = 1e999, 
    isRoactGamepadEnabled = true
};
v8.init = function(v9) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v9.isMounted = false;
    v9.state = {
        containerWidth = 0
    };
    v9.initialSizeCheckerRef = v2.createRef();
end;
v8.render = function(v10) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v2 (copy), v5 (copy)
    assert(v7(v10.props));
    local v11 = v10.props.getItemMetrics(v10.state.containerWidth, v10.props.itemPadding.X);
    local v12 = v10.props.getItemHeight(v11.itemWidth);
    local v13 = Vector2.new(math.max(0, v11.itemWidth), (math.max(0, v12)));
    return v2.createElement(v5, {
        renderItem = v10.props.renderItem, 
        windowHeight = v10.props.windowHeight, 
        maxHeight = v10.props.maxHeight, 
        itemSize = v13, 
        itemPadding = v10.props.itemPadding, 
        items = v10.props.items, 
        LayoutOrder = v10.props.LayoutOrder, 
        onNumItemsPerRowChanged = v10.props.onNumItemsPerRowChanged, 
        NextSelectionLeft = v10.props.NextSelectionLeft, 
        NextSelectionRight = v10.props.NextSelectionRight, 
        NextSelectionUp = v10.props.NextSelectionUp, 
        NextSelectionDown = v10.props.NextSelectionDown, 
        [v2.Ref] = v10.props.frameRef, 
        defaultChildIndex = if v10.props.isRoactGamepadEnabled then v10.props.defaultChildIndex else nil, 
        restorePreviousChildFocus = if v10.props.isRoactGamepadEnabled then v10.props.restorePreviousChildFocus else nil, 
        onFocusGained = if v10.props.isRoactGamepadEnabled then v10.props.onFocusGained else nil, 
        isRoactGamepadEnabled = v10.props.isRoactGamepadEnabled, 
        onWidthChanged = function(v14) --[[ Line: 117 ]] --[[ Name: onWidthChanged ]]
            -- upvalues: v10 (copy)
            if v10.isMounted then
                v10:setState({
                    containerWidth = v14
                });
            end;
        end
    });
end;
v8.didMount = function(v15) --[[ Line: 127 ]] --[[ Name: didMount ]]
    v15.isMounted = true;
end;
v8.willUnmount = function(v16) --[[ Line: 131 ]] --[[ Name: willUnmount ]]
    v16.isMounted = false;
end;
return v2.forwardRef(function(v17, v18) --[[ Line: 135 ]]
    -- upvalues: v2 (copy), v8 (copy), v3 (copy)
    return v2.createElement(v8, v3.Dictionary.join(v17, {
        frameRef = v18
    }));
end);