local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Stores.GetVoiceStore);
local _ = require(l_script_FirstAncestor_0.Stores.GetVoiceStore.createVoiceStore);
local v7 = v5(false);
local v8 = v2.createSignal(nil);
return function(v9) --[[ Line: 24 ]] --[[ Name: withSignalsData ]]
    -- upvalues: v7 (copy), l_useSignalState_0 (copy), v8 (copy), v4 (copy)
    return function(v10) --[[ Line: 25 ]]
        -- upvalues: v7 (ref), l_useSignalState_0 (ref), v8 (ref), v4 (ref), v9 (copy)
        local l_userId_0 = v10.userId;
        local v12 = if l_userId_0 then v7.getOrCreateVoiceState(l_userId_0) else nil;
        local v13 = l_useSignalState_0(v12 or v8);
        local v14 = table.clone(v10);
        v14.voiceState = v13;
        return v4.createElement(v9, v14);
    end;
end;