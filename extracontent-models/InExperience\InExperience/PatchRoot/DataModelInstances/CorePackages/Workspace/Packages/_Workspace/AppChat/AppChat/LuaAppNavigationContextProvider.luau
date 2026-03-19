local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.LuaAppNavigationContext);
local v4 = require(script.Parent.EnumScreens);
local v5 = require(l_Parent_0.Loggers).Logger:new(script.Name);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v7 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v8 = require(l_script_FirstAncestor_0.Conversations.Thunks.OpenUnfilteredThreadsLearnMoreLink);
local v9 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local l_useChatPlacementContext_0 = v9.useChatPlacementContext;
local l_isPlacementInExperience_0 = v9.isPlacementInExperience;
generateNavigateToGroups = function(v12, v13) --[[ Line: 23 ]] --[[ Name: generateNavigateToGroups ]]
    -- upvalues: v4 (copy), v5 (copy)
    return function() --[[ Line: 24 ]]
        -- upvalues: v13 (copy), v12 (copy), v4 (ref), v5 (ref)
        if v13 then
            v13();
        end;
        if v12 == nil then
            return;
        else
            local v14 = v12[v4.Groups];
            if v14 then
                v5:info("Navigate To Groups from App Chat");
                v14();
                return;
            else
                v5:warning("Groups page was not set in navigateToLuaAppPages");
                return;
            end;
        end;
    end;
end;
local function _(v15, v16) --[[ Line: 43 ]] --[[ Name: generateNavigateToUnfilteredThreadsLearnMore ]]
    -- upvalues: v4 (copy), v8 (copy)
    return function(v17) --[[ Line: 44 ]]
        -- upvalues: v15 (copy), v16 (copy), v4 (ref), v8 (ref)
        if not v15 then
            return;
        elseif v16 then
            if v17 then
                v17(v4.LearnMorePartialModal, {}, true);
            end;
            return;
        else
            v15(v8());
            return;
        end;
    end;
end;
LuaAppNavigationContextProvider = function(v19) --[[ Line: 58 ]] --[[ Name: LuaAppNavigationContextProvider ]]
    -- upvalues: v2 (copy), l_useChatPlacementContext_0 (copy), l_isPlacementInExperience_0 (copy), v7 (copy), v6 (copy), v3 (copy), v4 (copy), v8 (copy)
    local v20 = v2.useRef(function() --[[ Line: 59 ]]

    end);
    local l_chatPlacement_0 = l_useChatPlacementContext_0().chatPlacement;
    local v22 = l_isPlacementInExperience_0(l_chatPlacement_0);
    local v23 = v7();
    if v23 then
        v20.current = function() --[[ Line: 66 ]]
            -- upvalues: v23 (copy), v6 (ref)
            v23.fireAnalyticsEvent(v6.ChatLandingGroupsBtnClicked);
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local l_Provider_0 = v3.Provider;
    local v26 = {};
    local v27 = {
        navigateToGroups = generateNavigateToGroups(v19.navigateToLuaAppPages, v20.current)
    };
    local l_dispatch_0 = v19.dispatch;
    v27.navigateToUnfilteredThreadsLearnMore = function(v29) --[[ Line: 44 ]]
        -- upvalues: l_dispatch_0 (copy), v22 (copy), v4 (ref), v8 (ref)
        if not l_dispatch_0 then
            return;
        elseif v22 then
            if v29 then
                v29(v4.LearnMorePartialModal, {}, true);
            end;
            return;
        else
            l_dispatch_0(v8());
            return;
        end;
    end;
    v26.value = v27;
    return l_createElement_0(l_Provider_0, v26, v19.children);
end;
return LuaAppNavigationContextProvider;