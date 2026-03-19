local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Lighting_0 = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_InsertService_0 = game:GetService("InsertService");
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_LightUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).LightUtility;
local v9 = require(l_CorePackages_0.Packages.Signals);
local v10 = require(l_Modules_0.AvatarExperience.Common.Managers.ParticleEffectManager);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_Modules_0.LuaApp.Flags.GetFIntAvatarEditorParticleEmitterRateOverride);
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagUseUpdatedBackgroundSceneSettingsOnMobile);
local l_FFlagAXPhotoboothFunctionality_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXPhotoboothFunctionality;
local v15 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData);
local l_PhotoboothStoreBridge_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperiencePhotobooth).PhotoboothStoreBridge;
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_BackgroundType_0 = v17.BackgroundType;
local l_ParticleType_0 = v17.ParticleType;
local l_PagePlayParticleType_0 = v17.PagePlayParticleType;
local l_PageBackgroundType_0 = v17.PageBackgroundType;
local v22 = {};
v22.__index = v22;
local v23 = {
    Lighting = if v13 then {
        Brightness = 2, 
        ColorShift_Bottom = Color3.fromRGB(108, 94, 66), 
        ColorShift_Top = Color3.fromRGB(94, 100, 172), 
        ClockTime = 11, 
        FogEnd = 92, 
        GeographicLatitude = 24, 
        OutdoorAmbient = Color3.fromRGB(0, 0, 0), 
        TimeOfDay = "11:00:00"
    } else {
        Brightness = 2, 
        ColorShift_Bottom = Color3.fromRGB(232, 255, 146), 
        ColorShift_Top = Color3.fromRGB(85, 136, 167), 
        OutdoorAmbient = Color3.fromRGB(0, 0, 0), 
        Ambient = Color3.fromRGB(170, 170, 170), 
        ClockTime = 12, 
        GeographicLatitude = 41.733, 
        TimeOfDay = "12:00:00", 
        FogColor = Color3.fromRGB(45, 46, 49), 
        FogEnd = 92, 
        FogStart = 20, 
        Sky = {
            CelestialBodiesShown = true, 
            StarCount = 3000
        }
    }, 
    Bloom = if v13 then {
        Intensity = 0.2, 
        Size = 12, 
        Threshold = 0.95
    } else {
        Intensity = 0.3, 
        Size = 12, 
        Threshold = 0.95
    }, 
    ColorCorrection = {
        Brightness = 0, 
        Contrast = 0, 
        Saturation = 0
    }
};
local v24 = {
    Lighting = {
        Brightness = 1, 
        ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
        ColorShift_Top = Color3.fromRGB(0, 0, 0), 
        OutdoorAmbient = Color3.fromRGB(127, 127, 127), 
        Ambient = Color3.fromRGB(127, 127, 127), 
        ClockTime = 14, 
        GeographicLatitude = 41.733, 
        TimeOfDay = "14:00:00", 
        FogColor = Color3.fromRGB(192, 192, 192), 
        FogEnd = 100000, 
        FogStart = 0, 
        Sky = {
            CelestialBodiesShown = true, 
            StarCount = 3000
        }
    }
};
local v25 = {
    LightTheme = {
        AmbientLightColor = if v13 then Color3.fromRGB(130, 130, 130) else nil, 
        EnvironmentDiffuseScale = v13 and 0.2 or nil, 
        EnvironmentSpecularScale = v13 and 1 or nil, 
        FogStart = v13 and 30 or nil, 
        BackPanelTextureColor = Color3.fromRGB(213, 213, 213), 
        CloudsTextureColor = Color3.fromRGB(222, 222, 222), 
        LargerShapesTextureColor = Color3.fromRGB(222, 222, 222), 
        BasePlateColor = Color3.fromRGB(213, 213, 213), 
        CharacterSpotLightBrightness = 6, 
        FogColor = Color3.fromRGB(213, 213, 213), 
        SkyboxAssetLocation = "rbxasset://textures/AvatarEditorImages/LightPixel.png", 
        ParticleEmitterColorCatalogToAE = ColorSequence.new(Color3.fromRGB(171, 169, 161), Color3.fromRGB(158, 135, 120)), 
        ParticleEmitterColorAEToCatalog = ColorSequence.new(Color3.fromRGB(158, 135, 120), Color3.fromRGB(171, 169, 161))
    }, 
    DarkTheme = {
        AmbientLightColor = if v13 then Color3.fromRGB(180, 180, 180) else nil, 
        EnvironmentDiffuseScale = v13 and 1 or nil, 
        EnvironmentSpecularScale = v13 and 1 or nil, 
        FogStart = v13 and 20 or nil, 
        BackPanelTextureColor = Color3.fromRGB(83, 80, 82), 
        CloudsTextureColor = Color3.fromRGB(100, 101, 108), 
        LargerShapesTextureColor = Color3.fromRGB(100, 101, 108), 
        BasePlateColor = Color3.fromRGB(83, 80, 82), 
        CharacterSpotLightBrightness = 12, 
        FogColor = Color3.fromRGB(55, 56, 59), 
        SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png", 
        ParticleEmitterColorCatalogToAE = ColorSequence.new(Color3.fromRGB(79, 75, 79), Color3.fromRGB(51, 49, 52)), 
        ParticleEmitterColorAEToCatalog = ColorSequence.new(Color3.fromRGB(51, 49, 52), Color3.fromRGB(79, 75, 79))
    }
};
local v26 = {
    LargerShapes = {
        TextureWallTransparency = 1, 
        LargerShapesPosition = Vector3.new(-62.89799880981445, 6.96999979019165, -8.8149995803833, 0), 
        CloudsPosition = Vector3.new(-90, 20, 0, 0), 
        BaseplateTransparency = 0
    }, 
    Walls = {
        TextureWallTransparency = 0, 
        LargerShapesPosition = Vector3.new(-62.89799880981445, -12.300000190734863, -8.8149995803833, 0), 
        CloudsPosition = Vector3.new(-90, 80, 0, 0), 
        BaseplateTransparency = 0
    }, 
    NoShapesNoWalls = {
        TextureWallTransparency = 1, 
        LargerShapesPosition = Vector3.new(-62.89799880981445, -1000, -8.8149995803833, 0), 
        CloudsPosition = Vector3.new(-90, 1000, 0, 0), 
        BaseplateTransparency = 1
    }
};
v22.new = function(v27, v28, v29) --[[ Line: 177 ]] --[[ Name: new ]]
    -- upvalues: v22 (copy), v10 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy), l_FFlagAXPhotoboothFunctionality_0 (copy), l_ParticleType_0 (copy), v26 (copy), l_NotificationService_0 (copy)
    local v30 = {};
    setmetatable(v30, v22);
    v30.connections = {};
    v30.store = v27;
    v30.networking = v28;
    v30.avatarRoute = v29;
    v30.ParticleEffectManager = v10.new(v27, v29);
    v30.colorCorrection = l_Lighting_0:FindFirstChild("ColorCorrection");
    if not v30.colorCorrection then
        v30.colorCorrection = Instance.new("ColorCorrectionEffect");
        v30.colorCorrection.Parent = l_Lighting_0;
    end;
    v30.bloom = l_Lighting_0:FindFirstChild("Bloom");
    if not v30.bloom then
        v30.bloom = Instance.new("BloomEffect");
        v30.bloom.Parent = l_Lighting_0;
    end;
    v30.newBackgroundScene = l_ReplicatedStorage_0:WaitForChild("AvatarSceneNew");
    v30.currentScene = nil;
    if l_FFlagAXPhotoboothFunctionality_0 then
        v30.currentSceneLighting = nil;
    end;
    v30.particleStorage = {
        [l_ParticleType_0.CatalogToAvatarEditor] = {
            largeParticleEmitter = v30.newBackgroundScene.CatalogToAvatarEditorPFX.BIGBOIS, 
            smallParticleEmitter = v30.newBackgroundScene.CatalogToAvatarEditorPFX.SmolBois
        }, 
        [l_ParticleType_0.AvatarEditorToCatalog] = {
            largeParticleEmitter = v30.newBackgroundScene.AvatarEditorToCatalogPFX.BIGBOIS, 
            smallParticleEmitter = v30.newBackgroundScene.AvatarEditorToCatalogPFX.SmolBois
        }
    };
    v30.newBackgroundScene.BackPanel.Transparency = v26.LargerShapes.TextureWallTransparency;
    v30:setupTweening();
    local v31 = l_NotificationService_0.SelectedTheme or nil;
    v30:updateTheme(string.lower(v31));
    return v30;
