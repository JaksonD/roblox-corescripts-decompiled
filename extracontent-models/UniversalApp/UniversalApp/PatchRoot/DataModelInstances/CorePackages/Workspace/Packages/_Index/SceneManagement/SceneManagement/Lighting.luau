local l_Lighting_0 = game:GetService("Lighting");
local l_Parent_0 = script:FindFirstAncestor("SceneManagement").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v3 = {
    LightingConfig = {
        Brightness = 1, 
        ColorShift_Bottom = Color3.fromRGB(232, 255, 146), 
        ColorShift_Top = Color3.fromRGB(85, 136, 167), 
        OutdoorAmbient = Color3.fromRGB(0, 0, 0), 
        Ambient = Color3.fromRGB(170, 170, 170), 
        ClockTime = 12, 
        GeographicLatitude = 41.733, 
        TimeOfDay = "12:00:00", 
        FogColor = Color3.fromRGB(45, 46, 49), 
        FogEnd = 92, 
        FogStart = 20
    }, 
    SkyConfig = {
        CelestialBodiesShown = false, 
        StarCount = 0, 
        SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png"
    }, 
    BloomEnabled = false, 
    BloomConfig = {
        Intensity = 0.3, 
        Size = 12, 
        Threshold = 0.95
    }, 
    ColorCorrectionEnabled = false, 
    ColorCorrectionConfig = {
        Brightness = 0, 
        Contrast = 0, 
        Saturation = 0
    }
};
local function v6(v4) --[[ Line: 81 ]] --[[ Name: configureLighting ]]
    -- upvalues: l_Object_0 (copy), v3 (copy), l_Lighting_0 (copy)
    local v5 = l_Object_0.assign({}, v3.LightingConfig, v4 or {});
    l_Lighting_0.Brightness = v5.Brightness;
    l_Lighting_0.ColorShift_Bottom = v5.ColorShift_Bottom;
    l_Lighting_0.ColorShift_Top = v5.ColorShift_Top;
    l_Lighting_0.OutdoorAmbient = v5.OutdoorAmbient;
    l_Lighting_0.Ambient = v5.Ambient;
    l_Lighting_0.ClockTime = v5.ClockTime;
    l_Lighting_0.GeographicLatitude = v5.GeographicLatitude;
    l_Lighting_0.TimeOfDay = v5.TimeOfDay;
    l_Lighting_0.FogColor = v5.FogColor;
    l_Lighting_0.FogEnd = v5.FogEnd;
    l_Lighting_0.FogStart = v5.FogStart;
