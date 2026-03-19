local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v6 = require(script.Parent.FriendCountLabel);
local v7 = require(script.Parent.MemberEntry);
local v8 = require(l_script_FirstAncestor_0.Stores.GetSelectedUsersStore);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
return v2.memo(function(v10) --[[ Line: 22 ]] --[[ Name: SelectedMembersBar ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), v8 (copy), l_useSignalState_0 (copy), v7 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v3 (copy), v6 (copy)
    local v11 = l_useStyle_0();
    local v12 = v2.useRef(nil);
    local v13 = v8(false);
    local v14 = l_useSignalState_0(v13.getMaxSize());
    local v17 = v2.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v14 (copy), v2 (ref), v7 (ref), v11 (copy)
        local v15 = {};
        for v16 = 1, v14 do
            v15[("user-%*"):format(v16)] = v2.createElement(v7, {
                index = v16, 
                style = v11
            });
        end;
        return v15;
    end, {
        v14
    });
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v12 (copy), l_FFlagEnableAppChatFocusableFixes_0 (ref)
        if v12.current then
            v12.current.ScrollBarThickness = 0;
            if l_FFlagEnableAppChatFocusableFixes_0 then
                v12.current.Selectable = false;
            end;
        end;
    end, {
        v12
    });
    return v2.createElement(v3.View, {
        LayoutOrder = v10.LayoutOrder, 
        tag = "row size-full-0 auto-y flex-y-fill padding-x-small gap-medium"
    }, {
        FriendCountContainer = v2.createElement(v3.View, {
            tag = "auto-xy padding-y-small", 
            LayoutOrder = 1
        }, {
            FriendCount = v2.createElement(v6)
        }), 
        UserScrollBar = v2.createElement(v3.ScrollView, {
            tag = "fill auto-y", 
            LayoutOrder = 2, 
            scroll = {
                scrollBarVisibility = v3.Enums.ScrollBarVisibility.None, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY
            }, 
            scrollingFrameRef = v12
        }, v2.createElement(v3.View, {
            tag = "row size-full padding-x-xsmall gap-medium align-y-center"
        }, v17))
    });
end);