end;
v22.setupTweening = function(v32) --[[ Line: 228 ]] --[[ Name: setupTweening ]]
    -- upvalues: l_TweenService_0 (copy), v26 (copy)
    local v33 = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0);
    local v34 = TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.In, 0, false, 0);
    local v35 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
    local v36 = {
        Transparency = 0
    };
    local v37 = {
        Transparency = 1
    };
    v32.wallAppearTween = l_TweenService_0:Create(v32.newBackgroundScene.BackPanel.TextureWall, v35, v36);
    v32.wallDisappearTween = l_TweenService_0:Create(v32.newBackgroundScene.BackPanel.TextureWall, v35, v37);
    v32.floorAppearTween = l_TweenService_0:Create(v32.newBackgroundScene.BackPanel.TextureFloor, v35, v36);
    v32.floorDisappearTween = l_TweenService_0:Create(v32.newBackgroundScene.BackPanel.TextureFloor, v35, v37);
    v32.largerShapesAppearTween = l_TweenService_0:Create(v32.newBackgroundScene.LargerShapes, v33, {
        Position = v26.LargerShapes.LargerShapesPosition
    });
    v32.largerShapesDisappearTween = l_TweenService_0:Create(v32.newBackgroundScene.LargerShapes, v34, {
        Position = v26.Walls.LargerShapesPosition
    });
    v32.cloudsAppearTween = l_TweenService_0:Create(v32.newBackgroundScene.Clouds, v33, {
        Position = v26.LargerShapes.CloudsPosition
    });
    v32.cloudsDisappearTween = l_TweenService_0:Create(v32.newBackgroundScene.Clouds, v34, {
        Position = v26.Walls.CloudsPosition
    });
    v32.allTweens = {
        v32.wallAppearTween, 
        v32.wallDisappearTween, 
        v32.floorAppearTween, 
        v32.floorDisappearTween, 
        v32.largerShapesAppearTween, 
        v32.largerShapesDisappearTween, 
        v32.cloudsAppearTween, 
        v32.cloudsDisappearTween
    };
