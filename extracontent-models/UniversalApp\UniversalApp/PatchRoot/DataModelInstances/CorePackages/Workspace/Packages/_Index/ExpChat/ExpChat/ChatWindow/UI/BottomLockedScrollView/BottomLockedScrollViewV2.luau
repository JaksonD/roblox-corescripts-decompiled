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
local v15 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local _ = require(l_Parent_0.SocialLuaAnalytics);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatScrollPerfTracking);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
local function _(v19) --[[ Line: 30 ]] --[[ Name: isScrollbarNearBottom ]]
    -- upvalues: v14 (copy)
    local l_AbsoluteWindowSize_0 = v19.AbsoluteWindowSize;
    local l_CanvasPosition_0 = v19.CanvasPosition;
    local l_AbsoluteCanvasSize_0 = v19.AbsoluteCanvasSize;
    local v23 = l_AbsoluteCanvasSize_0 - l_AbsoluteWindowSize_0;
    local v24 = l_CanvasPosition_0.Y / v23.Y;
    if l_AbsoluteCanvasSize_0.Y <= l_AbsoluteWindowSize_0.Y then
        return true;
    else
        return v14 <= v24;
    end;
end;
local function _(v26) --[[ Line: 45 ]] --[[ Name: isMouseMovementOrTouch ]]
    local v27 = true;
    if v26.UserInputType ~= Enum.UserInputType.MouseMovement then
        v27 = v26.UserInputType == Enum.UserInputType.Touch;
    end;
    return v27;
end;
local v29 = v7(function() --[[ Line: 50 ]]
    -- upvalues: l_TextChatService_0 (copy)
    l_TextChatService_0:SendExpChatWindowScroll();
end, v13);
return (v3.memo(function(v30) --[[ Line: 54 ]] --[[ Name: BottomLockedScrollViewV2 ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v17 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v12 (copy), v9 (copy), v4 (copy), v8 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v15 (copy), v14 (copy), v10 (copy), v29 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v32 = v3.useRef(nil);
    local v33 = v3.useRef(nil);
    local v34, v35 = v3.useState(true);
    local v36, v37 = v3.useState(false);
    local v38, v39 = v3.useState(false);
    local v40, v41 = v3.useState(nil);
    local v42 = nil;
    if v17 then
        v42 = v3.useRef(nil);
        v3.useEffect(function() --[[ Line: 67 ]]
            -- upvalues: v42 (ref)
            return function() --[[ Line: 68 ]]
                -- upvalues: v42 (ref)
                if v42.current then
                    v42.current.cleanup();
                end;
            end;
        end, {});
    end;
    v3.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v33 (copy), v32 (copy)
        if v33.current then
            local l_FirstChildWhichIsA_0 = v33.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                v32.current = l_FirstChildWhichIsA_0;
            end;
        end;
    end, {
        v33
    });
    if (l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() or v12) and not v9 then
        v3.useEffect(function() --[[ Line: 89 ]]
            -- upvalues: v32 (copy), v34 (copy), v38 (copy)
            local l_current_0 = v32.current;
            if not l_current_0 then
                return;
            else
                local v45 = l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 95 ]]
                    -- upvalues: v34 (ref), v38 (ref), v32 (ref)
                    if v34 and not v38 and v32.current then
                        v32.current.CanvasPosition = Vector2.new(0, 9.223372036854776E18);
                    end;
                end);
                return function() --[[ Line: 101 ]]
                    -- upvalues: v45 (copy)
                    v45:Disconnect();
                end;
            end;
        end, {
            tostring(v32), 
            v34, 
            v38
        });
    end;
    v3.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: v34 (copy), v38 (copy), v32 (copy)
        if v34 and v38 == false and v32.current then
            v32.current.CanvasPosition = Vector2.new(0, 9.223372036854776E18);
        end;
    end, {
        if not not v9 or l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() then nil else tostring(v30.messages), 
        v34, 
        v38, 
        tostring(v32), 
        v30.targetTextChannel
    });
    v3.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: v30 (copy), v40 (copy), v41 (copy), v35 (copy)
        if v30.targetTextChannel and v30.targetTextChannel ~= v40 then
            v41(v30.targetTextChannel);
            if v30.isChannelBarVisible then
                v35(true);
            end;
        end;
    end, {
        v30.targetTextChannel
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v30.Size, 
        ref = v33, 
        [v3.Event.InputBegan] = function(_, v47) --[[ Line: 139 ]]
            -- upvalues: v37 (copy), v39 (copy)
            local v48 = true;
            if v47.UserInputType ~= Enum.UserInputType.MouseMovement then
                v48 = v47.UserInputType == Enum.UserInputType.Touch;
            end;
            if v48 then
                v37(true);
            end;
            if v47.UserInputType == Enum.UserInputType.Touch then
                v39(true);
            end;
        end, 
        [v3.Event.InputEnded] = function(_, v50) --[[ Line: 148 ]]
            -- upvalues: v37 (copy), v39 (copy)
            local v51 = true;
            if v50.UserInputType ~= Enum.UserInputType.MouseMovement then
                v51 = v50.UserInputType == Enum.UserInputType.Touch;
            end;
            if v51 then
                v37(false);
            end;
            if v50.UserInputType == Enum.UserInputType.Touch then
                v39(false);
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
                ScrollBarImageTransparency = v36 and 0 or 1, 
                ScrollBarThickness = 8, 
                Selectable = not v8 and nil, 
                VerticalScrollBarInset = if l_FFlagExpChatAddPaddingAroundARButton_0 then nil else Enum.ScrollBarInset.Always
            }, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            Size = UDim2.fromScale(1, 1), 
            onScroll = function(v52) --[[ Line: 180 ]] --[[ Name: onScroll ]]
                -- upvalues: v17 (ref), v42 (ref), v15 (ref), v14 (ref), v35 (copy), v10 (ref), v29 (ref)
                if v17 then
                    if v42.current == nil then
                        v42.current = v15.startChatWindowScrollInterval(v15.Events.ChatWindowScrollInterval, v52, {});
                    end;
                    if v42.current then
                        v42.current.onScrollTick();
                    end;
                end;
                local l_AbsoluteWindowSize_1 = v52.AbsoluteWindowSize;
                local l_CanvasPosition_1 = v52.CanvasPosition;
                local l_AbsoluteCanvasSize_1 = v52.AbsoluteCanvasSize;
                local v56 = l_AbsoluteCanvasSize_1 - l_AbsoluteWindowSize_1;
                local v57 = l_CanvasPosition_1.Y / v56.Y;
                local v58 = l_AbsoluteCanvasSize_1.Y <= l_AbsoluteWindowSize_1.Y or v57 >= v14;
                v35(v58);
                if v10() and not v58 then
                    v29();
                end;
            end
        }, v30.children)
    });
end));