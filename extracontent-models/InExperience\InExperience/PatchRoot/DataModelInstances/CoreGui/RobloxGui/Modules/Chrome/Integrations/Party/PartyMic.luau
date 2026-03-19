local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local l_GetFFlagEnableCrossExpVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice;
local v5 = require(l_script_FirstAncestor_0.Service);
local v6 = require(l_script_FirstAncestor_0.Integrations.Party.PartyMicIcon);
local v7 = require(l_script_FirstAncestor_0.Integrations.Party.Constants);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_default_0 = v3.CrossExperienceVoiceManager.default;
local v10 = nil;
local v11 = false;
local v12 = l_Signal_0.new();
local v13 = l_Signal_0.new();
v12:connect(function(v14) --[[ Line: 22 ]]
    -- upvalues: v10 (ref)
    v10 = v14;
end);
v13:connect(function(v15) --[[ Line: 26 ]]
    -- upvalues: v11 (ref)
    v11 = v15;
end);
local v16 = nil;
if l_GetFFlagEnableCrossExpVoice_0() then
    v16 = v5:register({
        id = v7.TOGGLE_MIC_INTEGRATION_ID, 
        label = "CoreScripts.TopBar.ToggleMic", 
        activated = function() --[[ Line: 36 ]] --[[ Name: activated ]]
            -- upvalues: l_Players_0 (copy), v11 (ref), v10 (ref), l_default_0 (copy)
            local v17 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or -1;
            if v17 ~= -1 and v11 and v10 ~= nil then
                if v10 then
                    l_default_0:unmuteVoiceParticipant(v17);
                    return;
                else
                    l_default_0:muteVoiceParticipant(v17);
                end;
            end;
        end, 
        components = {
            Icon = function() --[[ Line: 47 ]] --[[ Name: Icon ]]
                -- upvalues: v6 (copy), v12 (copy), v13 (copy)
                return v6({
                    isLocalPlayerMutedSignal = v12, 
                    isVoiceConnectedSignal = v13
                });
            end
        }, 
        initialAvailability = v5.AvailabilitySignal.Unavailable
    });
end;
return v16;