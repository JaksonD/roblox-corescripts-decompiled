local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_Players_0 = game:GetService("Players");
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v7 = require(l_script_FirstAncestor_0.Analytics.KeystrokeEvent);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatBehaviorCollectionEnabledMaster);
local v9 = require(l_script_FirstAncestor_0.Flags.getFIntAppChatBehaviorCollectionEnabledPercentage);
local v10 = {
    Enum.KeyCode.Return, 
    Enum.KeyCode.KeypadEnter
};
return function(v11) --[[ Line: 33 ]] --[[ Name: useKeystrokeCollection ]]
    -- upvalues: v2 (copy), l_getAppFeaturePolicies_0 (copy), v8 (copy), v9 (copy), l_Players_0 (copy), l_default_0 (copy), v7 (copy), v3 (copy), v10 (copy)
    local v12 = v2.useRef(false);
    local v13 = v2.useRef({});
    local v14 = v2.useRef({});
    local v15 = v2.useRef({});
    v2.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: l_getAppFeaturePolicies_0 (ref), v8 (ref), v9 (ref), l_Players_0 (ref), v12 (copy)
        local v16 = l_getAppFeaturePolicies_0().getKeystrokeCollectionEnabled();
        if v8() then
            local v17 = v9();
            if v17 > 0 and l_Players_0.LocalPlayer and v16 then
                v12.current = l_Players_0.LocalPlayer.UserId % 100 < v17;
            end;
        end;
    end, {});
    local v19 = v2.useCallback(function(v18) --[[ Line: 49 ]]
        -- upvalues: v13 (copy), v11 (copy), l_default_0 (ref), v7 (ref), v14 (copy), v15 (copy)
        if #v13.current >= 0 then
            v11.eventLoggingFunc(l_default_0, v7, {}, {
                chatContext = v18, 
                keyPressedData = table.concat(v13.current, ","), 
                eventTypeData = table.concat(v14.current, ","), 
                timestampData = table.concat(v15.current, ",")
            });
            v13.current = {};
            v14.current = {};
            v15.current = {};
        end;
    end, {
        v11.eventLoggingFunc
    });
    local v22 = v2.useCallback(function(v20, v21) --[[ Line: 63 ]]
        -- upvalues: v12 (copy), v13 (copy), v14 (copy), v15 (copy), v3 (ref), v10 (ref), v11 (copy), v19 (copy)
        if not v12.current then
            return;
        else
            if v20 then
                table.insert(v13.current, v21.Name);
                table.insert(v14.current, 0);
                table.insert(v15.current, DateTime.now().UnixTimestampMillis);
            elseif v3.List.find(v10, v21) == nil or #v13.current ~= 0 then
                table.insert(v13.current, v21.Name);
                table.insert(v14.current, 1);
                table.insert(v15.current, DateTime.now().UnixTimestampMillis);
            end;
            if #v13.current >= (v11.maxKeystrokeDataLength or 200) then
                v19("UAMaxLengthReached");
            end;
            return;
        end;
    end, {
        v19, 
        v11.maxKeystrokeDataLength
    });
    local v25 = v2.useCallback(function(v23) --[[ Line: 88 ]]
        -- upvalues: v12 (copy), v13 (copy), v15 (copy), v11 (copy), v19 (copy)
        if not v12.current then
            return;
        else
            local v24 = string.sub(v23, -1);
            table.insert(v13.current, v24);
            table.insert(v15.current, DateTime.now().UnixTimestampMillis);
            if #v13.current >= (v11.maxKeystrokeDataLength or 200) then
                v19("UAMaxLengthReached");
            end;
            return;
        end;
    end, {
        v19, 
        v11.maxKeystrokeDataLength
    });
    local v26 = v2.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v12 (copy), v19 (copy)
        if v12.current then
            v19("UASendPressed");
        end;
    end, {
        v19
    });
    return {
        recordKeystroke = v22, 
        recordTextChange = v25, 
        sendKeystrokeEventOnSend = v26
    };
end;