end;
v22.updateTheme = function(v38, v39) --[[ Line: 291 ]] --[[ Name: updateTheme ]]
    -- upvalues: v25 (copy), v13 (copy), l_Lighting_0 (copy), l_ParticleType_0 (copy)
    v38.theme = v39;
    local l_LightTheme_0 = v25.LightTheme;
    if v39 == "dark" then
        l_LightTheme_0 = v25.DarkTheme;
    end;
    for _, v42 in v38.newBackgroundScene.BackPanel:GetChildren() do
        v42.Color3 = l_LightTheme_0.BackPanelTextureColor;
    end;
    for _, v44 in v38.newBackgroundScene.Clouds:GetChildren() do
        v44.Color3 = l_LightTheme_0.CloudsTextureColor;
    end;
    for _, v46 in v38.newBackgroundScene.LargerShapes:GetChildren() do
        v46.Color3 = l_LightTheme_0.LargerShapesTextureColor;
    end;
    v38.newBackgroundScene.Baseplate.Color = l_LightTheme_0.BasePlateColor;
    if v13 then
        if l_LightTheme_0.AmbientLightColor ~= nil then
            l_Lighting_0.Ambient = l_LightTheme_0.AmbientLightColor;
        end;
        if l_LightTheme_0.EnvironmentDiffuseScale ~= nil then
            l_Lighting_0.EnvironmentDiffuseScale = l_LightTheme_0.EnvironmentDiffuseScale;
        end;
        if l_LightTheme_0.EnvironmentSpecularScale ~= nil then
            l_Lighting_0.EnvironmentSpecularScale = l_LightTheme_0.EnvironmentSpecularScale;
        end;
        if l_LightTheme_0.FogStart ~= nil then
            l_Lighting_0.FogStart = l_LightTheme_0.FogStart;
        end;
    else
        v38.newBackgroundScene.CharacterSpotLight.SpotLight.Brightness = l_LightTheme_0.CharacterSpotLightBrightness;
    end;
    l_Lighting_0.FogColor = l_LightTheme_0.FogColor;
    for v47, v48 in v38.particleStorage do
        for _, v50 in v48 do
            v50.Color = if v47 == l_ParticleType_0.AvatarEditorToCatalog then l_LightTheme_0.ParticleEmitterColorAEToCatalog else l_LightTheme_0.ParticleEmitterColorCatalogToAE;
        end;
    end;
