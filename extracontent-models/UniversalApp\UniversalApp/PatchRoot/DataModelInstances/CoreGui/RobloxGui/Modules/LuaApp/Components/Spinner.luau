local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v9 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v10 = v4.PureComponent:extend("Spinner");
v10.defaultProps = {
    Size = UDim2.new(0, 20, 0, 20), 
    spinSpeed = 540
};
v10.init = function(v11) --[[ Line: 25 ]] --[[ Name: init ]]
    v11.renderSteppedCallback = function(v12) --[[ Line: 26 ]]
        -- upvalues: v11 (copy)
        local l_isSpinning_0 = v11.props.isSpinning;
        local l_spinSpeed_0 = v11.props.spinSpeed;
        if l_isSpinning_0 and v11.ref.current then
            v11.ref.current.Rotation = v11.ref.current.Rotation + l_spinSpeed_0 * v12;
        end;
    end;
end;
v10.render = function(v15) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_withStyle_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v9 (copy), l_RunService_0 (copy)
    local l_Size_0 = v15.props.Size;
    local l_Position_0 = v15.props.Position;
    local l_AnchorPoint_0 = v15.props.AnchorPoint;
    local l_ImageColor3_0 = v15.props.ImageColor3;
    local l_ImageTransparency_0 = v15.props.ImageTransparency;
    local l_isSpinning_1 = v15.props.isSpinning;
    v15.ref = v15.props.forwardRef or v15.ref or v4.createRef();
    return l_withStyle_0(function(v22) --[[ Line: 48 ]]
        -- upvalues: v4 (ref), l_ImageSetLabel_0 (ref), l_Size_0 (copy), l_Position_0 (copy), l_AnchorPoint_0 (copy), l_Images_0 (ref), l_ImageColor3_0 (copy), l_ImageTransparency_0 (copy), v15 (copy), l_isSpinning_1 (copy), v9 (ref), l_RunService_0 (ref)
        return v4.createElement(l_ImageSetLabel_0, {
            Size = l_Size_0, 
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0, 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/common/refresh"], 
            ImageColor3 = l_ImageColor3_0 or v22.Theme.SystemPrimaryDefault.Color, 
            ImageTransparency = l_ImageTransparency_0 or v22.Theme.SystemPrimaryDefault.Transparency, 
            [v4.Ref] = v15.ref
        }, {
            renderStepped = l_isSpinning_1 and v4.createElement(v9, {
                event = l_RunService_0.renderStepped, 
                callback = v15.renderSteppedCallback
            })
        });
    end);
end;
return v4.forwardRef(function(v23, v24) --[[ Line: 67 ]]
    -- upvalues: v4 (copy), v10 (copy), v3 (copy)
    return v4.createElement(v10, v3.Dictionary.join(v23, {
        forwardRef = v24
    }));
end);