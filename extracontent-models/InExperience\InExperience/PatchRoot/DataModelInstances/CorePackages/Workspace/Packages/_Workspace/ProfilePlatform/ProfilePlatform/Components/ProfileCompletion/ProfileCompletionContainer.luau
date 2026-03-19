local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_Parent_0.SocialServerDrivenUi);
local v5 = require(l_Parent_0.RobloxAppHooks);
local l_SocialSduiComponentWrapper_0 = v4.SocialSduiComponentWrapper;
local v7 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v8 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local v9 = require(l_script_FirstAncestor_0.Hooks.useProfileCompletionSduiContext);
local v10 = require(l_script_FirstAncestor_0.Hooks.useProfileCompletionData);
local v11 = require(l_script_FirstAncestor_0.Common.Enums);
local l_useScreenSize_0 = v5.useScreenSize;
return v2.memo(function(v13) --[[ Line: 22 ]] --[[ Name: ProfileCompletionContainer ]]
    -- upvalues: v7 (copy), l_useScreenSize_0 (copy), v8 (copy), v2 (copy), v9 (copy), v4 (copy), v10 (copy), v3 (copy), l_SocialSduiComponentWrapper_0 (copy), v11 (copy)
    local v14 = v7();
    local v15 = l_useScreenSize_0();
    local v16, v17 = v8();
    local v18, v19 = v2.useState(v15.X);
    local v20 = v9({
        sideMargin = v16, 
        containerWidth = v18
    });
    local v21 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v13 (copy)
        return {
            collectionPosition = v13.layoutOrder
        };
    end, {
        v13.layoutOrder
    });
    local v22 = v2.useRef(nil);
    local v24 = v2.useCallback(function(v23) --[[ Line: 38 ]]
        -- upvalues: v17 (copy), v19 (copy)
        v17(v23);
        v19(v23.AbsoluteSize.X);
    end, {
        v17, 
        v19
    });
    v2.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v4 (ref)
        v4.registerSocialActions();
    end, {});
    local v25, v26 = v10();
    return v2.createElement(v2.Fragment, nil, {
        NavEvents = v2.createElement(v3.NavigationEvents, {
            onDidFocus = v26
        }), 
        Content = if v25 then v2.createElement(l_SocialSduiComponentWrapper_0, {
            layoutOrder = v13.layoutOrder, 
            sduiContext = v20, 
            sduiComponentConfig = v25, 
            pageSideMargin = v16, 
            onFrameResized = v24, 
            verticalScrollingFrameRef = v22, 
            scrollViewPositionChangedSignal = v14.scrollViewPositionChangedSignal, 
            analyticsContext = v21, 
            debugName = v11.Components.ProfileCompletion, 
            testId = "profile-completion"
        }) else nil
    });
end);