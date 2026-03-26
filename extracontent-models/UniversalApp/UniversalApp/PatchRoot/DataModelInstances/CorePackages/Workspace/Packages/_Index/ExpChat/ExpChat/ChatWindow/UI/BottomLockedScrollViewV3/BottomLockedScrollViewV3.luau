local l_UserInputService_0 = game:GetService("UserInputService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.ChatWindow.Helpers.debounce);
local v9 = require(script.Parent.useV2MessagePool);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatSendWindowScrollEvent);
local l_FFlagExpChatAddPaddingAroundARButton_0 = v5.FFlagExpChatAddPaddingAroundARButton;
local v14 = game:DefineFastInt("ExpChatWindowScrollV3Debounce", 0);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatScrollPerfTracking);
local v16 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local _ = require(l_Parent_0.SocialLuaAnalytics);
local v18 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100;
local function _(v19) --[[ Line: 42 ]] --[[ Name: isScrollbarNearBottom ]]
    -- upvalues: v18 (copy)
    local l_AbsoluteWindowSize_0 = v19.AbsoluteWindowSize;
    local l_CanvasPosition_0 = v19.CanvasPosition;
    local l_AbsoluteCanvasSize_0 = v19.AbsoluteCanvasSize;
    local v23 = l_AbsoluteCanvasSize_0 - l_AbsoluteWindowSize_0;
    local v24 = l_CanvasPosition_0.Y / v23.Y;
    if l_AbsoluteCanvasSize_0.Y <= l_AbsoluteWindowSize_0.Y then
        return true;
    else
        return v18 <= v24;
    end;
end;
local function _(v26) --[[ Line: 57 ]] --[[ Name: isMouseMovementOrTouch ]]
    local v27 = true;
    if v26 ~= Enum.PreferredInput.KeyboardAndMouse then
        v27 = v26 == Enum.PreferredInput.Touch;
    end;
    return v27;
