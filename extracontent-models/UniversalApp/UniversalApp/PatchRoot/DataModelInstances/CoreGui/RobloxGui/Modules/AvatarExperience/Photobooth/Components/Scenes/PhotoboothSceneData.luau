local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXBackgroundSceneManagerRevamp_0 = v1.FFlagAXBackgroundSceneManagerRevamp;
local l_FFlagAXPhotoboothAddTropicalRunway_0 = v1.FFlagAXPhotoboothAddTropicalRunway;
local v4 = {
    [""] = {
        id = "", 
        position = Vector3.new(-2.5, 0, 0, 0), 
        name = "Feature.Avatar.Label.Blocky", 
        order = 1, 
        thumbnail = "rbxassetid://103403748802347", 
        color = Color3.fromRGB(220, 220, 220), 
        asset = "AvatarSceneNew"
    }, 
    blue = {
        id = "blue", 
        name = "Feature.Avatar.Label.AbyssBlueDark", 
        order = 2, 
        color = Color3.fromRGB(15, 48, 157), 
        asset = "rbxasset://models/Photobooth/AbyssBlue.rbxm", 
        thumbnail = "rbxassetid://117588323750072", 
        rotation = CFrame.Angles(0, 4.71238898038469, 0), 
        lighting = {
            Ambient = Color3.fromRGB(131, 131, 131), 
            Brightness = 1, 
            ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
            ColorShift_Top = Color3.fromRGB(0, 0, 0), 
            EnvironmentDiffuseScale = 1, 
            EnvironmentSpecularScale = 1, 
            FogColor = Color3.fromRGB(192, 192, 192), 
            GlobalShadows = true, 
            ClockTime = -0.674, 
            FogEnd = 100000, 
            FogStart = 0, 
            ShadowSoftness = 0.22, 
            GeographicLatitude = 58.812, 
            OutdoorAmbient = Color3.fromRGB(181, 181, 181), 
            TimeOfDay = "00:00:00"
        }
    }, 
    abyssbluelight = {
        id = "abyssbluelight", 
        name = "Feature.Avatar.Label.AbyssBlueLight", 
        order = 3, 
        color = Color3.fromRGB(255, 255, 255), 
        asset = "rbxasset://models/Photobooth/AbyssBlueLight.rbxm", 
        thumbnail = "rbxassetid://76040566043616", 
        rotation = CFrame.Angles(0, 4.71238898038469, 0), 
        lighting = {
            Ambient = Color3.fromRGB(131, 131, 131), 
            Brightness = 1, 
            ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
            ColorShift_Top = Color3.fromRGB(0, 0, 0), 
            EnvironmentDiffuseScale = 1, 
            EnvironmentSpecularScale = 1, 
            FogColor = Color3.fromRGB(192, 192, 192), 
            GlobalShadows = true, 
            ClockTime = -0.674, 
            FogEnd = 100000, 
            FogStart = 0, 
            ShadowSoftness = 0.22, 
            GeographicLatitude = 58.812, 
            OutdoorAmbient = Color3.fromRGB(181, 181, 181), 
            TimeOfDay = "00:00:00"
        }
    }
};
if l_FFlagAXBackgroundSceneManagerRevamp_0 then
    v4 = {
        [""] = {
            id = "", 
            position = Vector3.new(0, 0, 0, 0), 
            name = "Feature.Avatar.Label.Blocky", 
            order = 1, 
            thumbnail = "rbxassetid://111539366244714", 
            color = Color3.fromRGB(220, 220, 220)
        }, 
        abyssblue = {
            id = "abyssblue", 
            name = "Feature.Avatar.Label.AbyssBlue", 
            order = 2, 
            color = Color3.fromRGB(15, 48, 157), 
            asset = "rbxasset://models/Photobooth/AbyssBlueLight.rbxm", 
            thumbnail = "rbxassetid://70757611690112", 
            rotation = CFrame.Angles(0, 4.71238898038469, 0), 
            position = Vector3.new(0, 0, 0, 0), 
            dark = {
                asset = "rbxasset://models/Photobooth/AbyssBlue.rbxm", 
                thumbnail = "rbxassetid://123948685752107", 
                rotation = CFrame.Angles(0, 4.71238898038469, 0)
            }
        }
    };
end;
if l_FFlagAXBackgroundSceneManagerRevamp_0 and l_FFlagAXPhotoboothAddTropicalRunway_0 then
    v4.tropicalrunway = {
        id = "tropicalrunway", 
        name = "Feature.Avatar.Label.TropicalRunway", 
        color = Color3.fromRGB(255, 210, 28), 
        order = 3, 
        asset = "rbxassetid://111374395460751", 
        thumbnail = "rbxassetid://88076582911570", 
        remote = true, 
        position = Vector3.new(0, 0, 0, 0), 
        dark = {
            remote = true, 
            thumbnail = "rbxassetid://92691362580817", 
            asset = "rbxassetid://75079908802972"
        }
    };
end;
return {
    PHOTOBOOTH_SCENES = v4
};