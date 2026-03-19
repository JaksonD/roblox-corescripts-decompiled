local l_UserInputService_0 = game:GetService("UserInputService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SharedFlags);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v7 = require(l_script_FirstAncestor_0.ChatWindow.Helpers.debounce);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatSendWindowScrollEvent);
local l_FFlagExpChatAddPaddingAroundARButton_0 = v5.FFlagExpChatAddPaddingAroundARButton;
local v11 = game:DefineFastInt("ExpChatWindowScrollV3Debounce", 0);
local v12 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100;
local function _(v13) --[[ Line: 28 ]] --[[ Name: isScrollbarNearBottom ]]
    -- upvalues: v12 (copy)
    local l_AbsoluteWindowSize_0 = v13.AbsoluteWindowSize;
    local l_CanvasPosition_0 = v13.CanvasPosition;
    local l_AbsoluteCanvasSize_0 = v13.AbsoluteCanvasSize;
    local v17 = l_AbsoluteCanvasSize_0 - l_AbsoluteWindowSize_0;
    local v18 = l_CanvasPosition_0.Y / v17.Y;
    if l_AbsoluteCanvasSize_0.Y <= l_AbsoluteWindowSize_0.Y then
        return true;
    else
        return v12 <= v18;
    end;
end;
local function _(v20) --[[ Line: 43 ]] --[[ Name: isMouseMovementOrTouch ]]
    local v21 = true;
    if v20 ~= Enum.PreferredInput.KeyboardAndMouse then
        v21 = v20 == Enum.PreferredInput.Touch;
    end;
    return v21;
end;
local v23 = v7(function() --[[ Line: 47 ]]
    -- upvalues: l_TextChatService_0 (copy)
    l_TextChatService_0:SendExpChatWindowScroll();
end, v11);
return v4.memo(function(v24) --[[ Line: 54 ]] --[[ Name: BottomLockedScrollViewV3 ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), l_UserInputService_0 (copy), v12 (copy), v9 (copy), v23 (copy), v8 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v26 = v4.useRef(nil);
    local v27 = v4.useRef(true);
    local v28, v29 = v4.useBinding(false);
    local v30 = v4.useRef(false);
    local v33 = v4.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: l_UserInputService_0 (ref), v29 (copy), v30 (copy)
        local l_PreferredInput_0 = l_UserInputService_0.PreferredInput;
        local v32 = true;
        if l_PreferredInput_0 ~= Enum.PreferredInput.KeyboardAndMouse then
            v32 = l_PreferredInput_0 == Enum.PreferredInput.Touch;
        end;
        if v32 then
            v29(true);
        end;
        if l_PreferredInput_0 == Enum.PreferredInput.Touch then
            v30.current = true;
        end;
    end, {
        l_UserInputService_0.PreferredInput
    });
    local v36 = v4.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: l_UserInputService_0 (ref), v29 (copy), v30 (copy)
        local l_PreferredInput_1 = l_UserInputService_0.PreferredInput;
        local v35 = true;
        if l_PreferredInput_1 ~= Enum.PreferredInput.KeyboardAndMouse then
            v35 = l_PreferredInput_1 == Enum.PreferredInput.Touch;
        end;
        if v35 then
            v29(false);
        end;
        if l_PreferredInput_1 == Enum.PreferredInput.Touch then
            v30.current = false;
        end;
    end, {
        l_UserInputService_0.PreferredInput
    });
    local v44 = v4.useCallback(function(v37) --[[ Line: 85 ]]
        -- upvalues: v27 (copy), v12 (ref), v9 (ref), v23 (ref)
        local l_v27_0 = v27;
        local l_AbsoluteWindowSize_1 = v37.AbsoluteWindowSize;
        local l_CanvasPosition_1 = v37.CanvasPosition;
        local l_AbsoluteCanvasSize_1 = v37.AbsoluteCanvasSize;
        local v42 = l_AbsoluteCanvasSize_1 - l_AbsoluteWindowSize_1;
        local v43 = l_CanvasPosition_1.Y / v42.Y;
        l_v27_0.current = l_AbsoluteCanvasSize_1.Y <= l_AbsoluteWindowSize_1.Y or v43 >= v12;
        if v9() and not v27.current then
            v23();
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v24 (copy), v27 (copy), v30 (copy), v26 (copy)
        if v24.isChannelBarVisible and v24.targetTextChannel then
            v27.current = true;
            if not v30.current and v26.current then
                v26.current.CanvasPosition = Vector2.new(0, 9.007199254740992E15);
            end;
        end;
    end, {
        v24.targetTextChannel, 
        v24.isChannelBarVisible
    });
    v4.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v26 (copy), v27 (copy), v30 (copy)
        local l_current_0 = v26.current;
        if not l_current_0 then
            return;
        else
            local v46 = l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 111 ]]
                -- upvalues: v27 (ref), v30 (ref), v26 (ref)
                if v27.current and not v30.current and v26.current then
                    v26.current.CanvasPosition = Vector2.new(0, 9.007199254740992E15);
                end;
            end);
            return function() --[[ Line: 120 ]]
                -- upvalues: v46 (copy)
                v46:Disconnect();
            end;
        end;
    end, {
        tostring(v26), 
        v27, 
        v30
    });
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v24.Size, 
        [v4.Event.InputBegan] = v33, 
        [v4.Event.InputEnded] = v36
    }, {
        padding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        scrollView = v4.createElement("ScrollingFrame", {
            ref = v26, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = v28:map(function(v47) --[[ Line: 142 ]]
                if v47 then
                    return 0;
                else
                    return 1;
                end;
            end), 
            ScrollBarThickness = 8, 
            Selectable = not v8 and nil, 
            VerticalScrollBarInset = if l_FFlagExpChatAddPaddingAroundARButton_0 then nil else Enum.ScrollBarInset.Always, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            CanvasSize = UDim2.new(), 
            [v4.Change.CanvasPosition] = v44
        }, v24.children)
    });
end);