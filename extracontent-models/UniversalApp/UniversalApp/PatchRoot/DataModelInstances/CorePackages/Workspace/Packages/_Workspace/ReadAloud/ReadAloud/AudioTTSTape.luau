local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.getFFlagReadAloudDebugPrintouts)();
local v2 = require(l_Parent_0.Properties);
local v3 = require(l_Parent_0.CreateLogger);
local v4 = if v1 then v3(script.Name) else nil;
local v5 = {};
v5.__index = v5;
v5.SetVolume = function(v6, v7) --[[ Line: 64 ]] --[[ Name: SetVolume ]]
    local l_Current_0 = v6.Current;
    repeat
        l_Current_0.audioTextToSpeech.Volume = v7;
        l_Current_0 = l_Current_0.nextNode;
    until l_Current_0 == v6.Current;
end;
v5.SetVoiceId = function(v9, v10) --[[ Line: 72 ]] --[[ Name: SetVoiceId ]]
    local l_Current_1 = v9.Current;
    repeat
        l_Current_1.audioTextToSpeech.VoiceId = v10;
        l_Current_1 = l_Current_1.nextNode;
    until l_Current_1 == v9.Current;
end;
v5.SetPitch = function(v12, v13) --[[ Line: 80 ]] --[[ Name: SetPitch ]]
    local l_Current_2 = v12.Current;
    repeat
        l_Current_2.audioTextToSpeech.Pitch = v13;
        l_Current_2 = l_Current_2.nextNode;
    until l_Current_2 == v12.Current;
end;
v5.SetSpeed = function(v15, v16) --[[ Line: 88 ]] --[[ Name: SetSpeed ]]
    local l_Current_3 = v15.Current;
    repeat
        l_Current_3.audioTextToSpeech.Speed = v16;
        l_Current_3 = l_Current_3.nextNode;
    until l_Current_3 == v15.Current;
end;
local function v26(v18, v19) --[[ Line: 97 ]] --[[ Name: CreateTextTapeAndFillAudioTTSTape ]]
    local v20 = {
        text = v19[1], 
        nextNode = nil
    };
    v18.Current.audioTextToSpeech.Text = v20.text;
    v18.Current.audioTextToSpeech.TimePosition = 0;
    local l_v20_0 = v20;
    local l_nextNode_0 = v18.Current.nextNode;
    local l_v20_1 = v20;
    for v24 = 2, #v19 do
        local v25 = {
            text = v19[v24], 
            nextNode = nil
        };
        if l_nextNode_0.id ~= v18.Current.id then
            l_nextNode_0.audioTextToSpeech.Text = v25.text;
            l_nextNode_0 = l_nextNode_0.nextNode;
            l_v20_0 = v25;
        end;
        l_v20_1.nextNode = v25;
        l_v20_1 = v25;
    end;
    l_v20_1.nextNode = v20;
    v18._nextAvailableTextNode = l_v20_0.nextNode;
    while l_nextNode_0.id ~= v18.Current.id do
        l_nextNode_0.audioTextToSpeech.Text = "";
        l_nextNode_0 = l_nextNode_0.nextNode;
    end;
end;
v5.SetTextChunks = function(v27, v28) --[[ Line: 137 ]] --[[ Name: SetTextChunks ]]
    -- upvalues: v26 (copy)
    if #v28 < 1 then
        v27._nextAvailableTextNode = nil;
        return;
    else
        v27:_DisconnectCycle();
        v26(v27, v28);
        v27:_ConnectCycle();
        return;
    end;
end;
v5.IsPlaying = function(v29) --[[ Line: 154 ]] --[[ Name: IsPlaying ]]
    return v29.Current.audioTextToSpeech.IsPlaying;
end;
v5.IsLoaded = function(v30) --[[ Line: 158 ]] --[[ Name: IsLoaded ]]
    return v30.Current.audioTextToSpeech.IsLoaded;
end;
v5._CycleNodes = function(v31) --[[ Line: 163 ]] --[[ Name: _CycleNodes ]]
    -- upvalues: v4 (copy), v1 (copy)
    if v31._nextAvailableTextNode == nil then
        v4:warning("AudioTTSTape tried to cycle, but there is no text being read");
        return;
    elseif v31._nextAvailableTextNode.nextNode == v31._nextAvailableTextNode then
        return;
    else
        local l_Current_4 = v31.Current;
        local l_nextNode_1 = v31.Current.nextNode;
        while l_nextNode_1.audioTextToSpeech.Text == "" do
            l_nextNode_1 = l_nextNode_1.nextNode;
        end;
        l_Current_4.audioTextToSpeech.Text = v31._nextAvailableTextNode.text;
        v31._nextAvailableTextNode = v31._nextAvailableTextNode.nextNode;
        if v31._preloading then
            l_Current_4.audioTextToSpeech:Unload();
        else
            local v37 = coroutine.create(function() --[[ Line: 192 ]]
                -- upvalues: v1 (ref), v4 (ref), l_Current_4 (copy)
                if v1 then
                    v4:debug("Cycle forcing preload on completed node");
                end;
                local v34 = os.clock();
                local v35 = l_Current_4.audioTextToSpeech:LoadAsync();
                local v36 = os.clock() - v34;
                if v35 ~= Enum.AssetFetchStatus.Success then
                    v4:error("Failed to preload a node");
                elseif v1 then
                    v4:debug("Preloaded node");
                end;
                if v1 then
                    v4:info((("Preload results: %*, %*"):format(v35, v36)));
                end;
            end);
            task.spawn(v37);
        end;
        v31:_DisconnectCycle();
        v31.Current = l_nextNode_1;
        v31:_ConnectCycle();
        return;
    end;
