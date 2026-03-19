local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_ScrollBarVisibility_0 = v2.Enums.ScrollBarVisibility;
local v5 = require(l_Parent_0.AuthAnalytics);
local l_usernameSuggestionShown_0 = v5.Events.usernameSuggestionShown;
local l_EventStreamConstants_0 = v5.EventStreamConstants;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v2 (copy), l_usernameSuggestionShown_0 (copy), l_EventStreamConstants_0 (copy), l_View_0 (copy), l_ScrollBarVisibility_0 (copy)
    local v9 = {};
    for v10, v11 in ipairs(v8.suggestionUsernames) do
        v9[v10] = v1.createElement(v2.Pill, {
            text = v11, 
            onActivated = function() --[[ Line: 25 ]] --[[ Name: onActivated ]]
                -- upvalues: v8 (copy), v11 (copy)
                v8.onUsernameSelected(v11);
            end, 
            isDisabled = false
        });
    end;
    v1.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: l_usernameSuggestionShown_0 (ref), v8 (copy), l_EventStreamConstants_0 (ref)
        l_usernameSuggestionShown_0(v8.eventContext, v8.inputUsername, v8.suggestionUsernames, l_EventStreamConstants_0.Field.Username);
    end, {});
    return v1.createElement(l_View_0, {
        LayoutOrder = v8.layoutOrder, 
        tag = {
            ["size-full-1100 padding-y-small"] = true
        }
    }, {
        v1.createElement(v2.ScrollView, {
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                CanvasSize = UDim2.fromOffset(0, 0), 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                scrollBarVisibility = l_ScrollBarVisibility_0.None
            }, 
            tag = {
                ["row gap-small no-wrap size-full-1000"] = true
            }
        }, v9)
    });
end;