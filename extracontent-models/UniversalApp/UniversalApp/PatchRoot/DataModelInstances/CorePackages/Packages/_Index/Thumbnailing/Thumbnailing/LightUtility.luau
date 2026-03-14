local v0 = {};
local l_Lighting_0 = game:GetService("Lighting");
local v2 = require(script.Parent.ColorUtility);
local v3 = require(script.Parent.VectorUtility);
v0.AddLight = function(v4, v5) --[[ Line: 80 ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Anchored = true;
    l_Part_0.Transparency = 1;
    l_Part_0.Shape = Enum.PartType.Ball;
    l_Part_0.Color = v4.color;
    l_Part_0.Name = "ThumbnailLightAnchor_" .. tostring(v5);
    l_Part_0.Parent = workspace;
    local l_PointLight_0 = Instance.new("PointLight");
    l_PointLight_0.Color = v4.color;
    l_PointLight_0.Brightness = 3;
    l_PointLight_0.Range = 10;
    l_PointLight_0.Shadows = true;
    l_PointLight_0.Name = "PointLight_" .. tostring(v5);
    l_PointLight_0.Parent = l_Part_0;
    l_Part_0.Position = v4.worldPos;
end;
v0.AddLightsFromExtraParams = function(v8, v9) --[[ Line: 100 ]]
    -- upvalues: v2 (copy), v3 (copy), v0 (copy), l_Lighting_0 (copy)
    local v10 = false;
    local v11 = v8 and v8.pointLights;
    if v11 then
        for v12, v13 in ipairs(v11) do
            local v14 = {
                color = v2.Color3FromString(v13.color), 
                worldPos = v9 * v3.Vector3FromJson(v13.pos)
            };
            v0.AddLight(v14, v12);
            v10 = true;
        end;
    end;
    local v15 = v8 and v8.clockTime;
    if v15 then
        l_Lighting_0.ClockTime = v15;
        v10 = true;
    end;
    local v16 = v8 and v8.brightness;
    if v16 then
        l_Lighting_0.Brightness = v16;
        v10 = true;
    end;
    return v10;
end;
v0.AddDefaultPointLightRelativeTo = function(v17) --[[ Line: 134 ]]
    -- upvalues: v0 (copy)
    local v18 = v17 * Vector3.new(-5, 7, -5, 0);
    local v19 = {
        color = Color3.new(1, 1, 1), 
        worldPos = v18
    };
    v0.AddLight(v19, 0);
end;
v0.SetupSunlightWithJsonConfig = function(v20) --[[ Line: 143 ]]
    -- upvalues: l_Lighting_0 (copy)
    v20 = v20 or {
        brightness = "1", 
        ambient = "124,124,124", 
        colorShiftBottom = "108,94,66", 
        colorShiftTop = "94,100,172", 
        environmentDiffuseScale = "0", 
        environmentSpecularScale = "1", 
        globalShadows = "true", 
        shadowSoftness = "0", 
        outdoorAmbient = "0,0,0", 
        clockTime = "9.5", 
        geographicLatitude = "330", 
        exposureCompensation = "0", 
        timeOfDay = "09:30:00"
    };
    l_Lighting_0.Brightness = v20.brightness and tonumber(v20.brightness) or 1;
    local v21 = v20.ambient and v20.ambient:split(",") or {
        "124", 
        "124", 
        "124"
    };
    l_Lighting_0.Ambient = Color3.fromRGB(tonumber(v21[1]), tonumber(v21[2]), (tonumber(v21[3])));
    local v22 = v20.colorShiftBottom and v20.colorShiftBottom:split(",") or {
        "108", 
        "94", 
        "66"
    };
    local v23 = v20.colorShiftTop and v20.colorShiftTop:split(",") or {
        "94", 
        "100", 
        "172"
    };
    l_Lighting_0.ColorShift_Bottom = Color3.fromRGB(tonumber(v22[1]), tonumber(v22[2]), (tonumber(v22[3])));
    l_Lighting_0.ColorShift_Top = Color3.fromRGB(tonumber(v23[1]), tonumber(v23[2]), (tonumber(v23[3])));
    l_Lighting_0.EnvironmentDiffuseScale = v20.environmentDiffuseScale and tonumber(v20.environmentDiffuseScale) or 0;
    l_Lighting_0.EnvironmentSpecularScale = v20.environmentSpecularScale and tonumber(v20.environmentSpecularScale) or 1;
    l_Lighting_0.GlobalShadows = v20.globalShadows and v20.globalShadows == "true" or false;
    l_Lighting_0.ShadowSoftness = v20.shadowSoftness and tonumber(v20.shadowSoftness) or 0;
    local v24 = v20.outdoorAmbient and v20.outdoorAmbient:split(",") or {
        "0", 
        "0", 
        "0"
    };
    l_Lighting_0.OutdoorAmbient = Color3.fromRGB(tonumber(v24[1]), tonumber(v24[2]), (tonumber(v24[3])));
    l_Lighting_0.ClockTime = v20.clockTime and tonumber(v20.clockTime) or 9.5;
    l_Lighting_0.GeographicLatitude = v20.geographicLatitude and tonumber(v20.geographicLatitude) or 330;
    l_Lighting_0.ExposureCompensation = v20.exposureCompensation and tonumber(v20.exposureCompensation) or 0;
    l_Lighting_0.TimeOfDay = v20.timeOfDay or "09:30:00";
end;
v0.SetupSceneLight = function(v25, v26) --[[ Line: 190 ]]
    v25 = v25 or {};
    local v27 = v25.lightType or "SpotLight";
    v26 = v26 or v27;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Anchored = true;
    l_Part_1.Transparency = 1;
    l_Part_1.Size = v25.partSize or Vector3.new(4, 1, 2, 0);
    l_Part_1.Shape = v25.partType or Enum.PartType.Block;
    l_Part_1.Name = "ThumbnailLightAnchor_" .. tostring(v26);
    l_Part_1.Parent = workspace;
    local v29 = Instance.new(v27);
    v29.Enabled = v25.enabled == nil or v25.enabled;
    v29.Color = v25.color or Color3.fromRGB(255, 255, 255);
    v29.Brightness = v25.brightness or 10;
    v29.Range = v25.range or 12;
    v29.Angle = v25.angle or 30;
    v29.Shadows = v25.shadows == nil or v25.shadows;
    v29.Name = tostring(v26);
    v29.Parent = l_Part_1;
    l_Part_1.CFrame = v25.partCFrame;
end;
v0.SetupSpotLight = function(v30, v31) --[[ Line: 215 ]]
    -- upvalues: v0 (copy)
    v30 = v30 or {};
    v30.lightType = "SpotLight";
    v0.SetupSceneLight(v30, v31);
end;
v0.SetupSpotLightsIn3PointLighting = function(v32) --[[ Line: 225 ]]
    -- upvalues: v0 (copy)
    v32 = v32 or {
        keyLight = {
            partCFrame = CFrame.new(2.219, 103.178, 4.675) * CFrame.Angles(30, 60, -90), 
            color = Color3.fromRGB(218, 196, 144), 
            brightness = 11.2, 
            range = 12, 
            angle = 54
        }, 
        fillLight = {
            partCFrame = CFrame.new(3.554, 107.01, -1.036) * CFrame.Angles(-15, 90, -90), 
            color = Color3.fromRGB(255, 255, 255), 
            brightness = 1.6, 
            range = 12, 
            angle = 36
        }
    };
    if v32.keyLight then
        v0.SetupSpotLight(v32.keyLight, "KeyLight");
    end;
    if v32.fillLight then
        v0.SetupSpotLight(v32.fillLight, "FillLight");
    end;
end;
v0.SetupSpotLightsIn3PointLightingWithJsonConfig = function(v33) --[[ Line: 251 ]]
    -- upvalues: v0 (copy)
    v33 = v33 or {
        rotation = "105", 
        keyCFrame = "2.219,103.178,4.675,30,60,-90", 
        keyBrightness = "11.2", 
        keyRange = "12", 
        keyAngle = "54", 
        keyColor = "218,196,144", 
        fillCFrame = "3.554,107.01,-1.036,-15,90,-90", 
        fillBrightness = "1.6", 
        fillRange = "12", 
        fillAngle = "36", 
        fillColor = "255,255,255"
    };
    local v34 = v33.rotation and tonumber(v33.rotation) or 105;
    local v35 = CFrame.Angles(0, math.rad(v34), 0);
    local v36 = v33.keyCFrame and v33.keyCFrame:split(",") or {
        "2.219", 
        "103.178", 
        "4.675", 
        "30", 
        "60", 
        "-90"
    };
    local v37 = v35:ToWorldSpace(CFrame.new(tonumber(v36[1]) or 0, tonumber(v36[2]) or 0, tonumber(v36[3]) or 0) * CFrame.Angles(math.rad(tonumber(v36[4]) or 0), math.rad(tonumber(v36[5]) or 0), (math.rad(tonumber(v36[6]) or 0))));
    local v38 = v33.fillCFrame and v33.fillCFrame:split(",") or {
        "3.554", 
        "107.01", 
        "-1.036", 
        "-15", 
        "90", 
        "-90"
    };
    local v39 = v35:ToWorldSpace(CFrame.new(tonumber(v38[1]) or 0, tonumber(v38[2]) or 0, tonumber(v38[3]) or 0) * CFrame.Angles(math.rad(tonumber(v38[4]) or 0), math.rad(tonumber(v38[5]) or 0), (math.rad(tonumber(v38[6]) or 0))));
    local v40 = v33.keyBrightness and tonumber(v33.keyBrightness) or 11.2;
    local v41 = v33.keyRange and tonumber(v33.keyRange) or 12;
    local v42 = v33.keyAngle and tonumber(v33.keyAngle) or 54;
    local v43 = v33.keyColor and v33.keyColor:split(",") or {
        "218", 
        "196", 
        "144"
    };
    local v44 = v33.fillBrightness and tonumber(v33.fillBrightness) or 1.6;
    local v45 = v33.fillRange and tonumber(v33.fillRange) or 12;
    local v46 = v33.fillAngle and tonumber(v33.fillAngle) or 36;
    local v47 = v33.fillColor and v33.fillColor:split(",") or {
        "255", 
        "255", 
        "255"
    };
    v0.SetupSpotLightsIn3PointLighting({
        keyLight = {
            partCFrame = v37, 
            color = Color3.fromRGB(tonumber(v43[1]), tonumber(v43[2]), (tonumber(v43[3]))), 
            brightness = v40, 
            range = v41, 
            angle = v42
        }, 
        fillLight = {
            partCFrame = v39, 
            color = Color3.fromRGB(tonumber(v47[1]), tonumber(v47[2]), (tonumber(v47[3]))), 
            brightness = v44, 
            range = v45, 
            angle = v46
        }
    });
end;
return v0;