local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Lighting_0 = game:GetService("Lighting");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_InsertService_0 = game:GetService("InsertService");
local l_MaterialService_0 = game:GetService("MaterialService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_CorePackages_0.Packages.Signals);
local v9 = require(l_Modules_0.LuaApp.mutedError);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v11 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData);
local l_PhotoboothStoreBridge_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperiencePhotobooth).PhotoboothStoreBridge;
local v13 = require(l_Modules_0.AvatarExperience.Common.Managers.ParticleEffectManager);
local v14 = require(l_Modules_0.AvatarExperience.Flags.FFlagUseUpdatedBackgroundSceneSettingsOnMobile);
local l_PhotoboothScenes_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperiencePhotobooth).Enums.PhotoboothScenes;
local v16 = {};
v16.__index = v16;
v16.new = function(v17, v18, v19) --[[ Line: 100 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy), v13 (copy), l_ReplicatedStorage_0 (copy)
    local v20 = {};
    setmetatable(v20, v16);
    v20.store = v17;
    v20.networking = v18;
    v20.avatarRoute = v19;
    v20.connections = {};
    v20.signals = {};
    v20.ParticleEffectManager = v13.new(v17, v19);
    v20.managedLightingObjects = {};
    v20.originalLightingObjects = {};
    v20.managedMaterialVariants = {};
    v20.defaultScenes = {
        light = "BlockyLight", 
        dark = "BlockyDark"
    };
    if not l_ReplicatedStorage_0:FindFirstChild("Scenes") then
        v20.scenesFolder = Instance.new("Folder");
        v20.scenesFolder.Parent = l_ReplicatedStorage_0;
        v20.scenesFolder.Name = "Scenes";
    else
        v20.scenesFolder = l_ReplicatedStorage_0:FindFirstChild("Scenes");
    end;
    v20:CleanupDefaultBackgroundScene();
    v20.currentScene = nil;
    v20.changeSceneTask = nil;
    return v20;
end;
v16.moveOriginalLightingToStorage = function(v21) --[[ Line: 149 ]] --[[ Name: moveOriginalLightingToStorage ]]
    -- upvalues: l_Lighting_0 (copy)
    for _, v23 in l_Lighting_0:GetChildren() do
        table.insert(v21.originalLightingObjects, v23);
        v23.Parent = nil;
    end;
end;
v16.clearManagedLighting = function(v24) --[[ Line: 158 ]] --[[ Name: clearManagedLighting ]]
    for _, v26 in v24.managedLightingObjects do
        v26:Destroy();
    end;
    v24.managedLightingObjects = {};
end;
v16.restoreOriginalLighting = function(v27) --[[ Line: 167 ]] --[[ Name: restoreOriginalLighting ]]
    -- upvalues: l_Lighting_0 (copy)
    v27:clearManagedLighting();
    for _, v29 in v27.originalLightingObjects do
        v29.Parent = l_Lighting_0;
    end;
    v27.originalLightingObjects = {};
end;
v16.applyLightingFromConfig = function(v30, v31) --[[ Line: 179 ]] --[[ Name: applyLightingFromConfig ]]
    -- upvalues: l_Lighting_0 (copy)
    v30:clearManagedLighting();
    local l_LightingConfig_0 = v31:FindFirstChild("LightingConfig");
    if not l_LightingConfig_0 then
        return;
    else
        for v33, v34 in (l_LightingConfig_0:GetAttributes()) do
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 192 ]]
                -- upvalues: l_Lighting_0 (ref), v33 (copy), v34 (copy)
                l_Lighting_0[v33] = v34;
            end);
            if not l_status_0 then
                warn("BackgroundSceneManager: Failed to apply lighting property", v33, ":", l_result_0);
            end;
        end;
        local l_LightingObjects_0 = v31:FindFirstChild("LightingObjects");
        if l_LightingObjects_0 then
            for _, v39 in l_LightingObjects_0:GetChildren() do
                local v40 = v39:Clone();
                v40.Parent = l_Lighting_0;
                table.insert(v30.managedLightingObjects, v40);
            end;
        end;
        return;
    end;
end;
v16.clearManagedMaterialVariants = function(v41) --[[ Line: 213 ]] --[[ Name: clearManagedMaterialVariants ]]
    for _, v43 in v41.managedMaterialVariants do
        v43:Destroy();
    end;
    v41.managedMaterialVariants = {};
