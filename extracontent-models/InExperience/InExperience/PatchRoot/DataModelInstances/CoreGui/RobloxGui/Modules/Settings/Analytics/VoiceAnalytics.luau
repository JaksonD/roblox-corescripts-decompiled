local v0 = require(script.Parent.Parent.Resources.Constants);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v4 = {
        _eventStreamImpl = v2, 
        _target = "EventIngest", 
        _context = v3 or "SettingsHub"
    };
    setmetatable(v4, v1);
    return v4;
end;
v1.onToggleMuteAll = function(v5, v6) --[[ Line: 17 ]] --[[ Name: onToggleMuteAll ]]
    if v6 then
        v5:onMuteAll();
        return;
    else
        v5:onUnmuteAll();
        return;
    end;
end;
v1.onToggleMuteSelf = function(v7, v8) --[[ Line: 25 ]] --[[ Name: onToggleMuteSelf ]]
    if v8 then
        v7:onMuteSelf();
        return;
    else
        v7:onUnmuteSelf();
        return;
    end;
end;
v1.onToggleMutePlayer = function(v9, v10, v11) --[[ Line: 33 ]] --[[ Name: onToggleMutePlayer ]]
    if v11 then
        v9:onMutePlayer(v10);
        return;
    else
        v9:onUnmutePlayer(v10);
        return;
    end;
end;
v1.onMuteSelf = function(v12) --[[ Line: 41 ]] --[[ Name: onMuteSelf ]]
    -- upvalues: v0 (copy)
    local l_MuteSelf_0 = v0.VoiceAnalytics.MuteSelf;
    v12._eventStreamImpl:setRBXEventStream(v12._target, v12._context, l_MuteSelf_0, {});
end;
v1.onUnmuteSelf = function(v14) --[[ Line: 46 ]] --[[ Name: onUnmuteSelf ]]
    -- upvalues: v0 (copy)
    local l_UnmuteSelf_0 = v0.VoiceAnalytics.UnmuteSelf;
    v14._eventStreamImpl:setRBXEventStream(v14._target, v14._context, l_UnmuteSelf_0, {});
end;
v1.onMuteAll = function(v16) --[[ Line: 51 ]] --[[ Name: onMuteAll ]]
    -- upvalues: v0 (copy)
    local l_MuteAll_0 = v0.VoiceAnalytics.MuteAll;
    v16._eventStreamImpl:setRBXEventStream(v16._target, v16._context, l_MuteAll_0, {});
end;
v1.onUnmuteAll = function(v18) --[[ Line: 56 ]] --[[ Name: onUnmuteAll ]]
    -- upvalues: v0 (copy)
    local l_UnmuteAll_0 = v0.VoiceAnalytics.UnmuteAll;
    v18._eventStreamImpl:setRBXEventStream(v18._target, v18._context, l_UnmuteAll_0, {});
end;
v1.onMutePlayer = function(v20, v21) --[[ Line: 61 ]] --[[ Name: onMutePlayer ]]
    -- upvalues: v0 (copy)
    local l_MutePlayer_0 = v0.VoiceAnalytics.MutePlayer;
    v20._eventStreamImpl:setRBXEventStream(v20._target, v20._context, l_MutePlayer_0, {
        mutedUserId = v21
    });
end;
v1.onUnmutePlayer = function(v23, v24) --[[ Line: 68 ]] --[[ Name: onUnmutePlayer ]]
    -- upvalues: v0 (copy)
    local l_UnmutePlayer_0 = v0.VoiceAnalytics.UnmutePlayer;
    v23._eventStreamImpl:setRBXEventStream(v23._target, v23._context, l_UnmutePlayer_0, {
        mutedUserId = v24
    });
end;
return v1;