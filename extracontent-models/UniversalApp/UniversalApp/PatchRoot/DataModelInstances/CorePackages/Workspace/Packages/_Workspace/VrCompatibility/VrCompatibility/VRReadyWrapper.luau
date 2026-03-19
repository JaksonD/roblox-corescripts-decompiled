local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.SharedFlags);
local l_Panel3D_0 = v3.Core.VR.Panel3D;
local l_useIsFPSAtTarget_0 = require(l_Parent_0.SplashScreenManager).useIsFPSAtTarget;
local v7 = require(script.Parent.RoundedCornersFrame);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_useIsSpatial_0 = require(l_Parent_0.Responsive).useIsSpatial;
local l_GetFFlagEnableVRWrapperTransparency_0 = v4.GetFFlagEnableVRWrapperTransparency;
local l_ROUNDED_CORNER_RADIUS_0 = require(script.Parent.Constants).ROUNDED_CORNER_RADIUS;
return function(v12) --[[ Line: 36 ]]
    -- upvalues: l_useIsFPSAtTarget_0 (copy), l_Object_0 (copy), l_useIsSpatial_0 (copy), v2 (copy), v7 (copy), l_ROUNDED_CORNER_RADIUS_0 (copy), l_GetFFlagEnableVRWrapperTransparency_0 (copy), v1 (copy), l_Panel3D_0 (copy)
    local v13 = l_useIsFPSAtTarget_0();
    local v14 = l_Object_0.assign({}, v12.vrProps, {
        hidden = v12.vrProps.hidden or not v13
    });
    if l_useIsSpatial_0() then
        local v15 = nil;
        v15 = if v14.roundedCornersFrameColor then {
            RoundedFrame = v2.createElement(v7, {
                cornerRadius = l_ROUNDED_CORNER_RADIUS_0 / (384 / (v14.virtualScreenSize.X / v14.partSize.X)), 
                backgroundColor = v14.roundedCornersFrameColor, 
                backgroundTransparency = if l_GetFFlagEnableVRWrapperTransparency_0() then v14.backgroundTransparency or 0 else 0
            }, v12[v2.Children])
        } else v12[v2.Children];
        return v1.createElement(l_Panel3D_0, v14, v15);
    else
        return v1.createElement(v12.component, v12.props, v12[v2.Children]);
    end;
end;