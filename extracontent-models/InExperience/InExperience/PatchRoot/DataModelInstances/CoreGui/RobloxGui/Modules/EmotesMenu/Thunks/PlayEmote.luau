local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v7 = require(l_Parent_0.Analytics);
local v8 = require(l_Parent_0.Constants);
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v11 = require(l_CoreGui_0.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer);
local v12 = require(l_Actions_0.HideMenu);
local v13 = require(l_Actions_0.HideError);
local v14 = require(l_Actions_0.ShowError);
local v15 = v7.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0));
local function v23(v16, v17, v18, v19) --[[ Line: 29 ]] --[[ Name: handlePlayFailure ]]
    -- upvalues: v15 (copy), v8 (copy), v10 (copy), v14 (copy), v13 (copy), v12 (copy)
    if v17 then
        v15:onEmoteFailed(v18, v19, v17);
        local l_locale_0 = v16:getState().locale;
        local v21 = v8.LocalizationKeys.ErrorMessages[v17];
        local v22 = v10:FormatByKeyForLocale(v21, l_locale_0);
        v16:dispatch(v14(v22));
        delay(v8.ErrorDisplayTimeSeconds, function() --[[ Line: 38 ]]
            -- upvalues: v16 (copy), v13 (ref)
            v16:dispatch(v13());
        end);
    end;
    v16:dispatch(v12());
end;
return function(_, v25, v26, _, _) --[[ Line: 46 ]] --[[ Name: PlayEmote ]]
    -- upvalues: l_LocalPlayer_0 (copy), v11 (copy), v23 (copy), v12 (copy), v15 (copy), v8 (copy)
    return function(v29) --[[ Line: 47 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v11 (ref), v23 (ref), v25 (copy), v26 (copy), v12 (ref), v15 (ref), v8 (ref)
        local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
        if v11(l_l_LocalPlayer_0_0, function(v31) --[[ Line: 49 ]]
            -- upvalues: v23 (ref), v29 (copy), v25 (ref), v26 (ref)
            v23(v29, v31, v25, v26);
        end) then
            return;
        else
            v29:dispatch(v12());
            local l_Humanoid_0 = l_l_LocalPlayer_0_0.Character:FindFirstChildOfClass("Humanoid");
            local v33, v34, _ = pcall(function() --[[ Line: 59 ]]
                -- upvalues: l_Humanoid_0 (copy), v26 (ref)
                return l_Humanoid_0:PlayEmoteAndGetAnimTrackById(v26);
            end);
            if v33 and v34 then
                v15:onEmotePlayed(v25, v26);
                return;
            else
                v23(v29, v8.ErrorTypes.TemporarilyUnavailable, v25, v26);
                return;
            end;
        end;
    end;
end;