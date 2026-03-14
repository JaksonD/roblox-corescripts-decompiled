local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RealtimeDelivery);
local v4 = require(l_script_FirstAncestor_0.Signals.GetAgeVerifiedChangedSignal);
local l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 = require(l_Parent_0.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace;
SocialUpsellEventReceiver = function(v6) --[[ Line: 16 ]] --[[ Name: SocialUpsellEventReceiver ]]
    -- upvalues: v3 (copy), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (copy), v4 (copy), v2 (copy), l_Parent_0 (copy)
    v3.useRealtimeConnectionStateChanged(l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, function(v7, v8) --[[ Line: 19 ]]
        -- upvalues: v4 (ref)
        if v7 == Enum.ConnectionState.Connected and v8 then
            v4():fire();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref)
        if v6.shouldRequestAppAgeSignals then
            require(l_Parent_0.AppStoreAgeSignalsManager).AppAgeSignalsManager.requestAppAgeSignals():catch(function() --[[ Line: 31 ]]

            end);
        end;
    end, {
        v6.shouldRequestAppAgeSignals
    });
    v2.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v6 (copy), v4 (ref)
        local v9 = nil;
        if v6.onAgeVerifiedChange then
            v9 = v4():connect(v6.onAgeVerifiedChange);
        end;
        return function() --[[ Line: 40 ]]
            -- upvalues: v9 (ref)
            if v9 then
                v9:disconnect();
            end;
        end;
    end, {
        v6.onAgeVerifiedChange
    });
    return nil;
end;
return SocialUpsellEventReceiver;