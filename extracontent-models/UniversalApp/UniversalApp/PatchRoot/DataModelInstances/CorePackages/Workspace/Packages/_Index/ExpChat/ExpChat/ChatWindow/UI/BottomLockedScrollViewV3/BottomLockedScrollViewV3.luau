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
local v19 = {};
local function v20() --[[ Line: 31 ]]

end;
local function _(v21) --[[ Line: 45 ]] --[[ Name: isScrollbarNearBottom ]]
    -- upvalues: v18 (copy)
    local l_AbsoluteWindowSize_0 = v21.AbsoluteWindowSize;
    local l_CanvasPosition_0 = v21.CanvasPosition;
    local l_AbsoluteCanvasSize_0 = v21.AbsoluteCanvasSize;
    local v25 = l_AbsoluteCanvasSize_0 - l_AbsoluteWindowSize_0;
    local v26 = l_CanvasPosition_0.Y / v25.Y;
    if l_AbsoluteCanvasSize_0.Y <= l_AbsoluteWindowSize_0.Y then
        return true;
    else
        return v18 <= v26;
    end;
end;
local function _(v28) --[[ Line: 60 ]] --[[ Name: isMouseMovementOrTouch ]]
    local v29 = true;
    if v28 ~= Enum.PreferredInput.KeyboardAndMouse then
        v29 = v28 == Enum.PreferredInput.Touch;
    end;
    return v29;
end;
local v31 = v8(function() --[[ Line: 64 ]]
    -- upvalues: l_TextChatService_0 (copy)
    l_TextChatService_0:SendExpChatWindowScroll();
end, v14);
return v4.memo(function(v32) --[[ Line: 71 ]] --[[ Name: BottomLockedScrollViewV3 ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), v11 (copy), v6 (copy), v9 (copy), v19 (copy), v20 (copy), l_UserInputService_0 (copy), v15 (copy), v16 (copy), v18 (copy), v12 (copy), v31 (copy), v10 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v34 = v4.useRef(nil);
    local v35 = v4.useRef(true);
    local v36, v37 = v4.useBinding(false);
    local v38 = v4.useRef(false);
    local v39 = v11 and v32.children == nil;
    local v40 = v4.useBinding(0);
    local v41 = v32.textTransparency or v40;
    local v42 = v6(false);
    local v43 = v9({
        enabled = v39, 
        messagesStore = v42, 
        textTransparency = v41, 
        chatWindowSettings = v32.chatWindowSettings or v19, 
        isSpatialUIEnabled = v32.isSpatialUIEnabled or false, 
        onTextMessageLabelButtonActivated = v32.onTextMessageLabelButtonActivated or v20, 
        onToggle = v32.onToggle or v20, 
        targetTextChannel = v32.targetTextChannel, 
        isChannelBarVisible = v32.isChannelBarVisible
    });
    local l_children_0 = v43.children;
    local l_windowMessageAddedCount_0 = v43.windowMessageAddedCount;
    local v48 = v4.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: l_UserInputService_0 (ref), v37 (copy), v38 (copy)
        local l_PreferredInput_0 = l_UserInputService_0.PreferredInput;
        local v47 = true;
        if l_PreferredInput_0 ~= Enum.PreferredInput.KeyboardAndMouse then
            v47 = l_PreferredInput_0 == Enum.PreferredInput.Touch;
        end;
        if v47 then
            v37(true);
        end;
        if l_PreferredInput_0 == Enum.PreferredInput.Touch then
            v38.current = true;
        end;
    end, {
        l_UserInputService_0.PreferredInput
    });
    local v51 = v4.useCallback(function() --[[ Line: 110 ]]
        -- upvalues: l_UserInputService_0 (ref), v37 (copy), v38 (copy)
        local l_PreferredInput_1 = l_UserInputService_0.PreferredInput;
        local v50 = true;
        if l_PreferredInput_1 ~= Enum.PreferredInput.KeyboardAndMouse then
            v50 = l_PreferredInput_1 == Enum.PreferredInput.Touch;
        end;
        if v50 then
            v37(false);
        end;
        if l_PreferredInput_1 == Enum.PreferredInput.Touch then
            v38.current = false;
        end;
    end, {
        l_UserInputService_0.PreferredInput
    });
    local v52 = nil;
    if v15 then
        v52 = v4.useRef(nil);
        v4.useEffect(function() --[[ Line: 124 ]]
            -- upvalues: v52 (ref)
            return function() --[[ Line: 125 ]]
                -- upvalues: v52 (ref)
                if v52.current then
                    v52.current.cleanup();
                end;
            end;
        end, {});
    end;
    local v60 = v4.useCallback(function(v53) --[[ Line: 133 ]]
        -- upvalues: v15 (ref), v52 (ref), v16 (ref), v35 (copy), v18 (ref), v12 (ref), v31 (ref)
        if v15 then
            if v52.current == nil then
                v52.current = v16.startChatWindowScrollInterval(v16.Events.ChatWindowScrollInterval, v53, {});
            end;
            if v52.current then
                v52.current.onScrollTick();
            end;
        end;
        local l_v35_0 = v35;
        local l_AbsoluteWindowSize_1 = v53.AbsoluteWindowSize;
        local l_CanvasPosition_1 = v53.CanvasPosition;
        local l_AbsoluteCanvasSize_1 = v53.AbsoluteCanvasSize;
        local v58 = l_AbsoluteCanvasSize_1 - l_AbsoluteWindowSize_1;
        local v59 = l_CanvasPosition_1.Y / v58.Y;
        l_v35_0.current = l_AbsoluteCanvasSize_1.Y <= l_AbsoluteWindowSize_1.Y or v59 >= v18;
        if v12() and not v35.current then
            v31();
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 153 ]]
        -- upvalues: v32 (copy), v35 (copy), v38 (copy), v34 (copy)
        if v32.isChannelBarVisible and v32.targetTextChannel then
            v35.current = true;
            if not v38.current and v34.current then
                v34.current.CanvasPosition = Vector2.new(0, 9.007199254740992E15);
            end;
        end;
    end, {
        v32.targetTextChannel, 
        v32.isChannelBarVisible
    });
    v4.useEffect(function() --[[ Line: 164 ]]
        -- upvalues: v34 (copy), v35 (copy), v38 (copy)
        local l_current_0 = v34.current;
        if not l_current_0 then
            return;
        else
            local v62 = l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 172 ]]
                -- upvalues: v35 (ref), v38 (ref), v34 (ref)
                if v35.current and not v38.current and v34.current then
                    v34.current.CanvasPosition = Vector2.new(0, 9.007199254740992E15);
                end;
            end);
            return function() --[[ Line: 181 ]]
                -- upvalues: v62 (copy)
                v62:Disconnect();
            end;
        end;
    end, if v11 then {
        if v39 then l_windowMessageAddedCount_0 else v32.children, 
        v35.current, 
        v38.current, 
        v34.current, 
        v32.targetTextChannel
    } else {
        tostring(v34), 
        v35, 
        v38
    });
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v32.Size, 
        [v4.Event.InputBegan] = v48, 
        [v4.Event.InputEnded] = v51
    }, {
        padding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        scrollView = v4.createElement("ScrollingFrame", {
            ref = v34, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = v36:map(function(v63) --[[ Line: 217 ]]
                if v63 then
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
            [v4.Change.CanvasPosition] = v60
        }, if v39 then l_children_0 else v32.children)
    });
end);