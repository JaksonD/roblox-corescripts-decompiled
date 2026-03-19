local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.UserInputService;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_Parent_0.ReactUtils);
local v6 = require(script.Parent.getVisualForKey);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = require(l_script_FirstAncestor_0.Components.CircularProgressBar);
local v11 = require(l_script_FirstAncestor_0.Components.Image);
local v12 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v14 = require(l_script_FirstAncestor_0.Components.View);
local l_EventConnection_0 = v5.EventConnection;
local v16 = {
    holdTime = 1, 
    resetTime = 0.5
};
local v17 = {
    testId = "--foundation-key-label"
};
local v18 = Rect.new(Vector2.new(10, 9), Vector2.new(25, 25));
return v3.memo(v3.forwardRef(function(v19, v20) --[[ Line: 53 ]] --[[ Name: KeyLabel ]]
    -- upvalues: v9 (copy), v17 (copy), v16 (copy), v7 (copy), v3 (copy), v4 (copy), v6 (copy), v14 (copy), v8 (copy), v11 (copy), v18 (copy), v12 (copy), v10 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy)
    local v21 = v9(v19, v17);
    local v22 = if v21.holdBehavior then v9(v21.holdBehavior, v16) else nil;
    local v23 = v7();
    local v24, v25 = v3.useState(nil);
    local v26 = nil;
    local v27 = nil;
    local v29, v30 = v4.useAnimatedBinding(0, function(v28) --[[ Line: 61 ]]
        -- upvalues: v22 (copy), v24 (copy), v27 (ref), v4 (ref), v25 (copy)
        if v22 and v28 == 1 and v24 then
            v27(v4.ease(0, {
                duration = v22.resetTime, 
                easingStyle = Enum.EasingStyle.Linear
            }));
            v25(nil);
            v22.onEndHold(true);
        end;
    end);
    v26 = v29;
    v27 = v30;
    v29 = v6(v21.keyCode);
    v30 = v29.keyVisualType == "Image";
    return v3.createElement(v14, v8(v21, {
        Size = v21.Size, 
        ref = v20
    }), {
        Image = v3.createElement(v11, {
            Image = if v30 then v29.key else "icons/controls/keys/key_single", 
            Size = v29.size, 
            ScaleType = if not v30 then Enum.ScaleType.Slice else nil, 
            imageStyle = if v24 then v23.Color.Content.Emphasis else v23.Color.Content.Muted, 
            slice = if not v30 then {
                center = v18
            } else nil, 
            tag = "position-center-center anchor-center-center"
        }, {
            CustomPadding = if not v30 then v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 3)
            }) else nil, 
            Text = if not v30 then v3.createElement(v12, {
                Text = v29.key, 
                textStyle = if v24 then v23.Color.Content.Emphasis else v23.Color.Content.Muted, 
                tag = "text-body-medium auto-xy size-full-full text-align-x-center"
            }) else nil
        }), 
        Indicator = if v22 and v22.holdTime > 0 then v3.createElement(v10, {
            progress = v26, 
            tag = "size-full-full", 
            testId = ("%*--indicator"):format(v21.testId)
        }, {}) else nil, 
        InputBeganConnection = if v22 then v3.createElement(l_EventConnection_0, {
            event = l_UserInputService_0.InputBegan, 
            callback = function(v31) --[[ Line: 121 ]] --[[ Name: callback ]]
                -- upvalues: v24 (copy), v21 (copy), v22 (copy), v25 (copy), v27 (ref), v4 (ref), v26 (ref)
                if v24 then
                    return;
                else
                    if v31.KeyCode == v21.keyCode then
                        if v22.onBeginHold then
                            v22.onBeginHold();
                        end;
                        if v22.holdTime == 0 then
                            v22.onEndHold(true);
                            return;
                        else
                            v25(v31);
                            v27(v4.ease(1, {
                                duration = (1 - v26:getValue()) * v22.holdTime, 
                                easingStyle = Enum.EasingStyle.Linear
                            }));
                        end;
                    end;
                    return;
                end;
            end
        }) else nil, 
        InputEndedConnection = if v22 then v3.createElement(l_EventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = function(v32) --[[ Line: 147 ]] --[[ Name: callback ]]
                -- upvalues: v24 (copy), v22 (copy), v25 (copy), v27 (ref), v4 (ref), v26 (ref)
                if v32 == v24 then
                    if v22.onEndHold then
                        v22.onEndHold(false);
                    end;
                    v25(nil);
                    v27(v4.ease(0, {
                        duration = v26:getValue() * v22.resetTime, 
                        easingStyle = Enum.EasingStyle.Linear
                    }));
                end;
            end
        }) else nil
    });
end));