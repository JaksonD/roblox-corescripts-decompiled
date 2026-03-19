local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v5 = require(l_Parent_0.UIBlox.Core.Cell.GenericSelectionCell);
local v6 = v4["component_assets/circle_24_stroke_1"];
local v7 = v4["component_assets/circle_16"];
local v8 = v1.PureComponent:extend("SmallRadioButtonCell");
v8.validateProps = v3.strictInterface({
    id = v3.string, 
    text = v3.optional(v3.string), 
    onActivated = v3.optional(v3.callback), 
    isSelected = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    useDefaultControlState = v3.optional(v3.boolean), 
    layoutOrder = v3.optional(v3.number), 
    controlRef = v3.optional(v3.table), 
    NextSelectionLeft = v3.optional(v3.table), 
    NextSelectionRight = v3.optional(v3.table), 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    SelectionImageObject = v3.optional(v3.table)
});
v8.defaultProps = {
    text = "", 
    isSelected = false
};
v8.init = function(v9) --[[ Line: 59 ]] --[[ Name: init ]]
    v9.onSetValue = function() --[[ Line: 60 ]]
        -- upvalues: v9 (copy)
        v9.props.onActivated(v9.props.id);
    end;
end;
v8.render = function(v10) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v7 (copy)
    assert(v10.validateProps(v10.props));
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 56), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v10.props.layoutOrder
    }, {
        GenericSelectionCell = v1.createElement(v5, {
            isSelected = v10.props.isSelected, 
            isDisabled = v10.props.isDisabled, 
            defaultImage = v6, 
            selectedImage = v7, 
            defaultImageSize = 24, 
            selectedImageSize = 16, 
            text = v10.props.text, 
            onActivated = v10.onSetValue, 
            useDefaultControlState = v10.props.useDefaultControlState, 
            [v1.Ref] = v10.props.controlRef, 
            NextSelectionUp = v10.props.NextSelectionUp, 
            NextSelectionDown = v10.props.NextSelectionDown, 
            NextSelectionLeft = v10.props.NextSelectionLeft, 
            NextSelectionRight = v10.props.NextSelectionRight, 
            SelectionImageObject = v10.props.SelectionImageObject
        })
    });
end;
return v1.forwardRef(function(v11, v12) --[[ Line: 95 ]]
    -- upvalues: v1 (copy), v8 (copy), v2 (copy)
    return v1.createElement(v8, v2.Dictionary.join(v11, {
        controlRef = v12
    }));
end);