end;
v22.setLighting = function(v51, v52) --[[ Line: 342 ]] --[[ Name: setLighting ]]
    -- upvalues: l_Lighting_0 (copy), v13 (copy)
    l_Lighting_0.Brightness = v52.Lighting.Brightness;
    l_Lighting_0.ColorShift_Bottom = v52.Lighting.ColorShift_Bottom;
    l_Lighting_0.ColorShift_Top = v52.Lighting.ColorShift_Top;
    l_Lighting_0.OutdoorAmbient = v52.Lighting.OutdoorAmbient;
    if not v13 then
        l_Lighting_0.Ambient = v52.Lighting.Ambient;
    end;
    l_Lighting_0.ClockTime = v52.Lighting.ClockTime;
    l_Lighting_0.GeographicLatitude = v52.Lighting.GeographicLatitude;
    l_Lighting_0.TimeOfDay = v52.Lighting.TimeOfDay;
    l_Lighting_0.FogEnd = v52.Lighting.FogEnd;
    if not v13 then
        l_Lighting_0.FogStart = v52.Lighting.FogStart;
    end;
    if v13 then
        v51.newBackgroundScene.CharacterSpotLight.SpotLight.Enabled = false;
        v51.newBackgroundScene.CharacterSpotLight_Left.SpotLight.Enabled = true;
        v51.newBackgroundScene.CharacterSpotLight_Right.SpotLight.Enabled = true;
    end;
    if v52.Bloom then
        if v51.bloom then
            v51.bloom.Enabled = true;
            v51.bloom.Intensity = v52.Bloom.Intensity;
            v51.bloom.Size = v52.Bloom.Size;
            v51.bloom.Threshold = v52.Bloom.Threshold;
        end;
    elseif v51.bloom then
        v51.bloom.Enabled = false;
    end;
    if v52.ColorCorrection then
        if v51.colorCorrection then
            v51.colorCorrection.Enabled = true;
            v51.colorCorrection.Brightness = v52.ColorCorrection.Brightness;
            v51.colorCorrection.Contrast = v52.ColorCorrection.Contrast;
            v51.colorCorrection.Saturation = v52.ColorCorrection.Saturation;
            return;
        end;
    elseif v51.colorCorrection then
        v51.colorCorrection.Enabled = false;
    end;
end;
v22.startLighting = function(v53) --[[ Line: 395 ]] --[[ Name: startLighting ]]
    -- upvalues: v23 (copy)
    v53:setLighting(v23);
end;
v22.updateLighting = function(v54, v55) --[[ Line: 399 ]] --[[ Name: updateLighting ]]
    -- upvalues: l_AvatarScreen_0 (copy), v24 (copy), l_LightUtility_0 (copy), v23 (copy)
    if v55 == l_AvatarScreen_0.ProfilePictureEditorFinal then
        v54:setLighting(v24);
        if not game.Workspace:FindFirstChild("ThumbnailLightAnchor_0") then
            local l_CurrentCharacter_0 = v54.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
            if l_CurrentCharacter_0 then
                l_LightUtility_0.AddDefaultPointLightRelativeTo(l_CurrentCharacter_0.HumanoidRootPart.CFrame);
                return;
            end;
        end;
    else
        v54:setLighting(v23);
        local l_ThumbnailLightAnchor_0_0 = game.Workspace:FindFirstChild("ThumbnailLightAnchor_0");
        if l_ThumbnailLightAnchor_0_0 then
            l_ThumbnailLightAnchor_0_0:Destroy();
        end;
    end;