end;
v5._ConnectCycle = function(v38) --[[ Line: 220 ]] --[[ Name: _ConnectCycle ]]
    v38._currAudioEndedConnection = v38.Current.audioTextToSpeech.Ended:Connect(function() --[[ Line: 221 ]]
        -- upvalues: v38 (copy)
        v38.AudioEnded:Fire();
        v38:_CycleNodes();
    end);
end;
v5._DisconnectCycle = function(v39) --[[ Line: 228 ]] --[[ Name: _DisconnectCycle ]]
    local l__currAudioEndedConnection_0 = v39._currAudioEndedConnection;
    if l__currAudioEndedConnection_0 then
        l__currAudioEndedConnection_0:Disconnect();
    end;
    v39._currAudioEndedConnection = nil;
end;
local function v48(v41, v42, v43) --[[ Line: 237 ]] --[[ Name: iteratePreloadCoroutine ]]
    -- upvalues: v1 (copy), v4 (copy)
    if v1 then
        v4:debug((("Preload coroutine ID %* started"):format(v43)));
    end;
    v41._preloading = true;
    local l_nextNode_2 = v42.nextNode;
    while l_nextNode_2.id ~= v41.Current.id and v43 == v41._preloadCoroutineID do
        if l_nextNode_2.audioTextToSpeech.Text ~= "" and not l_nextNode_2.audioTextToSpeech.IsLoaded then
            local v45 = os.clock();
            local v46 = l_nextNode_2.audioTextToSpeech:LoadAsync();
            local v47 = os.clock() - v45;
            if v46 ~= Enum.AssetFetchStatus.Success then
                v4:error("Failed to preload a node");
            elseif v1 then
                v4:debug("Preloaded node");
            end;
            if v1 then
                v4:info((("Preload results: %*, %*"):format(v46, v47)));
            end;
            task.wait(v41.PreloadDelay);
        end;
        l_nextNode_2 = l_nextNode_2.nextNode;
    end;
    v41._preloading = false;
    if v1 then
        v4:debug((("Preload coroutine ID %* stopped"):format(v43)));
    end;
end;
v5.InitiatePreload = function(v49) --[[ Line: 271 ]] --[[ Name: InitiatePreload ]]
    -- upvalues: v4 (copy), v2 (copy), v48 (copy)
    if v49._nextAvailableTextNode == nil then
        v4:warning("AudioTTSTape tried to preload audio, but there is no text being read.");
        return;
    elseif v49.Current.nextNode.id == v49.Current.id then
        return;
    else
        v49._preloadCoroutineID = (v49._preloadCoroutineID + 1) % v2.MAX_PRELOAD_COROUTINES;
        local v50 = coroutine.create(function() --[[ Line: 284 ]]
            -- upvalues: v48 (ref), v49 (copy)
            v48(v49, v49.Current, v49._preloadCoroutineID);
        end);
        task.spawn(v50);
        return;
    end;
end;
v5.Load = function(v51) --[[ Line: 290 ]] --[[ Name: Load ]]
    -- upvalues: v4 (copy)
    if v51._nextAvailableTextNode then
        local v52 = os.clock();
        local v53 = v51.Current.audioTextToSpeech:LoadAsync();
        v51:InitiatePreload();
        return {
            status = v53, 
            time = os.clock() - v52
        };
    else
        v4:warning("AudioTTSTape tried to load audio, but there is no text being read.");
        return {
            status = Enum.AssetFetchStatus.Failure, 
            time = -1
        };
    end;
end;
v5.Play = function(v54) --[[ Line: 303 ]] --[[ Name: Play ]]
    -- upvalues: v4 (copy)
    if v54._nextAvailableTextNode then
        if not v54:IsLoaded() then
            v54:Load();
        end;
        v54.Current.audioTextToSpeech:Play();
        return;
    else
        v4:warning("AudioTTSTape tried to play audio, but no text is being read.");
        return;
    end;
end;
v5.Pause = function(v55) --[[ Line: 315 ]] --[[ Name: Pause ]]
    v55.Current.audioTextToSpeech:Pause();
end;
v5.new = function(v56, v57, v58, v59) --[[ Line: 320 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v60 = setmetatable({}, v5);
    v56 = math.max(math.floor(v56), 1);
    v60.Length = v56;
    v60.PreloadDelay = v57;
    v60.CurrentAudioLoaded = Instance.new("BindableEvent");
    v60.CurrentAudioLoaded.Name = "Current Audio Loaded Event";
    v60.CurrentAudioLoaded.Parent = v58;
    v60._preloadCoroutineID = 0;
    v60._preloading = false;
    local v61 = nil;
    local v62 = nil;
    local v63 = 0;
    for v64 = 1, v56 do
        local l_AudioTextToSpeech_0 = Instance.new("AudioTextToSpeech");
        l_AudioTextToSpeech_0.Parent = v58;
        local l_Wire_0 = Instance.new("Wire");
        l_Wire_0.Parent = l_AudioTextToSpeech_0;
        l_Wire_0.SourceInstance = l_AudioTextToSpeech_0;
        l_Wire_0.TargetInstance = v59;
        local v67 = {
            audioTextToSpeech = l_AudioTextToSpeech_0, 
            nextNode = nil, 
            id = v63
        };
        if v64 == 1 then
            v62 = v67;
        end;
        if v61 then
            v61.nextNode = v67;
        end;
        v61 = v67;
        v63 = v63 + 1;
    end;
    v61.nextNode = v62;
    v60.Current = v61;
    v60.AudioEnded = Instance.new("BindableEvent");
    v60.AudioEnded.Name = "Audio Ended Event";
    v60.AudioEnded.Parent = v58;
    v60:_ConnectCycle();
    return v60;
end;
return v5;