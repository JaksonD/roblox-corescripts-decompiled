local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.App.FeedContext);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local l_ControlState_0 = v3.Enums.ControlState;
local l_Icon_0 = v3.Icon;
local l_Image_0 = v3.Image;
local l_View_0 = v3.View;
local l_useRef_0 = v4.useRef;
local l_useTokens_0 = v3.Hooks.useTokens;
local v11 = game:DefineFastInt("ContentFeedLongPressThresholdMs", 500);
return function(v12) --[[ Line: 25 ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), v2 (copy), l_useRef_0 (copy), l_ControlState_0 (copy), v11 (copy), l_View_0 (copy), l_Image_0 (copy), l_Icon_0 (copy)
    local v13 = l_useTokens_0();
    local v14 = v4.useContext(v2);
    local v15 = l_useRef_0(nil);
    local v18 = v4.useCallback(function(v16) --[[ Line: 30 ]]
        -- upvalues: l_ControlState_0 (ref), v15 (copy), v11 (ref), v12 (copy)
        if v16 == l_ControlState_0.Pressed then
            v15.current = tick();
            task.delay(v11 / 1000, function() --[[ Line: 33 ]]
                -- upvalues: v15 (ref), v12 (ref)
                if v15.current ~= nil then
                    v12.onLongPress();
                end;
            end);
            return;
        else
            if v16 == l_ControlState_0.Default then
                if v15.current == nil then
                    return;
                else
                    local v17 = tick() - (v15.current or 0);
                    v15.current = nil;
                    if v17 < v11 / 1000 then
                        v12.onShortPress();
                    end;
                end;
            end;
            return;
        end;
    end, {
        v12.onLongPress, 
        v12.onShortPress
    });
    return v4.createElement(l_View_0, {
        isDisabled = v14.isZooming, 
        onStateChanged = v18, 
        tag = "radius-medium auto-xy padding-small bg-action-subtle"
    }, {
        ReactIcon = if v12.activeReaction then v4.createElement(l_Image_0, {
            Image = v12.activeReaction, 
            ZIndex = 2, 
            tag = "anchor-center-center position-center-center size-600-600"
        }) else nil, 
        ReactCTA = if not v12.activeReaction then v4.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = "icons/controls/emoteOff", 
            Position = UDim2.fromScale(0.5, 0.5), 
            style = v13.Color.ActionEmphasis.Foreground, 
            ZIndex = 2
        }) else nil
    });
end;