end;
v22.playParticleEmitters = function(v58, v59) --[[ Line: 422 ]] --[[ Name: playParticleEmitters ]]
    -- upvalues: l_PagePlayParticleType_0 (copy), l_ParticleType_0 (copy)
    if l_PagePlayParticleType_0[v59] == l_ParticleType_0.CatalogToAvatarEditor then
        task.spawn(function() --[[ Line: 424 ]]
            -- upvalues: v58 (copy), l_ParticleType_0 (ref)
            for _, v61 in v58.particleStorage[l_ParticleType_0.CatalogToAvatarEditor] do
                v61.Parent = v58.newBackgroundScene.CatalogToAvatarEditorPFX;
                v61.Enabled = true;
            end;
            wait(1);
            for _, v63 in v58.particleStorage[l_ParticleType_0.CatalogToAvatarEditor] do
                v63.Enabled = false;
            end;
        end);
        return;
    else
        if l_PagePlayParticleType_0[v59] == l_ParticleType_0.AvatarEditorToCatalog then
            task.spawn(function() --[[ Line: 436 ]]
                -- upvalues: v58 (copy), l_ParticleType_0 (ref)
                for _, v65 in v58.particleStorage[l_ParticleType_0.AvatarEditorToCatalog] do
                    v65.Parent = v58.newBackgroundScene.AvatarEditorToCatalogPFX;
                    v65.Enabled = true;
                end;
                wait(1);
                for _, v67 in v58.particleStorage[l_ParticleType_0.AvatarEditorToCatalog] do
                    v67.Enabled = false;
                end;
            end);
        end;
        return;
    end;
end;
v22.getCurrentPage = function(v68) --[[ Line: 450 ]] --[[ Name: getCurrentPage ]]
    return v68.avatarRoute.current.name;
end;
v22.animateBackground = function(v69, v70) --[[ Line: 454 ]] --[[ Name: animateBackground ]]
    task.spawn(function() --[[ Line: 455 ]]
        -- upvalues: v69 (copy), v70 (copy)
        v69.wallDisappearTween:Play();
        v69.floorDisappearTween:Play();
        v69:playParticleEmitters(v70);
        wait(0.2);
        v69.largerShapesAppearTween:Play();
        wait(0.2);
        v69.cloudsAppearTween:Play();
    end);
end;
v22.transitionWithTweens = function(v71, v72) --[[ Line: 466 ]] --[[ Name: transitionWithTweens ]]
    -- upvalues: l_AvatarScreen_0 (copy), v13 (copy)
    if v72 == l_AvatarScreen_0.AvatarEditor or v72 == l_AvatarScreen_0.MySharedAvatars then
        v71:animateBackground(l_AvatarScreen_0.AvatarEditor);
        if v72 == l_AvatarScreen_0.MySharedAvatars then
            v71:animateBackground(l_AvatarScreen_0.MySharedAvatars);
        end;
    elseif v72 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        v71:animateBackground(l_AvatarScreen_0.ProfilePictureEditorEmotes);
    elseif v13 and v72 == l_AvatarScreen_0.Catalog then
        v71:animateBackground(l_AvatarScreen_0.Catalog);
    elseif v72 == l_AvatarScreen_0.Catalog or v72 == l_AvatarScreen_0.AvatarExperienceLandingPage then
        task.spawn(function() --[[ Line: 477 ]]
            -- upvalues: v72 (copy), l_AvatarScreen_0 (ref), v71 (copy)
            if v72 ~= l_AvatarScreen_0.AvatarExperienceLandingPage then
                v71:playParticleEmitters(l_AvatarScreen_0.Catalog);
            end;
            v71.largerShapesDisappearTween:Play();
            wait(0.2);
            v71.cloudsDisappearTween:Play();
            wait(0.1);
            v71.wallAppearTween:Play();
            v71.floorAppearTween:Play();
        end);
    end;
    local v73 = v71:getModelInformationForAppPage(v72);
    if v73 then
        v71.newBackgroundScene.Baseplate.Transparency = v73.BaseplateTransparency;
        return;
    else
        v71.newBackgroundScene.Baseplate.Transparency = 0;
        return;
    end;
