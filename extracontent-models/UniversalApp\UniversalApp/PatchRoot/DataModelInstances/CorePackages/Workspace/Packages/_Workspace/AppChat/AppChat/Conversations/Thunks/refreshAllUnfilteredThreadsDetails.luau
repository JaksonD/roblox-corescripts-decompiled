local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v5 = require(l_script_FirstAncestor_0.Conversations.Thunks.multiGetConversationDetails);
local v6 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v7 = require(l_Parent_0.AppChatNetworking);
local v8 = require(script.Parent.refreshConversationUnfilteredThreadsDetails);
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local v10 = require(l_script_FirstAncestor_0.Flags.FIntUnfilteredThreadsPvDelayMs);
return function(v11, v12) --[[ Line: 21 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy), v10 (copy), v5 (copy), v6 (copy), v7 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v8 (copy)
    return function(v13) --[[ Line: 22 ]]
        -- upvalues: v4 (ref), v2 (ref), v3 (ref), v10 (ref), v5 (ref), v6 (ref), v7 (ref), v12 (copy), v11 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v8 (ref)
        local v14 = v13:getState();
        local v15 = v4(v14, "ChatAppReducer.Conversations") or {};
        local v17 = v2.List.filterMap(v2.Dictionary.values(v15), function(v16) --[[ Line: 25 ]]
            if v16 and v16.id and v16.source ~= "friends" then
                return v16.id;
            else
                return nil;
            end;
        end);
        return v3.delay(v10 / 1000):andThen(function() --[[ Line: 34 ]]
            -- upvalues: v17 (copy), v13 (copy), v5 (ref), v6 (ref), v7 (ref), v12 (ref), v11 (ref), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v8 (ref)
            if v17 then
                v13:dispatch(v5(v17)):catch(function(v18) --[[ Line: 36 ]]
                    -- upvalues: v6 (ref)
                    v6:warning("Error in multiGetConversationDetails thunk. Error: {}", (tostring(v18)));
                end);
            end;
            v13:dispatch(v7.rodux.GetChatLandingModal.API(v12)):catch(function(v19) --[[ Line: 40 ]]
                -- upvalues: v6 (ref)
                v6:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v19)));
            end);
            if v11 then
                if l_FFlagAppChatEnableDoubleOptIn_0 then
                    v13:dispatch(v8(v11, v12));
                    return;
                else
                    v13:dispatch(v7.rodux.GetConversationTopModal.API(v11, v12)):catch(function(v20) --[[ Line: 53 ]]
                        -- upvalues: v6 (ref)
                        v6:warning("Error in refreshAllUnfilteredThreadsDetails->GetConversationTopModal. Error: {}", (tostring(v20)));
                    end);
                end;
            end;
        end);
    end;
end;