end;
local v29 = v8(function() --[[ Line: 61 ]]
    -- upvalues: l_TextChatService_0 (copy)
    l_TextChatService_0:SendExpChatWindowScroll();
end, v14);
return v4.memo(function(v30) --[[ Line: 68 ]] --[[ Name: BottomLockedScrollViewV3 ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), v11 (copy), v6 (copy), v9 (copy), l_UserInputService_0 (copy), v15 (copy), v16 (copy), v18 (copy), v12 (copy), v29 (copy), v10 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v32 = v4.useRef(nil);
    local v33 = v4.useRef(true);
    local v34, v35 = v4.useBinding(false);
    local v36 = v4.useRef(false);
    local v37 = v11 and v30.children == nil;
    local v38 = v4.useBinding(0);
    local v39 = v30.textTransparency or v38;
    local v40 = v6(false);
    local l_children_0 = v9({
        enabled = v37, 
        messagesStore = v40, 
        textTransparency = v39, 
        chatWindowSettings = v30.chatWindowSettings, 
        isSpatialUIEnabled = v30.isSpatialUIEnabled, 
        onTextMessageLabelButtonActivated = v30.onTextMessageLabelButtonActivated, 
        targetTextChannel = v30.targetTextChannel, 
        isChannelBarVisible = v30.isChannelBarVisible, 
        showTranslationButton = v30.showTranslationButton
    }).children;
    local v44 = v4.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: l_UserInputService_0 (ref), v35 (copy), v36 (copy)
        local l_PreferredInput_0 = l_UserInputService_0.PreferredInput;
        local v43 = true;
        if l_PreferredInput_0 ~= Enum.PreferredInput.KeyboardAndMouse then
            v43 = l_PreferredInput_0 == Enum.PreferredInput.Touch;
        end;
        if v43 then
            v35(true);
        end;
        if l_PreferredInput_0 == Enum.PreferredInput.Touch then
            v36.current = true;
        end;
    end, {
        l_UserInputService_0.PreferredInput
    });
    local v47 = v4.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: l_UserInputService_0 (ref), v35 (copy), v36 (copy)
        local l_PreferredInput_1 = l_UserInputService_0.PreferredInput;
        local v46 = true;
        if l_PreferredInput_1 ~= Enum.PreferredInput.KeyboardAndMouse then
            v46 = l_PreferredInput_1 == Enum.PreferredInput.Touch;
        end;
        if v46 then
            v35(false);
        end;
        if l_PreferredInput_1 == Enum.PreferredInput.Touch then
            v36.current = false;
        end;
    end, {
        l_UserInputService_0.PreferredInput
    });
    local v48 = nil;
    if v15 then
        v48 = v4.useRef(nil);
        v4.useEffect(function() --[[ Line: 120 ]]
            -- upvalues: v48 (ref)
            return function() --[[ Line: 121 ]]
                -- upvalues: v48 (ref)
                if v48.current then
                    v48.current.cleanup();
                end;
            end;
        end, {});
    end;
    local v56 = v4.useCallback(function(v49) --[[ Line: 129 ]]
        -- upvalues: v15 (ref), v48 (ref), v16 (ref), v33 (copy), v18 (ref), v12 (ref), v29 (ref)
        if v15 then
            if v48.current == nil then
                v48.current = v16.startChatWindowScrollInterval(v16.Events.ChatWindowScrollInterval, v49, {});
            end;
            if v48.current then
                v48.current.onScrollTick();
            end;
        end;
        local l_v33_0 = v33;
        local l_AbsoluteWindowSize_1 = v49.AbsoluteWindowSize;
        local l_CanvasPosition_1 = v49.CanvasPosition;
        local l_AbsoluteCanvasSize_1 = v49.AbsoluteCanvasSize;
        local v54 = l_AbsoluteCanvasSize_1 - l_AbsoluteWindowSize_1;
        local v55 = l_CanvasPosition_1.Y / v54.Y;
        l_v33_0.current = l_AbsoluteCanvasSize_1.Y <= l_AbsoluteWindowSize_1.Y or v55 >= v18;
        if v12() and not v33.current then
            v29();
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v30 (copy), v33 (copy), v36 (copy), v32 (copy)
        if v30.isChannelBarVisible and v30.targetTextChannel then
            v33.current = true;
            if not v36.current and v32.current then
                v32.current.CanvasPosition = Vector2.new(0, 9.007199254740992E15);
            end;
        end;
    end, {
        v30.targetTextChannel, 
        v30.isChannelBarVisible
    });
    v4.useEffect(function() --[[ Line: 160 ]]
        -- upvalues: v32 (copy), v33 (copy), v36 (copy)
        local l_current_0 = v32.current;
        if not l_current_0 then
            return;
        else
            local v58 = l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 168 ]]
                -- upvalues: v33 (ref), v36 (ref), v32 (ref)
                if v33.current and not v36.current and v32.current then
                    v32.current.CanvasPosition = Vector2.new(0, 9.007199254740992E15);
                end;
            end);
            return function() --[[ Line: 177 ]]
                -- upvalues: v58 (copy)
                v58:Disconnect();
            end;
        end;
    end, if v11 then {
        if v37 then nil else v30.children, 
        v33.current, 
        v36.current, 
        v32.current, 
        v30.targetTextChannel
    } else {
        tostring(v32), 
        v33, 
        v36
    });
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v30.Size, 
        [v4.Event.InputBegan] = v44, 
        [v4.Event.InputEnded] = v47
    }, {
        padding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        scrollView = v4.createElement("ScrollingFrame", {
            ref = v32, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = v34:map(function(v59) --[[ Line: 213 ]]
                if v59 then
                    return 0;
                else
                    return 1;
                end;
            end), 
            ScrollBarThickness = 8, 
            Selectable = not v10 and nil, 
            VerticalScrollBarInset = if l_FFlagExpChatAddPaddingAroundARButton_0 then nil else Enum.ScrollBarInset.Always, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            CanvasSize = UDim2.new(), 
            [v4.Change.CanvasPosition] = v56
        }, if v37 then l_children_0 else v30.children)
    });
end);