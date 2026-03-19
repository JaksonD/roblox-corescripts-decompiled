local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
local v3 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v4 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v7 = require(l_Parent_0.AppChatNetworking);
return function() --[[ Line: 13 ]]
    -- upvalues: v4 (copy), v7 (copy), v3 (copy), v6 (copy), v2 (copy)
    v4:info("Fetching chat metadata...");
    return function(v8) --[[ Line: 16 ]]
        -- upvalues: v7 (ref), v4 (ref), v3 (ref), v6 (ref), v2 (ref)
        local l_LocalUserId_0 = v8:getState().LocalUserId;
        return v8:dispatch(v7.rodux.GetMetadata.API()):andThen(function(v10) --[[ Line: 20 ]]
            -- upvalues: v4 (ref), l_LocalUserId_0 (copy), v3 (ref), v6 (ref), v8 (copy), v2 (ref)
            local l_isChatEnabled_0 = v10.responseBody.isChatEnabled;
            if l_isChatEnabled_0 then
                v4:info("Chat is enabled and privacy settings allow chat");
                if l_LocalUserId_0 then
                    v3.new(v6, l_LocalUserId_0):userLoadedChat();
                end;
            else
                v4:info("Chat is disabled or privacy settings do not allow chat");
            end;
            v8:dispatch(v2(l_isChatEnabled_0));
            return l_isChatEnabled_0;
        end):catch(function(v12) --[[ Line: 37 ]]
            -- upvalues: v4 (ref)
            v4:warning("FetchChatData failed with error: {}", (tostring(v12)));
        end);
    end;
end;