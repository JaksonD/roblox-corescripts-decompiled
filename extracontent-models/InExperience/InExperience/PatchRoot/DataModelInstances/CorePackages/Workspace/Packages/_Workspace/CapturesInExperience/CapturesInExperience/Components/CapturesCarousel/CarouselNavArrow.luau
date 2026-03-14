local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.SocialCommon);
local v7 = require(l_Parent_1.UIBlox);
local v8 = require(l_Parent_1.ReactUtils);
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_InputUtilities_0 = v6.Utils.InputUtilities;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEventConnection_0 = v8.useEventConnection;
local l_useStyle_0 = v7.Core.Style.useStyle;
local v15 = require(l_Parent_0.Thunks.CarouselNavigated);
local v16 = require(l_Parent_0.Constants);
local v17 = require(l_Parent_0.Analytics.EventNames);
local v18 = require(l_Parent_0.Analytics.useAnalytics);
local v19 = l_Images_0["icons/actions/cycleLeft"];
local v20 = l_Images_0["icons/actions/cycleRight"];
return function(v21) --[[ Line: 39 ]]
    -- upvalues: v18 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), v4 (copy), v16 (copy), v19 (copy), v20 (copy), l_InputUtilities_0 (copy), v17 (copy), v15 (copy), l_RunService_0 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), l_ImageSetLabel_0 (copy)
    local v22 = v18();
    local v23 = l_useDispatch_0();
    local v24 = l_useStyle_0();
    local v25 = v4.useRef(nil);
    local v26 = v21.direction == v16.CarouselDirection.Left;
    local v27 = if v26 then Vector2.new(0, 0.5) else Vector2.new(1, 0.5);
    local v28 = if v26 then v19 else v20;
    local v29 = if v26 then UDim2.fromScale(0, 0.5) else UDim2.fromScale(1, 0.5);
    v4.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v25 (copy)
        return function() --[[ Line: 53 ]]
            -- upvalues: v25 (ref)
            if v25.current then
                v25.current:Disconnect();
                v25.current = nil;
            end;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v21 (copy), v25 (copy)
        if v21.isDisabled and v25.current then
            v25.current:Disconnect();
            v25.current = nil;
        end;
    end, {
        v21.isDisabled
    });
    local v35 = v4.useCallback(function(_, v31) --[[ Line: 68 ]]
        -- upvalues: v21 (copy), l_InputUtilities_0 (ref), v25 (copy), v22 (copy), v17 (ref), v23 (copy), v15 (ref), l_RunService_0 (ref)
        if v21.isDisabled then
            return;
        elseif v31.UserInputState ~= Enum.UserInputState.Begin then
            return;
        elseif not l_InputUtilities_0.isActivationInput(v31) then
            return;
        else
            if v25.current then
                v25.current:Disconnect();
                v25.current = nil;
            end;
            v22.fireEvent(v17.CapturesCarouselNavigated, {
                direction = v21.direction
            });
            v23(v15(v21.direction));
            local v32 = tick();
            local l_v32_0 = v32;
            v25.current = l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 94 ]]
                -- upvalues: l_v32_0 (copy), v32 (ref), v22 (ref), v17 (ref), v21 (ref), v23 (ref), v15 (ref)
                if math.max(0.5 / (tick() - l_v32_0), 0.15) < tick() - v32 then
                    v22.fireEvent(v17.CapturesCarouselNavigated, {
                        direction = v21.direction
                    });
                    v23(v15(v21.direction));
                    v32 = tick();
                end;
            end);
            return;
        end;
    end, {
        v21.isDisabled
    });
    local v38 = v4.useCallback(function(_, v37) --[[ Line: 108 ]]
        -- upvalues: l_InputUtilities_0 (ref), v25 (copy)
        if l_InputUtilities_0.isActivationInput(v37) and v25.current then
            v25.current:Disconnect();
            v25.current = nil;
        end;
    end, {});
    l_useEventConnection_0(l_UserInputService_0.InputEnded, function(v39) --[[ Line: 117 ]]
        -- upvalues: l_InputUtilities_0 (ref), v25 (copy)
        if l_InputUtilities_0.isActivationInput(v39) and v25.current then
            v25.current:Disconnect();
            v25.current = nil;
        end;
    end);
    return v4.createElement("TextButton", {
        AnchorPoint = v27, 
        BackgroundTransparency = 1, 
        Position = v29, 
        Size = v21.Size, 
        Text = "", 
        ZIndex = v21.ZIndex, 
        Visible = not v21.isDisabled, 
        [v4.Event.InputBegan] = v35, 
        [v4.Event.InputEnded] = v38
    }, {
        Arrow = v4.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v28, 
            ImageColor3 = v24.Theme.IconEmphasis.Color, 
            ImageTransparency = v24.Theme.IconEmphasis.Transparency, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(36, 36)
        })
    });
end;