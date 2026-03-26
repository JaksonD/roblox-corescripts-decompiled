local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugMusicSampleSounds);
local l_useEffect_0 = v2.useEffect;
local v5 = {
    {
        className = "Sound", 
        title = "Beach Morning LoFi", 
        assetId = "rbxassetid://83784623771159", 
        position = Vector3.new(50, 0, 0, 0)
    }, 
    {
        className = "AudioPlayer", 
        title = "Mirage Portal", 
        assetId = "rbxassetid://75793628822368", 
        position = Vector3.new(-50, 0, 0, 0)
    }, 
    {
        className = "Sound", 
        title = "Altogether Elsewhere", 
        assetId = "rbxassetid://73856926671353", 
        position = Vector3.new(0, 0, 50, 0)
    }, 
    {
        className = "Sound", 
        title = "Shiawase", 
        assetId = "rbxassetid://5409360995", 
        position = Vector3.new(0, 0, -50, 0)
    }, 
    {
        className = "Sound", 
        title = "Life in an Elevator", 
        assetId = "rbxassetid://1841647093", 
        position = Vector3.new(100, 0, 0, 0), 
        shouldSurfaceToUser = false
    }, 
    {
        className = "Sound", 
        title = "Explosion", 
        assetId = "rbxassetid://157878578", 
        position = Vector3.new(0, 0, 100, 0), 
        shouldSurfaceToUser = false
    }
};
local function v12(v6) --[[ Line: 68 ]] --[[ Name: spawnAudioEmitter ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Position = v6.position;
    l_Part_0.Anchored = true;
    l_Part_0.Name = v6.title;
    if v6.className == "Sound" then
        local l_Sound_0 = Instance.new("Sound");
        l_Sound_0.SoundId = v6.assetId;
        l_Sound_0.Looped = true;
        l_Sound_0.RollOffMinDistance = 10;
        l_Sound_0.RollOffMaxDistance = 40;
        l_Sound_0.Parent = l_Part_0;
        l_Sound_0:Play();
    else
        local l_AudioPlayer_0 = Instance.new("AudioPlayer");
        l_AudioPlayer_0.Asset = v6.assetId;
        l_AudioPlayer_0.Looping = true;
        l_AudioPlayer_0.Parent = l_Part_0;
        local l_AudioEmitter_0 = Instance.new("AudioEmitter");
        l_AudioEmitter_0.Parent = l_Part_0;
        local l_Wire_0 = Instance.new("Wire");
        l_Wire_0.SourceInstance = l_AudioPlayer_0;
        l_Wire_0.TargetInstance = l_AudioEmitter_0;
        l_Wire_0.Parent = l_AudioPlayer_0;
        l_AudioPlayer_0:Play();
    end;
    l_Part_0.Parent = workspace;
    return l_Part_0;
end;
return function() --[[ Line: 106 ]] --[[ Name: DebugAudioEmitters ]]
    -- upvalues: v3 (copy), l_useEffect_0 (copy), v5 (copy), v12 (copy), l_ReplicatedStorage_0 (copy)
    if v3() then
        l_useEffect_0(function() --[[ Line: 108 ]]
            local l_AudioListener_0 = Instance.new("AudioListener");
            local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
            l_AudioDeviceOutput_0.Parent = l_AudioListener_0;
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = l_AudioListener_0;
            l_Wire_1.TargetInstance = l_AudioDeviceOutput_0;
            l_Wire_1.Parent = l_AudioListener_0;
            l_AudioListener_0.Parent = workspace.CurrentCamera;
        end, {});
        l_useEffect_0(function() --[[ Line: 122 ]]
            -- upvalues: v5 (ref), v12 (ref), l_ReplicatedStorage_0 (ref)
            local v16 = {};
            for _, v18 in v5 do
                local v19 = v12(v18);
                local l_BillboardGui_0 = Instance.new("BillboardGui");
                l_BillboardGui_0.ExtentsOffsetWorldSpace = Vector3.new(0, 10, 0, 0);
                l_BillboardGui_0.Size = UDim2.fromScale(10, 2);
                l_BillboardGui_0.Adornee = v19;
                local l_TextLabel_0 = Instance.new("TextLabel");
                l_TextLabel_0.Text = v18.title;
                l_TextLabel_0.Size = UDim2.fromScale(1, 1);
                l_TextLabel_0.Font = Enum.Font.BuilderSansBold;
                l_TextLabel_0.TextScaled = true;
                l_TextLabel_0.TextColor3 = if v18.shouldSurfaceToUser == false then Color3.fromHex("#c4474f") else Color3.fromHex("#fff");
                l_TextLabel_0.BackgroundTransparency = 1;
                l_TextLabel_0.Parent = l_BillboardGui_0;
                local l_UIStroke_0 = Instance.new("UIStroke");
                l_UIStroke_0.Color = Color3.fromHex("#202020");
                l_UIStroke_0.Thickness = 2;
                l_UIStroke_0.Parent = l_TextLabel_0;
                l_BillboardGui_0.Parent = v19;
                table.insert(v16, v19);
            end;
            local l_Sound_1 = Instance.new("Sound");
            l_Sound_1.SoundId = "rbxassetid://9048375035";
            l_Sound_1.Volume = 0.05;
            l_Sound_1.Looped = true;
            l_Sound_1.Parent = l_ReplicatedStorage_0;
            l_Sound_1:Play();
            return function() --[[ Line: 161 ]]
                -- upvalues: l_Sound_1 (copy), v16 (copy)
                l_Sound_1:Destroy();
                for _, v25 in v16 do
                    v25:Destroy();
                end;
            end;
        end, {});
    end;
    return nil;
end;