end;
local function _() --[[ Line: 96 ]] --[[ Name: getOrCreateSky ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_Sky_0 = l_Lighting_0:FindFirstChild("Sky");
    if l_Sky_0 == nil then
        l_Sky_0 = Instance.new("Sky");
        l_Sky_0.Parent = l_Lighting_0;
    end;
    return l_Sky_0;
end;
local function v12(v9, v10) --[[ Line: 105 ]] --[[ Name: configureSky ]]
    -- upvalues: l_Object_0 (copy), v3 (copy)
    local v11 = l_Object_0.assign({}, v3.SkyConfig, v10 or {});
    v9.CelestialBodiesShown = v11.CelestialBodiesShown;
    v9.StarCount = v11.StarCount;
    v9.SkyboxBk = v11.SkyboxAssetLocation;
    v9.SkyboxDn = v11.SkyboxAssetLocation;
    v9.SkyboxFt = v11.SkyboxAssetLocation;
    v9.SkyboxLf = v11.SkyboxAssetLocation;
    v9.SkyboxRt = v11.SkyboxAssetLocation;
    v9.SkyboxUp = v11.SkyboxAssetLocation;
end;
local function _() --[[ Line: 117 ]] --[[ Name: getBloom ]]
    -- upvalues: l_Lighting_0 (copy)
    return (l_Lighting_0:FindFirstChild("Bloom"));
end;
local function _() --[[ Line: 121 ]] --[[ Name: getOrCreateBloom ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_Bloom_0 = l_Lighting_0:FindFirstChild("Bloom");
    if l_Bloom_0 == nil then
        l_Bloom_0 = Instance.new("BloomEffect");
        l_Bloom_0.Parent = l_Lighting_0;
    end;
    return l_Bloom_0;
end;
local function v19(v16, v17) --[[ Line: 130 ]] --[[ Name: configureBloom ]]
    -- upvalues: l_Object_0 (copy), v3 (copy)
    local v18 = l_Object_0.assign({}, v3.BloomConfig, v17 or {});
    v16.Enabled = true;
    v16.Intensity = v18.Intensity;
    v16.Size = v18.Size;
    v16.Threshold = v18.Threshold;
end;
local function _() --[[ Line: 138 ]] --[[ Name: getColorCorrection ]]
    -- upvalues: l_Lighting_0 (copy)
    return (l_Lighting_0:FindFirstChild("ColorCorrection"));
end;
local function _() --[[ Line: 142 ]] --[[ Name: getOrCreateColorCorrection ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_ColorCorrection_0 = l_Lighting_0:FindFirstChild("ColorCorrection");
    if l_ColorCorrection_0 == nil then
        l_ColorCorrection_0 = Instance.new("ColorCorrectionEffect");
        l_ColorCorrection_0.Parent = l_Lighting_0;
    end;
    return l_ColorCorrection_0;
end;
local function v26(v23, v24) --[[ Line: 151 ]] --[[ Name: configureColorCorrection ]]
    -- upvalues: l_Object_0 (copy), v3 (copy)
    local v25 = l_Object_0.assign({}, v3.ColorCorrectionConfig, v24 or {});
    v23.Enabled = true;
    v23.Brightness = v25.Brightness;
    v23.Contrast = v25.Contrast;
    v23.Saturation = v25.Saturation;
end;
return {
    configure = function(v27) --[[ Line: 162 ]] --[[ Name: configure ]]
        -- upvalues: v3 (copy), v6 (copy), l_Lighting_0 (copy), v12 (copy), v19 (copy), v26 (copy)
        local v28 = v3.BloomEnabled or v27 and v27.BloomEnabled or false;
        local v29 = v3.ColorCorrectionEnabled or v27 and v27.ColorCorrectionEnabled or false;
        local v30 = if v27 then v27.LightingConfig else nil;
        local v31 = if v27 then v27.SkyConfig else nil;
        local v32 = if v27 then v27.BloomConfig else nil;
        local v33 = if v27 then v27.ColorCorrectionConfig else nil;
        v6(v30);
        local l_Sky_1 = l_Lighting_0:FindFirstChild("Sky");
        if l_Sky_1 == nil then
            l_Sky_1 = Instance.new("Sky");
            l_Sky_1.Parent = l_Lighting_0;
        end;
        v12(l_Sky_1, v31);
        if v28 then
            local l_Bloom_1 = l_Lighting_0:FindFirstChild("Bloom");
            if l_Bloom_1 == nil then
                l_Bloom_1 = Instance.new("BloomEffect");
                l_Bloom_1.Parent = l_Lighting_0;
            end;
            v19(l_Bloom_1, v32);
        else
            l_Sky_1 = l_Lighting_0:FindFirstChild("Bloom");
            if l_Sky_1 ~= nil then
                l_Sky_1.Enabled = false;
            end;
        end;
        if v29 then
            local l_ColorCorrection_1 = l_Lighting_0:FindFirstChild("ColorCorrection");
            if l_ColorCorrection_1 == nil then
                l_ColorCorrection_1 = Instance.new("ColorCorrectionEffect");
                l_ColorCorrection_1.Parent = l_Lighting_0;
            end;
            v26(l_ColorCorrection_1, v33);
            return;
        else
            l_Sky_1 = l_Lighting_0:FindFirstChild("ColorCorrection");
            if l_Sky_1 ~= nil then
                l_Sky_1.Enabled = false;
            end;
            return;
        end;
    end
};