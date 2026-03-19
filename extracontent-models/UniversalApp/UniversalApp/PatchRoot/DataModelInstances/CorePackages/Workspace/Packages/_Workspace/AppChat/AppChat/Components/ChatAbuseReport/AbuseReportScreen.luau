local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Common.Frame);
local v4 = require(script.Parent.ChatAbuseReport);
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(l_Parent_0.InputHandlers);
local _ = require(l_Parent_0.ReactFocusNavigation);
local v8 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v8.FocusNavigableSurfaceIdentifierEnum;
local l_AppFocusRoot_0 = v8.AppFocusRoot;
local l_FocusNavigationEventNameEnum_0 = v8.FocusNavigationEventNameEnum;
local l_FFlagEnableAppChatFocusableFixes_0 = v5.FFlagEnableAppChatFocusableFixes;
return function(v13) --[[ Line: 18 ]] --[[ Name: AbuseReportScreen ]]
    -- upvalues: v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v6 (copy), v3 (copy), v4 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_AppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local l_navigation_0 = v13.navigation;
    local v15 = l_navigation_0.getParam("conversationId", nil);
    local v16 = l_navigation_0.getParam("participantId", nil);
    local v18 = v2.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v6 (ref), l_navigation_0 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v6.onRelease(function(v17) --[[ Line: 26 ]]
                    -- upvalues: l_navigation_0 (ref)
                    l_navigation_0.pop();
                    v17:cancel();
                end)
            }
        };
    end, {
        l_navigation_0
    });
    local v19 = v2.createElement(v3, {
        horizontalAlignment = Enum.HorizontalAlignment.Center, 
        verticalAlignment = Enum.VerticalAlignment.Center, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        constraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(800, 450)
        }), 
        padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        abuseReportFlow = v2.createElement(v4, {
            conversationId = v15, 
            participantId = v16, 
            onAbandon = l_navigation_0.pop, 
            onComplete = l_navigation_0.pop
        })
    });
    if l_FFlagEnableAppChatFocusableFixes_0 then
        return (v2.createElement(l_AppFocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
            isIsolated = true, 
            isAutoFocusRoot = true, 
            isFocusable = true, 
            customEventHandlers = v18
        }, {
            v19
        }));
    else
        return v19;
    end;
end;