end;
v16.applyMaterialVariantsFromConfig = function(v44, v45) --[[ Line: 222 ]] --[[ Name: applyMaterialVariantsFromConfig ]]
    -- upvalues: l_MaterialService_0 (copy)
    v44:clearManagedMaterialVariants();
    local l_MaterialVariants_0 = v45:FindFirstChild("MaterialVariants");
    if l_MaterialVariants_0 then
        for _, v48 in l_MaterialVariants_0:GetChildren() do
            if v48:IsA("MaterialVariant") then
                local v49 = v48:Clone();
                v49.Parent = l_MaterialService_0;
                table.insert(v44.managedMaterialVariants, v49);
            end;
        end;
    end;
end;
v16.pickScene = function(v50, v51) --[[ Line: 241 ]] --[[ Name: pickScene ]]
    -- upvalues: l_PhotoboothStoreBridge_0 (copy), v11 (copy), l_NotificationService_0 (copy), l_InsertService_0 (copy), l_PhotoboothScenes_0 (copy), v9 (copy)
    if not v51 then
        local v52 = l_PhotoboothStoreBridge_0.getStore();
        if v52 then
            v51 = v52.getSelectedSceneId(false);
        end;
    end;
    local v53 = v51 or "";
    local v54 = v11.PHOTOBOOTH_SCENES[v53];
    if not v54 then
        warn("BackgroundSceneManager: Unknown scene ID:", v53);
        return;
    else
        if v50.currentScene then
            v50.currentScene.Parent = v50.scenesFolder;
        end;
        v50.currentScene = nil;
        local v55 = (l_NotificationService_0.SelectedTheme or "Light"):lower() == "dark";
        if v53 == "" then
            local v56 = if v55 then v50.defaultScenes.dark else v50.defaultScenes.light;
            local v57 = nil;
            if v50.scenesFolder then
                v57 = v50.scenesFolder:FindFirstChild(v56);
            end;
            if v57 then
                v50.currentScene = v57;
                v57.Parent = workspace;
                v50:applyLightingFromConfig(v57);
                v50:applyMaterialVariantsFromConfig(v57);
                return;
            end;
        else
            local l_asset_0 = v54.asset;
            local l_position_0 = v54.position;
            local l_rotation_0 = v54.rotation;
            local v61 = v54.remote or false;
            if v55 and v54.dark then
                l_asset_0 = v54.dark.asset or v54.asset;
                l_position_0 = v54.dark.position or v54.position;
                l_rotation_0 = v54.dark.rotation or v54.rotation;
                v61 = v54.dark.remote or v54.remote or false;
            end;
            do
                local l_l_asset_0_0, l_v61_0 = l_asset_0, v61;
                if l_l_asset_0_0 then
                    local v64 = nil;
                    local v65 = v54.id .. (v55 and v54.dark and "_dark" or "_light");
                    if v50.scenesFolder then
                        v64 = v50.scenesFolder:FindFirstChild(v65);
                    end;
                    do
                        local l_v64_0 = v64;
                        if not l_v64_0 then
                            local l_status_1, l_result_1 = pcall(function() --[[ Line: 306 ]]
                                -- upvalues: l_v61_0 (ref), l_l_asset_0_0 (ref), l_InsertService_0 (ref)
                                if l_v61_0 then
                                    local l_l_l_asset_0_0_0 = l_l_asset_0_0;
                                    if string.find(l_l_asset_0_0, "rbxassetid://") then
                                        l_l_l_asset_0_0_0 = string.gsub(l_l_asset_0_0, "rbxassetid://", "");
                                    end;
                                    local v68 = tonumber(l_l_l_asset_0_0_0);
                                    if v68 then
                                        local v69 = l_InsertService_0:LoadAsset(v68);
                                        local v70 = v69:GetChildren()[1];
                                        if v70 then
                                            v70.Parent = nil;
                                            v69:Destroy();
                                            return v70;
                                        else
                                            error("No content found in loaded remote asset: " .. l_l_asset_0_0);
                                            return;
                                        end;
                                    else
                                        error("Invalid asset ID format: " .. l_l_asset_0_0);
                                        return;
                                    end;
                                else
                                    return l_InsertService_0:LoadLocalAsset(l_l_asset_0_0);
                                end;
                            end);
                            if l_status_1 and l_result_1 then
                                l_v64_0 = l_result_1;
                                if l_v64_0 then
                                    l_v64_0.Name = v65;
                                    l_v64_0.Parent = v50.scenesFolder;
                                end;
                                local v73 = l_position_0 or Vector3.new(0, 0, 0, 0);
                                local v74 = if l_rotation_0 then l_rotation_0 else CFrame.Angles(0, 0, 0);
                                local l_v73_0 = v73 --[[ copy: 13 -> 17 ]];
                                local l_v74_0 = v74 --[[ copy: 14 -> 18 ]];
                                local l_status_2, l_result_2 = pcall(function() --[[ Line: 346 ]]
                                    -- upvalues: l_v64_0 (ref), l_v73_0 (copy), l_v74_0 (copy)
                                    if l_v64_0 then
                                        l_v64_0:PivotTo(CFrame.new(l_v73_0) * l_v74_0);
                                    end;
                                end);
                                if not l_status_2 then
                                    warn("BackgroundSceneManager: Failed to set scene position for", v54.id, ":", l_result_2);
                                end;
                            else
                                local v79 = if l_v61_0 then l_PhotoboothScenes_0.REMOTE else l_PhotoboothScenes_0.LOCAL;
                                warn("BackgroundSceneManager: Failed to load", v79, "scene asset", l_l_asset_0_0, "for scene", v54.id);
                                v9("BackgroundSceneManager failed to load scene asset.");
                                if l_result_1 then
                                    warn("BackgroundSceneManager: Error details:", l_result_1);
                                end;
                                local v80 = if v55 then v50.defaultScenes.dark else v50.defaultScenes.light;
                                if v50.scenesFolder then
                                    local l_FirstChild_0 = v50.scenesFolder:FindFirstChild(v80);
                                    if l_FirstChild_0 then
                                        warn("BackgroundSceneManager: Falling back to default scene:", v80);
                                        l_v64_0 = l_FirstChild_0;
                                    end;
                                else
                                    warn("BackgroundSceneManager: No fallback scene available");
                                    return;
                                end;
                            end;
                        end;
                        if l_v64_0 then
                            v50.currentScene = l_v64_0;
                            v50.currentScene.Parent = workspace;
                            local l_status_3, l_result_3 = pcall(function() --[[ Line: 396 ]]
                                -- upvalues: v50 (copy), l_v64_0 (ref)
                                v50:applyLightingFromConfig(l_v64_0);
                            end);
                            if not l_status_3 then
                                warn("BackgroundSceneManager: Failed to apply lighting configuration for scene", v54.id, ":", l_result_3);
                            end;
                            local l_status_4, l_result_4 = pcall(function() --[[ Line: 410 ]]
                                -- upvalues: v50 (copy), l_v64_0 (ref)
                                v50:applyMaterialVariantsFromConfig(l_v64_0);
                            end);
                            if not l_status_4 then
                                warn("BackgroundSceneManager: Failed to apply material configuration for scene", v54.id, ":", l_result_4);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v16.createLightingConfiguration = function(_, v87) --[[ Line: 427 ]] --[[ Name: createLightingConfiguration ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_Configuration_0 = Instance.new("Configuration");
    l_Configuration_0.Name = "LightingConfig";
    l_Configuration_0.Parent = v87;
    l_Configuration_0:SetAttribute("Brightness", l_Lighting_0.Brightness);
    l_Configuration_0:SetAttribute("ClockTime", l_Lighting_0.ClockTime);
    l_Configuration_0:SetAttribute("EnvironmentDiffuseScale", l_Lighting_0.EnvironmentDiffuseScale);
    l_Configuration_0:SetAttribute("EnvironmentSpecularScale", l_Lighting_0.EnvironmentSpecularScale);
    l_Configuration_0:SetAttribute("FogEnd", l_Lighting_0.FogEnd);
    l_Configuration_0:SetAttribute("FogStart", l_Lighting_0.FogStart);
    l_Configuration_0:SetAttribute("GeographicLatitude", l_Lighting_0.GeographicLatitude);
    l_Configuration_0:SetAttribute("ShadowSoftness", l_Lighting_0.ShadowSoftness);
    l_Configuration_0:SetAttribute("Ambient", l_Lighting_0.Ambient);
    l_Configuration_0:SetAttribute("ColorShift_Bottom", l_Lighting_0.ColorShift_Bottom);
    l_Configuration_0:SetAttribute("ColorShift_Top", l_Lighting_0.ColorShift_Top);
    l_Configuration_0:SetAttribute("FogColor", l_Lighting_0.FogColor);
    l_Configuration_0:SetAttribute("OutdoorAmbient", l_Lighting_0.OutdoorAmbient);
    l_Configuration_0:SetAttribute("TimeOfDay", l_Lighting_0.TimeOfDay);
    l_Configuration_0:SetAttribute("GlobalShadows", l_Lighting_0.GlobalShadows);
    return l_Configuration_0;
end;
v16.CleanupDefaultBackgroundScene = function(v89) --[[ Line: 453 ]] --[[ Name: CleanupDefaultBackgroundScene ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v14 (copy)
    local l_AvatarSceneNew_0 = l_ReplicatedStorage_0:WaitForChild("AvatarSceneNew");
    local v91 = {
        Brightness = 2, 
        ColorShift_Bottom = if v14 then Color3.fromRGB(108, 94, 66) else Color3.fromRGB(232, 255, 146), 
        ColorShift_Top = if v14 then Color3.fromRGB(94, 100, 172) else Color3.fromRGB(85, 136, 167), 
        ClockTime = v14 and 11 or 12, 
        FogEnd = 92, 
        GeographicLatitude = v14 and 24 or 41.733, 
        OutdoorAmbient = Color3.fromRGB(0, 0, 0), 
        TimeOfDay = v14 and "11:00:00" or "12:00:00", 
        GlobalShadows = true, 
        ShadowSoftness = 0.2, 
        Ambient = if v14 then Color3.fromRGB(130, 130, 130) else Color3.fromRGB(170, 170, 170), 
        EnvironmentDiffuseScale = v14 and 0.2 or nil, 
        EnvironmentSpecularScale = v14 and 1 or nil, 
        FogStart = v14 and 30 or 20, 
        FogColor = Color3.fromRGB(213, 213, 213), 
        BloomEnabled = true, 
        BloomIntensity = v14 and 0.2 or 0.3, 
        BloomSize = 12, 
        BloomThreshold = 0.95, 
        ColorCorrectionEnabled = true, 
        ColorCorrectionBrightness = 0, 
        ColorCorrectionContrast = 0, 
        ColorCorrectionSaturation = 0, 
        ColorCorrectionTintColor = Color3.fromRGB(255, 255, 255), 
        BackPanelTextureColor = Color3.fromRGB(213, 213, 213), 
        CloudsTextureColor = Color3.fromRGB(222, 222, 222), 
        LargerShapesTextureColor = Color3.fromRGB(222, 222, 222), 
        BasePlateColor = Color3.fromRGB(213, 213, 213), 
        SkyboxAssetLocation = "rbxasset://textures/AvatarEditorImages/LightPixel.png"
    };
    local v92 = {
        Brightness = 2, 
        ColorShift_Bottom = if v14 then Color3.fromRGB(108, 94, 66) else Color3.fromRGB(232, 255, 146), 
        ColorShift_Top = if v14 then Color3.fromRGB(94, 100, 172) else Color3.fromRGB(85, 136, 167), 
        ClockTime = v14 and 11 or 12, 
        FogEnd = 92, 
        GeographicLatitude = v14 and 24 or 41.733, 
        OutdoorAmbient = Color3.fromRGB(0, 0, 0), 
        TimeOfDay = v14 and "11:00:00" or "12:00:00", 
        GlobalShadows = true, 
        ShadowSoftness = 0.2, 
        Ambient = if v14 then Color3.fromRGB(180, 180, 180) else Color3.fromRGB(170, 170, 170), 
        EnvironmentDiffuseScale = v14 and 1 or 1, 
        EnvironmentSpecularScale = v14 and 1 or 1, 
        FogStart = v14 and 20 or 20, 
        FogColor = if v14 then Color3.fromRGB(55, 56, 59) else Color3.fromRGB(45, 46, 49), 
        BloomEnabled = true, 
        BloomIntensity = v14 and 0.2 or 0.3, 
        BloomSize = 12, 
        BloomThreshold = 0.95, 
        ColorCorrectionEnabled = true, 
        ColorCorrectionBrightness = 0, 
        ColorCorrectionContrast = 0, 
        ColorCorrectionSaturation = 0, 
        ColorCorrectionTintColor = Color3.fromRGB(255, 255, 255), 
        BackPanelTextureColor = Color3.fromRGB(83, 80, 82), 
        CloudsTextureColor = Color3.fromRGB(100, 101, 108), 
        LargerShapesTextureColor = Color3.fromRGB(100, 101, 108), 
        BasePlateColor = Color3.fromRGB(83, 80, 82), 
        SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png"
    };
    for _, v94 in {
        {
            name = v89.defaultScenes.light, 
            theme = v91
        }, 
        {
            name = v89.defaultScenes.dark, 
            theme = v92
        }
    } do
        local v95 = l_AvatarSceneNew_0:Clone();
        v95.Name = v94.name;
        v95.Parent = v89.scenesFolder;
        local l_BlobShadow_0 = v95:FindFirstChild("BlobShadow");
        if l_BlobShadow_0 then
            v95.PrimaryPart = l_BlobShadow_0;
            l_BlobShadow_0.CFrame = CFrame.new(0, 0, 0);
        end;
        local l_theme_0 = v94.theme;
        local l_BackPanel_0 = v95:FindFirstChild("BackPanel");
        if l_BackPanel_0 then
            l_BackPanel_0.Transparency = 1;
            for _, v100 in l_BackPanel_0:GetChildren() do
                if v100:IsA("BasePart") then
                    v100.Color = l_theme_0.BackPanelTextureColor;
                else
                    pcall(function() --[[ Line: 581 ]]
                        -- upvalues: v100 (copy), l_theme_0 (copy)
                        v100.Color3 = l_theme_0.BackPanelTextureColor;
                    end);
                end;
                v100.Transparency = 1;
            end;
        end;
        local l_Clouds_0 = v95:FindFirstChild("Clouds");
        if l_Clouds_0 then
            for _, v103 in l_Clouds_0:GetChildren() do
                if v103:IsA("BasePart") then
                    v103.Color = l_theme_0.CloudsTextureColor;
                else
                    pcall(function() --[[ Line: 595 ]]
                        -- upvalues: v103 (copy), l_theme_0 (copy)
                        v103.Color3 = l_theme_0.CloudsTextureColor;
                    end);
                end;
            end;
        end;
        local l_LargerShapes_0 = v95:FindFirstChild("LargerShapes");
        if l_LargerShapes_0 then
            for _, v106 in l_LargerShapes_0:GetChildren() do
                if v106:IsA("BasePart") then
                    v106.Color = l_theme_0.LargerShapesTextureColor;
                else
                    pcall(function() --[[ Line: 608 ]]
                        -- upvalues: v106 (copy), l_theme_0 (copy)
                        v106.Color3 = l_theme_0.LargerShapesTextureColor;
                    end);
                end;
            end;
        end;
        local l_Baseplate_0 = v95:FindFirstChild("Baseplate");
        if l_Baseplate_0 and l_Baseplate_0:IsA("BasePart") then
            l_Baseplate_0.Color = l_theme_0.BasePlateColor;
        end;
        local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
        local l_BloomEffect_0 = Instance.new("BloomEffect");
        local l_Sky_0 = Instance.new("Sky");
        l_Sky_0.CelestialBodiesShown = true;
        l_Sky_0.StarCount = 3000;
        l_Sky_0.SkyboxBk = l_theme_0.SkyboxAssetLocation;
        l_Sky_0.SkyboxDn = l_theme_0.SkyboxAssetLocation;
        l_Sky_0.SkyboxFt = l_theme_0.SkyboxAssetLocation;
        l_Sky_0.SkyboxLf = l_theme_0.SkyboxAssetLocation;
        l_Sky_0.SkyboxRt = l_theme_0.SkyboxAssetLocation;
        l_Sky_0.SkyboxUp = l_theme_0.SkyboxAssetLocation;
        l_BloomEffect_0.Enabled = l_theme_0.BloomEnabled;
        l_BloomEffect_0.Intensity = l_theme_0.BloomIntensity;
        l_BloomEffect_0.Size = l_theme_0.BloomSize;
        l_BloomEffect_0.Threshold = l_theme_0.BloomThreshold;
        l_ColorCorrectionEffect_0.Enabled = l_theme_0.ColorCorrectionEnabled;
        l_ColorCorrectionEffect_0.Brightness = l_theme_0.ColorCorrectionBrightness;
        l_ColorCorrectionEffect_0.Contrast = l_theme_0.ColorCorrectionContrast;
        l_ColorCorrectionEffect_0.Saturation = l_theme_0.ColorCorrectionSaturation;
        l_ColorCorrectionEffect_0.TintColor = l_theme_0.ColorCorrectionTintColor;
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "LightingObjects";
        l_Folder_0.Parent = v95;
        l_ColorCorrectionEffect_0.Parent = l_Folder_0;
        l_BloomEffect_0.Parent = l_Folder_0;
        l_Sky_0.Parent = l_Folder_0;
        v89:createLightingConfiguration(v95);
        local l_LightingConfig_1 = v95:FindFirstChild("LightingConfig");
        if l_LightingConfig_1 then
            for v113, v114 in l_theme_0 do
                if v114 ~= nil and l_LightingConfig_1:GetAttribute(v113) ~= nil then
                    l_LightingConfig_1:SetAttribute(v113, v114);
                end;
            end;
        end;
    end;
    l_AvatarSceneNew_0:Destroy();
end;
v16.start = function(v115) --[[ Line: 677 ]] --[[ Name: start ]]
    -- upvalues: l_NotificationService_0 (copy), v8 (copy), l_PhotoboothStoreBridge_0 (copy)
    v115:moveOriginalLightingToStorage();
    v115:pickScene();
    table.insert(v115.connections, v115.store.changed:connect(function(v116, v117) --[[ Line: 683 ]]
        -- upvalues: v115 (copy)
        local l_avatarRoute_0 = v115.avatarRoute;
        v115:update(v116, v117, l_avatarRoute_0, l_avatarRoute_0);
    end));
    table.insert(v115.connections, l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function() --[[ Line: 691 ]]
        -- upvalues: v115 (copy)
        if v115.changeSceneTask then
            task.cancel(v115.changeSceneTask);
        end;
        v115.changeSceneTask = task.spawn(function() --[[ Line: 696 ]]
            -- upvalues: v115 (ref)
            v115:pickScene();
        end);
    end));
    table.insert(v115.signals, v8.createEffect(function(v119) --[[ Line: 704 ]]
        -- upvalues: l_PhotoboothStoreBridge_0 (ref), v115 (copy)
        local v120 = l_PhotoboothStoreBridge_0.getStore();
        if not v120 then
            return;
        else
            v120.getSelectedSceneId(v119);
            if v115.changeSceneTask then
                task.cancel(v115.changeSceneTask);
            end;
            v115.changeSceneTask = task.spawn(function() --[[ Line: 717 ]]
                -- upvalues: v115 (ref)
                v115:pickScene();
            end);
            return;
        end;
    end));
    v115.ParticleEffectManager:start();
end;
v16.stop = function(v121) --[[ Line: 726 ]] --[[ Name: stop ]]
    for _, v123 in v121.connections do
        v123:disconnect();
    end;
    for _, v125 in v121.signals do
        v125();
    end;
    if v121.currentScene then
        v121.currentScene.Parent = v121.scenesFolder;
    end;
    v121:restoreOriginalLighting();
    v121:clearManagedMaterialVariants();
    if v121.changeSceneTask then
        task.cancel(v121.changeSceneTask);
        v121.changeSceneTask = nil;
    end;
    v121.connections = {};
    v121.signals = {};
    v121.ParticleEffectManager:stop();
end;
v16.onDestroy = function(v126) --[[ Line: 755 ]] --[[ Name: onDestroy ]]
    v126:stop();
    v126.ParticleEffectManager:onDestroy();
end;
v16.update = function(v127, _, _, v130, _) --[[ Line: 760 ]] --[[ Name: update ]]
    v127.ParticleEffectManager:setAvatarRoute(v130);
end;
v16.updateAvatarRoute = function(v132, v133, v134) --[[ Line: 764 ]] --[[ Name: updateAvatarRoute ]]
    v132.avatarRoute = v133;
    local v135 = v132.store:getState();
    v132:update(v135, v135, v133, v134);
end;
return v16;