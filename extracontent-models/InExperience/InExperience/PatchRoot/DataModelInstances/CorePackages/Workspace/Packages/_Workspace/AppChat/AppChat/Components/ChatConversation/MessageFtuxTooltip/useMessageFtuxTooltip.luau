local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v8 = require(script.Parent.MessageFtuxTooltipVariant);
local v9 = require(script.Parent.MessageFtuxTooltipDismissSignal);
local v10 = require(script.Parent.useMessageFtuxTooltipConfig);
local v11 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversationTelemetryEvents);
local v12 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseSwipeForReplies);
return function(v14) --[[ Line: 27 ]] --[[ Name: useMessageFtuxTooltip ]]
    -- upvalues: v8 (copy), v10 (copy), v7 (copy), v12 (copy), l_useLocalUserId_0 (copy), v4 (copy), v11 (copy), v13 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), v9 (copy), l_useLocalization_0 (copy)
    if v14 == v8.None then
        return {
            text = "", 
            isDismissed = true, 
            handleDismiss = function() --[[ Line: 32 ]] --[[ Name: handleDismiss ]]

            end
        };
    else
        local v15 = v10(v14);
        local v16 = v7(v12.Context);
        local v17 = l_useLocalUserId_0() or "";
        local v18, v19 = v4.useState(true);
        local v20 = v4.useRef({});
        local v21 = v4.useCallback(function() --[[ Line: 42 ]]
            -- upvalues: v11 (ref), v16 (copy), v14 (copy)
            if v11.ConversationMessageFtuxTooltipImpression then
                v16.emit(v11.ConversationMessageFtuxTooltipImpression, {
                    tooltipVariant = v14
                });
            end;
        end, {
            v14, 
            v16
        });
        local v22 = v4.useCallback(function() --[[ Line: 51 ]]
            -- upvalues: v11 (ref), v16 (copy), v14 (copy)
            if v11.ConversationMessageFtuxTooltipDismissed then
                v16.emit(v11.ConversationMessageFtuxTooltipDismissed, {
                    tooltipVariant = v14
                });
            end;
        end, {
            v14, 
            v16
        });
        local v25 = v4.useCallback(function() --[[ Line: 60 ]]
            -- upvalues: v18 (copy), v22 (copy), v20 (copy), v17 (copy), v13 (ref), v15 (copy), l_AppStorageService_0 (ref), l_HttpService_0 (ref), v19 (copy)
            if v18 then
                return;
            else
                v22();
                v20.current[v17] = not v13 or v15.textKey;
                local l_status_0, _ = pcall(function() --[[ Line: 66 ]]
                    -- upvalues: l_AppStorageService_0 (ref), v15 (ref), l_HttpService_0 (ref), v20 (ref)
                    l_AppStorageService_0:SetItem(v15.storageKey, l_HttpService_0:JSONEncode(v20.current));
                    l_AppStorageService_0:Flush();
                end);
                v19(l_status_0);
                return;
            end;
        end, {
            v15.storageKey, 
            v17, 
            v18
        });
        v4.useEffect(function() --[[ Line: 73 ]]
            -- upvalues: l_AppStorageService_0 (ref), v15 (copy), l_HttpService_0 (ref), v20 (copy), v13 (ref), v17 (copy), v19 (copy), v21 (copy)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 74 ]]
                -- upvalues: l_AppStorageService_0 (ref), v15 (ref), l_HttpService_0 (ref)
                local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v15.storageKey);
                return l_HttpService_0:JSONDecode(l_l_AppStorageService_0_Item_0);
            end);
            v20.current = if l_status_1 then l_result_1 else {};
            local v29 = if v13 then v20.current[v17] == v15.textKey else v20.current[v17] or false;
            v19(v29);
            if not v29 then
                v21();
            end;
        end, {
            v15.storageKey, 
            v17
        });
        v4.useEffect(function() --[[ Line: 88 ]]
            -- upvalues: v18 (copy), v9 (ref), v14 (copy), v25 (copy)
            if v18 then
                return;
            else
                local v31 = v9.dismissed:connect(function(v30) --[[ Line: 92 ]]
                    -- upvalues: v14 (ref), v25 (ref)
                    if v30 == v14 then
                        v25();
                    end;
                end);
                return function() --[[ Line: 97 ]]
                    -- upvalues: v31 (copy)
                    v31:disconnect();
                end;
            end;
        end, {
            v14, 
            v25, 
            v18
        });
        local v32 = l_useLocalization_0({
            tooltipText = v15.textKey
        });
        return v4.useMemo(function() --[[ Line: 105 ]]
            -- upvalues: v32 (copy), v18 (copy), v25 (copy)
            return {
                text = v32.tooltipText, 
                isDismissed = v18, 
                handleDismiss = v25
            };
        end, {
            v32.tooltipText, 
            v18, 
            v25
        });
    end;
end;