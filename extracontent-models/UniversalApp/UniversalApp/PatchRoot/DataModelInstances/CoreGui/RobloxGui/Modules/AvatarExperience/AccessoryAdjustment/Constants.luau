local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Constants;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType);
local v6 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
local v7 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AxisType);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = {
    XAxisColor = Color3.fromRGB(242, 64, 68), 
    YAxisColor = Color3.fromRGB(11, 151, 88), 
    ZAxisColor = Color3.fromRGB(86, 122, 252), 
    LineDiameter = 0.05, 
    LineThickness = 5
};
v9.LineHandleData = {
    [1] = {
        Color3 = v9.XAxisColor, 
        Orientation = CFrame.Angles(0, 0, 0), 
        LimitKey = "xPosition", 
        Direction = -1, 
        AxisType = v7.X
    }, 
    [2] = {
        Color3 = v9.XAxisColor, 
        Orientation = CFrame.Angles(0, 3.141592653589793, 0), 
        LimitKey = "xPosition", 
        Direction = 1, 
        AxisType = v7.X
    }, 
    [3] = {
        Color3 = v9.YAxisColor, 
        Orientation = CFrame.Angles(0, 0, -1.5707963267948966), 
        LimitKey = "yPosition", 
        Direction = 1, 
        AxisType = v7.Y
    }, 
    [4] = {
        Color3 = v9.YAxisColor, 
        Orientation = CFrame.Angles(0, 0, 1.5707963267948966), 
        LimitKey = "yPosition", 
        Direction = -1, 
        AxisType = v7.Y
    }, 
    [5] = {
        Color3 = v9.ZAxisColor, 
        Orientation = CFrame.Angles(0, 1.5707963267948966, 0), 
        LimitKey = "zPosition", 
        Direction = -1, 
        AxisType = v7.Z
    }, 
    [6] = {
        Color3 = v9.ZAxisColor, 
        Orientation = CFrame.Angles(0, -1.5707963267948966, 0), 
        LimitKey = "zPosition", 
        Direction = 1, 
        AxisType = v7.Z
    }
};
v9.RingData = {
    [1] = {
        Color3 = v9.XAxisColor, 
        Orientation = CFrame.Angles(0, 0, 1.5707963267948966)
    }, 
    [2] = {
        Color3 = v9.YAxisColor, 
        Orientation = CFrame.Angles(0, 0, 0)
    }, 
    [3] = {
        Color3 = v9.ZAxisColor, 
        Orientation = CFrame.Angles(1.5707963267948966, 0, 0)
    }
};
v9.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal);
v9.CameraCategories = {
    [Enum.AccessoryType.Hat] = {
        Name = "Hat", 
        Title = "Hat", 
        CameraFocus = v4.FocusType.Head, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Hat
    }, 
    [Enum.AccessoryType.Face] = {
        Name = "Face", 
        Title = "Face", 
        CameraFocus = v4.FocusType.Face, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Face
    }, 
    [Enum.AccessoryType.Neck] = {
        Name = "Neck", 
        Title = "Neck", 
        CameraFocus = v4.FocusType.Neck, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Neck
    }, 
    [Enum.AccessoryType.Shoulder] = {
        Name = "Shoulder", 
        Title = "Shoulder", 
        CameraFocus = v4.FocusType.Shoulders, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Shoulder
    }, 
    [Enum.AccessoryType.Front] = {
        Name = "Front", 
        Title = "Front", 
        CameraFocus = v4.FocusType.Arms, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Front
    }, 
    [Enum.AccessoryType.Back] = {
        Name = "Back", 
        Title = "Back", 
        CameraFocus = v4.FocusType.Arms, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Back
    }, 
    [Enum.AccessoryType.Waist] = {
        Name = "Waist", 
        Title = "Waist", 
        CameraFocus = v4.FocusType.Waist, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Waist
    }
};
v9.DefaultSliderValues = {
    [v6.PositionX] = 0, 
    [v6.PositionY] = 0, 
    [v6.PositionZ] = 0, 
    [v6.RotationX] = 0, 
    [v6.RotationY] = 0, 
    [v6.RotationZ] = 0, 
    [v6.Scale] = 1
};
v9.AdjustmentSliderTypeToAdjustmentType = {
    [v6.PositionX] = v5.Position, 
    [v6.PositionY] = v5.Position, 
    [v6.PositionZ] = v5.Position, 
    [v6.RotationX] = v5.Rotation, 
    [v6.RotationY] = v5.Rotation, 
    [v6.RotationZ] = v5.Rotation, 
    [v6.Scale] = v5.Scale
};
return v9;