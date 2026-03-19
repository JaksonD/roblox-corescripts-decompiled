local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Promise_0 = v1.Promise;
local l_default_0 = v1.LinkingProtocol.LinkingProtocol.default;
local l_SettingsRoute_0 = v1.LinkingProtocol.Enums.SettingsRoute;
return function() --[[ Line: 9 ]]
    -- upvalues: l_Promise_0 (copy), l_default_0 (copy), l_SettingsRoute_0 (copy)
    return l_Promise_0.new(function(v5, v6) --[[ Line: 10 ]]
        -- upvalues: l_default_0 (ref), l_SettingsRoute_0 (ref)
        l_default_0:switchToSettingsApp(l_SettingsRoute_0.Microphone):andThen(function() --[[ Line: 12 ]]
            -- upvalues: v5 (copy)
            v5();
        end):catch(function() --[[ Line: 15 ]]
            -- upvalues: v6 (copy)
            v6();
        end);
    end);
end;