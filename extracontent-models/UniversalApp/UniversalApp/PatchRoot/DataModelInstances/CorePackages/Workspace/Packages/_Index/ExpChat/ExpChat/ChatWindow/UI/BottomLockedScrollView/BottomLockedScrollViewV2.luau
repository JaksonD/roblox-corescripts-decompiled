local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.VirtualizedList);
local v5 = require(l_Parent_0.SharedFlags);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v7 = require(l_script_FirstAncestor_0.ChatWindow.Helpers.debounce);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatSendWindowScrollEvent);
local l_FFlagExpChatAddPaddingAroundARButton_0 = v5.FFlagExpChatAddPaddingAroundARButton;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local v13 = game:DefineFastInt("ExpChatWindowScrollV2Debounce", 0);
local v14 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100;
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
local function _(v16) --[[ Line: 26 ]] --[[ Name: isScrollbarNearBottom ]]
    -- upvalues: v14 (copy)
    local l_AbsoluteWindowSize_0 = v16.AbsoluteWindowSize;
    local l_CanvasPosition_0 = v16.CanvasPosition;
    local l_AbsoluteCanvasSize_0 = v16.AbsoluteCanvasSize;
    local v20 = l_AbsoluteCanvasSize_0 - l_AbsoluteWindowSize_0;
    local v21 = l_CanvasPosition_0.Y / v20.Y;
    if l_AbsoluteCanvasSize_0.Y <= l_AbsoluteWindowSize_0.Y then
        return true;
    else
        return v14 <= v21;
    end;
end;
local function _(v23) --[[ Line: 41 ]] --[[ Name: isMouseMovementOrTouch ]]
    local v24 = true;
    if v23.UserInputType ~= Enum.UserInputType.MouseMovement then
        v24 = v23.UserInputType == Enum.UserInputType.Touch;
    end;
    return v24;
end;
local v26 = v7(function() --[[ Line: 46 ]]
    -- upvalues: l_TextChatService_0 (copy)
    l_TextChatService_0:SendExpChatWindowScroll();
end, v13);
return (v3.memo(function(v27) --[[ Line: 50 ]] --[[ Name: BottomLockedScrollViewV2 ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v12 (copy), v9 (copy), v4 (copy), v8 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v14 (copy), v10 (copy), v26 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v29 = v3.useRef(nil);
    local v30 = v3.useRef(nil);
    local v31, v32 = v3.useState(true);
    local v33, v34 = v3.useState(false);
    local v35, v36 = v3.useState(false);
    local v37, v38 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v30 (copy), v29 (copy)
        if v30.current then
            local l_FirstChildWhichIsA_0 = v30.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                v29.current = l_FirstChildWhichIsA_0;
            end;
        end;
    end, {
        v30
    });
    if (l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() or v12) and not v9 then
        v3.useEffect(function() --[[ Line: 74 ]]
            -- upvalues: v29 (copy), v31 (copy), v35 (copy)
            local l_current_0 = v29.current;
            if not l_current_0 then
                return;
            else
                local v41 = l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 80 ]]
                    -- upvalues: v31 (ref), v35 (ref), v29 (ref)
                    if v31 and not v35 and v29.current then
                        v29.current.CanvasPosition = Vector2.new(0, 9.223372036854776E18);
                    end;
                end);
                return function() --[[ Line: 86 ]]
                    -- upvalues: v41 (copy)
                    v41:Disconnect();
                end;
            end;
        end, {
            tostring(v29), 
            v31, 
            v35
        });
    end;
    v3.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v31 (copy), v35 (copy), v29 (copy)
        if v31 and v35 == false and v29.current then
            v29.current.CanvasPosition = Vector2.new(0, 9.223372036854776E18);
        end;
    end, {
        if not not v9 or l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() then nil else tostring(v27.messages), 
        v31, 
        v35, 
        tostring(v29), 
        v27.targetTextChannel
    });
    v3.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v27 (copy), v37 (copy), v38 (copy), v32 (copy)
        if v27.targetTextChannel and v27.targetTextChannel ~= v37 then
            v38(v27.targetTextChannel);
            if v27.isChannelBarVisible then
                v32(true);
            end;
        end;
    end, {
        v27.targetTextChannel
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v27.Size, 
        ref = v30, 
        [v3.Event.InputBegan] = function(_, v43) --[[ Line: 124 ]]
            -- upvalues: v34 (copy), v36 (copy)
            local v44 = true;
            if v43.UserInputType ~= Enum.UserInputType.MouseMovement then
                v44 = v43.UserInputType == Enum.UserInputType.Touch;
            end;
            if v44 then
                v34(true);
            end;
            if v43.UserInputType == Enum.UserInputType.Touch then
                v36(true);
            end;
        end, 
        [v3.Event.InputEnded] = function(_, v46) --[[ Line: 133 ]]
            -- upvalues: v34 (copy), v36 (copy)
            local v47 = true;
            if v46.UserInputType ~= Enum.UserInputType.MouseMovement then
                v47 = v46.UserInputType == Enum.UserInputType.Touch;
            end;
            if v47 then
                v34(false);
            end;
            if v46.UserInputType == Enum.UserInputType.Touch then
                v36(false);
            end;
        end
    }, {
        padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        scrollView = v3.createElement(v4.ScrollView, {
            style = {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                ScrollBarImageTransparency = v33 and 0 or 1, 
                ScrollBarThickness = 8, 
                Selectable = not v8 and nil, 
                VerticalScrollBarInset = if l_FFlagExpChatAddPaddingAroundARButton_0 then nil else Enum.ScrollBarInset.Always
            }, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            Size = UDim2.fromScale(1, 1), 
            onScroll = function(v48) --[[ Line: 165 ]] --[[ Name: onScroll ]]
                -- upvalues: v14 (ref), v32 (copy), v10 (ref), v26 (ref)
                local l_AbsoluteWindowSize_1 = v48.AbsoluteWindowSize;
                local l_CanvasPosition_1 = v48.CanvasPosition;
                local l_AbsoluteCanvasSize_1 = v48.AbsoluteCanvasSize;
                local v52 = l_AbsoluteCanvasSize_1 - l_AbsoluteWindowSize_1;
                local v53 = l_CanvasPosition_1.Y / v52.Y;
                local v54 = l_AbsoluteCanvasSize_1.Y <= l_AbsoluteWindowSize_1.Y or v53 >= v14;
                v32(v54);
                if v10() and not v54 then
                    v26();
                end;
            end
        }, v27.children)
    });
end));