local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v6 = require(l_Modules_0.LuaApp.ArgCheck);
local v7 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils();
local v8 = v3.PureComponent:extend("TextureScroller");
v8.init = function(v9) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v7 (copy)
    v9.lerpValue = 0;
    v9.imageRef = v3.createRef();
    v9.renderSteppedCallback = function(v10) --[[ Line: 21 ]]
        -- upvalues: v9 (copy), v7 (ref)
        local l_imageScrollCycleTime_0 = v9.props.imageScrollCycleTime;
        local l_imagePositionStart_0 = v9.props.imagePositionStart;
        local l_imagePositionEnd_0 = v9.props.imagePositionEnd;
        local v14 = 0;
        if l_imageScrollCycleTime_0 ~= 0 then
            v14 = v10 / l_imageScrollCycleTime_0;
        end;
        v9.lerpValue = (v9.lerpValue + v14) % 1;
        if not v7 or v9.imageRef.current then
            v9.imageRef.current.Position = l_imagePositionStart_0:lerp(l_imagePositionEnd_0, v9.lerpValue);
        end;
    end;
end;
v8.render = function(v15) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v3 (copy), v5 (copy), v4 (copy), l_RunService_0 (copy)
    v6.isType(v15.props.Image, "string", "self.props.Image");
    v6.isType(v15.props.imageScrollCycleTime, "number", "self.props.imageScrollCycleTime");
    v6.isType(v15.props.imagePositionStart, "UDim2", "self.props.imagePositionStart");
    v6.isType(v15.props.imagePositionEnd, "UDim2", "self.props.imagePositionEnd");
    local l_Size_0 = v15.props.Size;
    local l_Position_0 = v15.props.Position;
    local l_AnchorPoint_0 = v15.props.AnchorPoint;
    local l_LayoutOrder_0 = v15.props.LayoutOrder;
    local l_Image_0 = v15.props.Image;
    local l_imageSize_0 = v15.props.imageSize;
    local l_ImageTransparency_0 = v15.props.ImageTransparency;
    local l_imageAnchorPoint_0 = v15.props.imageAnchorPoint;
    local l_imagePositionStart_1 = v15.props.imagePositionStart;
    return v3.createElement("Frame", {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        v3.createElement(v5, {
            Size = l_imageSize_0, 
            Position = l_imagePositionStart_1, 
            AnchorPoint = l_imageAnchorPoint_0, 
            BackgroundTransparency = 1, 
            Image = l_Image_0, 
            ImageTransparency = l_ImageTransparency_0, 
            [v3.Ref] = v15.imageRef
        }); 
        renderStepped = v3.createElement(v4, {
            event = l_RunService_0.renderStepped, 
            callback = v15.renderSteppedCallback
        })
    });
end;
return v8;