end;
v22.getModelInformationForAppPage = function(_, v75) --[[ Line: 499 ]] --[[ Name: getModelInformationForAppPage ]]
    -- upvalues: l_PageBackgroundType_0 (copy), l_BackgroundType_0 (copy), v26 (copy)
    if l_PageBackgroundType_0[v75] == l_BackgroundType_0.LargerShapes then
        return v26.LargerShapes;
    elseif l_PageBackgroundType_0[v75] == l_BackgroundType_0.NoShapesNoWalls then
        return v26.NoShapesNoWalls;
    elseif l_PageBackgroundType_0[v75] == l_BackgroundType_0.Walls then
        return v26.Walls;
    else
        return nil;
    end;
end;
v22.transitionInstant = function(v76, v77) --[[ Line: 510 ]] --[[ Name: transitionInstant ]]
    -- upvalues: l_PagePlayParticleType_0 (copy), l_ParticleType_0 (copy)
    for _, v79 in v76.allTweens do
        v79:Cancel();
    end;
    if l_PagePlayParticleType_0[v77] == l_ParticleType_0.None then
        for _, v81 in v76.particleStorage do
            for _, v83 in v81 do
                v83.Enabled = false;
                v83.Parent = nil;
            end;
        end;
    end;
    local v84 = v76:getModelInformationForAppPage(v77);
    if v84 then
        v76.newBackgroundScene.BackPanel.TextureFloor.Transparency = v84.TextureWallTransparency;
        v76.newBackgroundScene.BackPanel.TextureWall.Transparency = v84.TextureWallTransparency;
        v76.newBackgroundScene.LargerShapes.Position = v84.LargerShapesPosition;
        v76.newBackgroundScene.Clouds.Position = v84.CloudsPosition;
        v76.newBackgroundScene.Baseplate.Transparency = v84.BaseplateTransparency;
    end;
end;
v22.update = function(v85, _, _, v88, v89) --[[ Line: 544 ]] --[[ Name: update ]]
    -- upvalues: l_AvatarScreen_0 (copy), v13 (copy), v11 (copy), l_FFlagAXPhotoboothFunctionality_0 (copy)
    local l_name_0 = v88.current.name;
    local l_name_1 = v89.current.name;
    local l_name_2 = v89.opaque.name;
    local v93 = nil;
    local v94 = {
        [l_AvatarScreen_0.Catalog] = not v13, 
        [l_AvatarScreen_0.AvatarEditor] = not v13, 
        [l_AvatarScreen_0.MySharedAvatars] = not v13, 
        [l_AvatarScreen_0.ProfilePictureEditorEmotes] = true
    };
    v93 = false;
    if v94[l_name_0] then
        if l_name_0 ~= l_name_1 and v94[l_name_1] then
            v93 = true;
        elseif l_name_0 ~= l_name_2 and v94[l_name_2] then
            v93 = true;
        end;
    end;
    v85.ParticleEffectManager:setAvatarRoute(v88);
    local v95 = true;
    if l_name_0 ~= l_AvatarScreen_0.AvatarExperienceLandingPage then
        v95 = l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage;
    end;
    local v96 = true;
    if l_name_0 ~= l_AvatarScreen_0.AvatarEditor then
        v96 = l_name_1 == l_AvatarScreen_0.AvatarEditor;
    end;
    local v97 = true;
    if l_name_0 ~= l_AvatarScreen_0.Catalog then
        v97 = l_name_1 == l_AvatarScreen_0.Catalog;
    end;
    local v98 = v11.isAvatarBackground(l_name_0);
    local v99 = true;
    if l_name_0 ~= l_AvatarScreen_0.ProfilePictureEditorEmotes then
        v99 = l_name_1 == l_AvatarScreen_0.ProfilePictureEditorEmotes;
    end;
    local v100 = v95 and (v97 or v96 or v99);
    if l_name_0 ~= l_name_1 then
        if v93 or v100 then
            v85:transitionWithTweens(l_name_0);
        else
            v85:transitionInstant(l_name_0);
            if v98 then
                v85:playParticleEmitters(l_name_0);
            end;
        end;
    end;
    if l_name_0 ~= l_name_1 then
        if l_FFlagAXPhotoboothFunctionality_0 and v85.currentSceneLighting then
            return;
        else
            v85:updateLighting(l_name_0);
        end;
    end;
