local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.Signals);
local l_View_0 = v1.View;
local l_Text_0 = v1.Text;
local l_Icon_0 = v1.Icon;
local l_IconSize_0 = v1.Enums.IconSize;
local l_useTokens_0 = v1.Hooks.useTokens;
local l_useSignalState_0 = v3.useSignalState;
return function(v11) --[[ Line: 30 ]] --[[ Name: CoreButton ]]
    -- upvalues: l_useTokens_0 (copy), l_useSignalState_0 (copy), v4 (copy), v2 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local v12 = l_useTokens_0();
    local v13 = l_useSignalState_0(v11.animatedIcon or v4.createSignal(""));
    local v14 = l_useSignalState_0(v11.buttonState or v4.createSignal(false));
    local v15 = v2.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v11 (copy), v14 (copy)
        if v11.icon.off and v11.buttonState then
            return v14 and v11.icon.off or v11.icon.on;
        else
            return v11.icon.on;
        end;
    end, {
        v14, 
        v11.icon
    });
    local v16 = v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v11 (copy), v13 (copy), v15 (copy)
        if v11.animatedIcon then
            return v13;
        else
            return v15;
        end;
    end, {
        v13, 
        v15
    });
    return v2.createElement(l_View_0, {
        tag = "size-0-1200 flex-x-fill grow radius-medium padding-x-small align-y-center row gap-xsmall bg-surface-200", 
        onActivated = v11.onActivated, 
        LayoutOrder = v11.LayoutOrder, 
        ref = v11.onMount
    }, {
        IconContainer = v2.createElement(l_View_0, {
            tag = "size-1100 align-y-center align-x-center row", 
            LayoutOrder = 1
        }, {
            Icon = v2.createElement(l_Icon_0, {
                name = v16, 
                size = if v11.isNewIcon then l_IconSize_0.Large else l_IconSize_0.Medium
            })
        }), 
        Text = v2.createElement(l_Text_0, {
            Text = v11.text, 
            textStyle = {
                Color3 = v12.Color.Content.Default.Color3
            }, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            tag = "text-label-medium size-full text-align-x-left", 
            LayoutOrder = 2
        })
    });
end;