local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RealtimeDelivery);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Parent_0.AppChatNetworking);
local l_partyChatTimeoutReceivedSignal_0 = require(l_Parent_0.InterventionShared).Signals.partyChatTimeoutReceivedSignal;
local v7 = require(l_script_FirstAncestor_0.Utils.getContainsChatSetting);
local v8 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return function(_) --[[ Line: 15 ]] --[[ Name: AppChatInterventionEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v7 (copy), v5 (copy), v8 (copy), v2 (copy), l_partyChatTimeoutReceivedSignal_0 (copy)
    local v10 = l_useDispatch_0();
    v3.useRealtimeNamespace("UserSettingsChanged", function(v11) --[[ Line: 17 ]]
        -- upvalues: v7 (ref), v10 (copy), v5 (ref), v8 (ref)
        if v11.SettingsChanged and v7(v11.SettingsChanged) then
            v10(v5.rodux.GetChatModerationStatuses.API()):catch(function(v12) --[[ Line: 20 ]]
                -- upvalues: v8 (ref)
                v8:warning("NetworkingChat failure in UserSettingsChanged->GetChatModerationStatuses, Status: " .. tostring(v12));
            end);
        end;
    end, {
        v10
    });
    v2.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: l_partyChatTimeoutReceivedSignal_0 (ref), v10 (copy), v5 (ref), v8 (ref)
        local v15 = l_partyChatTimeoutReceivedSignal_0:connect(function(v13) --[[ Line: 30 ]]
            -- upvalues: v10 (ref), v5 (ref), v8 (ref)
            v10(v5.rodux.GetChatModerationStatuses.API(if v13 then {
                v13
            } else {})):catch(function(v14) --[[ Line: 33 ]]
                -- upvalues: v8 (ref)
                v8:warning("NetworkingChat failure in partyChatTimeoutReceivedSignal->GetChatModerationStatuses, Status: " .. tostring(v14));
            end);
        end);
        return function() --[[ Line: 40 ]]
            -- upvalues: v15 (copy)
            if v15 then
                v15:disconnect();
            end;
        end;
    end, {
        v10
    });
    return nil;
end;