end;
v22.start = function(v101) --[[ Line: 603 ]] --[[ Name: start ]]
    -- upvalues: l_NotificationService_0 (copy), l_FFlagAXPhotoboothFunctionality_0 (copy), v9 (copy), l_PhotoboothStoreBridge_0 (copy), v13 (copy), v12 (copy), l_ReplicatedStorage_0 (copy), l_AvatarScreen_0 (copy), v11 (copy)
    v101.colorCorrection.TintColor = Color3.fromRGB(255, 255, 255);
    v101:updateTheme(v101.theme);
    local l_name_3 = v101.avatarRoute.current.name;
    local v103 = string.lower(l_NotificationService_0.SelectedTheme);
    if v101.theme ~= v103 then
        v101:updateTheme(v103);
    end;
    table.insert(v101.connections, v101.store.changed:connect(function(v104, v105) --[[ Line: 616 ]]
        -- upvalues: v101 (copy)
        local l_avatarRoute_0 = v101.avatarRoute;
        v101:update(v104, v105, l_avatarRoute_0, l_avatarRoute_0);
    end));
    table.insert(v101.connections, l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function() --[[ Line: 624 ]]
        -- upvalues: l_FFlagAXPhotoboothFunctionality_0 (ref), v101 (copy), l_NotificationService_0 (ref)
        if l_FFlagAXPhotoboothFunctionality_0 and v101.currentScene and v101.currentSceneLighting then
            return;
        else
            v101:updateTheme(string.lower(l_NotificationService_0.SelectedTheme));
            return;
        end;
    end));
    if l_FFlagAXPhotoboothFunctionality_0 then
        table.insert(v101.connections, v9.createEffect(function(v107) --[[ Line: 638 ]]
            -- upvalues: l_PhotoboothStoreBridge_0 (ref), v101 (copy)
            local v108 = l_PhotoboothStoreBridge_0.getStore();
            if not v108 then
                return;
            else
                local v109 = v108.getSelectedSceneId(v107);
                v101.changeSceneTask = task.spawn(function() --[[ Line: 646 ]]
                    -- upvalues: v101 (ref), v109 (copy)
                    v101:pickScene(v109);
                end);
                return;
            end;
        end));
    end;
    local v110 = 20;
    v101.newBackgroundScene.BlobShadow.Decal.Transparency = 0.4;
    if v13 then
        local l_Size_0 = v101.newBackgroundScene.BlobShadow.Size;
        local v112 = math.sqrt(l_Size_0.X * l_Size_0.Z * 0.7);
        v101.newBackgroundScene.BlobShadow.Size = Vector3.new(v112, l_Size_0.Y, v112);
        v101.newBackgroundScene.BlobShadow.Position = Vector3.new(0, -0.10000000149011612, 0, 0);
    end;
    local v113 = tonumber(v12());
    if v113 > 0 then
        v110 = v113;
    end;
    for _, v115 in v101.particleStorage do
        for _, v117 in v115 do
            v117.Rate = v110;
        end;
    end;
    v101:startLighting();
    if l_FFlagAXPhotoboothFunctionality_0 then
        if not l_ReplicatedStorage_0:FindFirstChild("PhotoboothScenes") then
            v101.scenesFolder = Instance.new("Folder");
            v101.scenesFolder.Parent = l_ReplicatedStorage_0;
            v101.scenesFolder.Name = "PhotoboothScenes";
        end;
        v101:pickScene();
    else
        v101.newBackgroundScene.Parent = game.Workspace;
    end;
    if l_name_3 == l_AvatarScreen_0.AvatarEditor or l_name_3 == l_AvatarScreen_0.AvatarExperienceLandingPage or l_name_3 == l_AvatarScreen_0.Catalog or v11.isAvatarBackground(l_name_3) or l_name_3 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        v101:transitionInstant(l_name_3);
    end;
    v101.ParticleEffectManager:start();
    if v11.isAvatarBackground(l_name_3) then
        v101:playParticleEmitters(l_name_3);
    end;
