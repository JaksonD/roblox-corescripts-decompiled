local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.Signals);
local _ = require(script.types);
local v3 = require(script.createAudioPlaybackStore);
return v1.createComputed(v3);