local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_Parent_0.SocialCommon);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v5 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v6 = false;
return v2.makeActionCreator(script.Name, function(v7) --[[ Line: 16 ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (ref)
    if v4 and v7 ~= nil then
        v5.start(v5.Events.ChatLandingTTI, {
            entryPoint = v7, 
            coldStart = not v6
        });
        v6 = true;
    end;
    return {
        entryPoint = v7
    };
end);