end;
if l_FFlagAXPhotoboothFunctionality_0 then
    v22.updateSceneLighting = function(v118, v119) --[[ Line: 706 ]] --[[ Name: updateSceneLighting ]]
        -- upvalues: l_Lighting_0 (copy)
        if not v119 then
            v118.currentSceneLighting = nil;
            v118:startLighting();
            v118:updateTheme(v118.theme);
            return;
        else
            v118.currentSceneLighting = v119;
            for _, v121 in {
                "Brightness", 
                "Ambient", 
                "ColorShift_Top", 
                "ColorShift_Bottom", 
                "OutdoorAmbient", 
                "ShadowSoftness", 
                "ClockTime", 
                "FogStart", 
                "FogEnd", 
                "FogColor"
            } do
                if v119[v121] ~= nil then
                    l_Lighting_0[v121] = v119[v121];
                end;
            end;
            return;
        end;
    end;
    v22.pickScene = function(v122, v123) --[[ Line: 740 ]] --[[ Name: pickScene ]]
        -- upvalues: l_PhotoboothStoreBridge_0 (copy), v15 (copy), l_ReplicatedStorage_0 (copy), l_InsertService_0 (copy)
        if v122.changeSceneTask then
            task.cancel(v122.changeSceneTask);
        end;
        if not v123 then
            local v124 = l_PhotoboothStoreBridge_0.getStore();
            v123 = if v124 then v124.getSelectedSceneId(false) else "";
        end;
        local v125 = v15.PHOTOBOOTH_SCENES[v123];
        if not v125 then
            warn("BackgroundSceneManager: Unknown scene ID:", v123);
            return;
        else
            if v122.currentScene then
                v122.currentScene.Parent = v122.scenesFolder;
                v122.currentScene = nil;
            end;
            if v123 == "" then
                v122.newBackgroundScene.Parent = game.Workspace;
                v122.currentScene = nil;
                v122:updateSceneLighting(nil);
                v122:updateTheme(v122.theme);
            else
                v122.newBackgroundScene.Parent = l_ReplicatedStorage_0;
                if v125.asset then
                    local v126 = nil;
                    if v122.scenesFolder:FindFirstChild(v125.id) then
                        v126 = v122.scenesFolder:FindFirstChild(v125.id);
                    else
                        v126 = l_InsertService_0:LoadLocalAsset(v125.asset);
                        v126.Name = v125.id;
                        v126.Parent = v122.scenesFolder;
                        if v125.position then
                            v126:SetPrimaryPartCFrame(CFrame.new(v125.position));
                        end;
                        if v125.rotation then
                            v126:SetPrimaryPartCFrame(v126:GetPrimaryPartCFrame() * v125.rotation);
                        end;
                    end;
                    v122.currentScene = v126;
                    v122.currentScene.Parent = game.Workspace;
                    if v125.lighting then
                        v122:updateSceneLighting(v125.lighting);
                    else
                        v122:updateSceneLighting(nil);
                        v122:updateTheme(v122.theme);
                    end;
                end;
            end;
            v122.changeSceneTask = nil;
            return;
        end;
    end;
end;
v22.stop = function(v127) --[[ Line: 816 ]] --[[ Name: stop ]]
    -- upvalues: l_FFlagAXPhotoboothFunctionality_0 (copy), l_ReplicatedStorage_0 (copy), l_ParticleType_0 (copy)
    for _, v129 in v127.connections do
        if l_FFlagAXPhotoboothFunctionality_0 and typeof(v129) == "function" then
            v129();
        else
            v129:disconnect();
        end;
    end;
    if l_FFlagAXPhotoboothFunctionality_0 and v127.currentScene then
        v127.currentScene.Parent = v127.scenesFolder;
    end;
    v127.connections = {};
    v127.newBackgroundScene.Parent = l_ReplicatedStorage_0;
    v127.ParticleEffectManager:stop();
    for v130, v131 in v127.particleStorage do
        for _, v133 in v131 do
            v133.Parent = if v130 == l_ParticleType_0.AvatarEditorToCatalog then v127.newBackgroundScene.AvatarEditorToCatalogPFX else v127.newBackgroundScene.CatalogToAvatarEditorPFX;
        end;
    end;
end;
v22.onDestroy = function(v134) --[[ Line: 843 ]] --[[ Name: onDestroy ]]
    v134.ParticleEffectManager:onDestroy();
end;
v22.updateAvatarRoute = function(v135, v136, v137) --[[ Line: 847 ]] --[[ Name: updateAvatarRoute ]]
    v135.avatarRoute = v136;
    local v138 = v135.store:getState();
    v135:update(v138, v138, v136, v137);
end;
return v22;