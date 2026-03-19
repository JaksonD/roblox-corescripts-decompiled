local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_Cryo_0 = v2.Cryo;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v10 = require(script.Parent.ExternalEventConnection);
local v11 = l_Roact_0.PureComponent:extend("Spinner");
v11.defaultProps = {
    Size = UDim2.new(0, 20, 0, 20), 
    spinSpeed = 540
};
v11.validateProps = l_t_0.interface({
    isSpinning = l_t_0.optional(l_t_0.boolean), 
    spinSpeed = l_t_0.optional(l_t_0.number), 
    Size = l_t_0.optional(l_t_0.UDim2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    ImageColor3 = l_t_0.optional(l_t_0.Color3), 
    ImageTransparency = l_t_0.optional(l_t_0.number), 
    forwardRef = l_t_0.optional(l_t_0.table)
});
v11.init = function(v12) --[[ Line: 37 ]] --[[ Name: init ]]
    v12.renderSteppedCallback = function(v13) --[[ Line: 38 ]]
        -- upvalues: v12 (copy)
        local l_isSpinning_0 = v12.props.isSpinning;
        local l_spinSpeed_0 = v12.props.spinSpeed;
        if l_isSpinning_0 and v12.ref.current then
            v12.ref.current.Rotation = v12.ref.current.Rotation + l_spinSpeed_0 * v13;
        end;
    end;
end;
v11.render = function(v16) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_withStyle_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v10 (copy), l_RunService_0 (copy)
    local l_Size_0 = v16.props.Size;
    local l_Position_0 = v16.props.Position;
    local l_AnchorPoint_0 = v16.props.AnchorPoint;
    local l_ImageColor3_0 = v16.props.ImageColor3;
    local l_ImageTransparency_0 = v16.props.ImageTransparency;
    local l_isSpinning_1 = v16.props.isSpinning;
    v16.ref = v16.props.forwardRef or v16.ref or l_Roact_0.createRef();
    return l_withStyle_0(function(v23) --[[ Line: 60 ]]
        -- upvalues: l_Roact_0 (ref), l_ImageSetLabel_0 (ref), l_Size_0 (copy), l_Position_0 (copy), l_AnchorPoint_0 (copy), l_Images_0 (ref), l_ImageColor3_0 (copy), l_ImageTransparency_0 (copy), v16 (copy), l_isSpinning_1 (copy), v10 (ref), l_RunService_0 (ref)
        return l_Roact_0.createElement(l_ImageSetLabel_0, {
            Size = l_Size_0, 
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0, 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/common/refresh"], 
            ImageColor3 = l_ImageColor3_0 or v23.Theme.SystemPrimaryDefault.Color, 
            ImageTransparency = l_ImageTransparency_0 or v23.Theme.SystemPrimaryDefault.Transparency, 
            [l_Roact_0.Ref] = v16.ref
        }, {
            renderStepped = l_isSpinning_1 and l_Roact_0.createElement(v10, {
                event = l_RunService_0.renderStepped, 
                callback = v16.renderSteppedCallback
            })
        });
    end);
end;
return l_Roact_0.forwardRef(function(v24, v25) --[[ Line: 79 ]]
    -- upvalues: l_Roact_0 (copy), v11 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v11, l_Cryo_0.Dictionary.join(v24, {
        forwardRef = v25
    }));
end);