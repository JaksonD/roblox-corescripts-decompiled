local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_ColorSystem_0 = v3.Common.Style.ColorSystem;
local v5 = require(l_Parent_0.Cryo);
local l_Constants_0 = v3.App.Style.Constants;
local v7 = require(script.Parent.ChatBubbleEnum);
local v8 = require(script.Parent.ChatBubbleTail);
local v9 = require(script.Parent.ChatBubble);
local v10 = require(script.Parent.ChatBubbleGroupable);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local v13 = require(script.Parent.RepliedToMarker);
local v14 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v14.Hooks.useTokens;
local l_useCursor_0 = v14.Hooks.useCursor;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v18 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v19 = require(l_script_FirstAncestor_0.Flags.unfilteredMessageColorConfig);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
local l_BUBBLE_VARIANTS_0 = v7.BUBBLE_VARIANTS;
local v23 = {
    isIncoming = false, 
    hasTail = false, 
    padding = 12, 
    LayoutOrder = 0, 
    isPending = false, 
    isUnfiltered = false, 
    isAssetCard = false, 
    isRepliedTo = false, 
    isPressed = false, 
    isLastMessageInMessageGroup = false, 
    [v2.Change.AbsoluteSize] = function(_) --[[ Line: 54 ]]

    end
};
return v2.memo(function(v24) --[[ Line: 57 ]] --[[ Name: ChatBubbleContainer ]]
    -- upvalues: v5 (copy), v23 (copy), v2 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_useCursor_0 (copy), v14 (copy), l_useTokens_0 (copy), l_useStyle_0 (copy), l_useSelectedTheme_0 (copy), v18 (copy), l_Constants_0 (copy), l_ColorSystem_0 (copy), v20 (copy), v19 (copy), l_BUBBLE_VARIANTS_0 (copy), v7 (copy), v10 (copy), v13 (copy), v9 (copy), v8 (copy)
    local v25 = v5.Dictionary.join(v23, v24);
    local v26, v27 = v2.useState(0);
    local v28 = v25[v2.Change.AbsoluteSize];
    local v29 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useCursor_0(v14.Enums.CursorType.RoundedSlot) else nil;
    local v30 = l_useTokens_0();
    local v31 = l_useStyle_0();
    local v32 = v25.children or {};
    local l_hasTail_0 = v25.hasTail;
    local l_isIncoming_0 = v25.isIncoming;
    local l_isPending_0 = v25.isPending;
    local l_isUnfiltered_0 = v25.isUnfiltered;
    local v37 = nil;
    local v38 = nil;
    local v39 = l_useSelectedTheme_0();
    local v40 = nil;
    local v41 = nil;
    if v18() then
        local v42, v43 = v2.useState(v31.Theme.UIDefault);
        v40 = v42;
        v41 = v43;
    end;
    local function v45() --[[ Line: 83 ]] --[[ Name: setBubbleStyle ]]
        -- upvalues: v18 (ref), v25 (copy), v39 (copy), l_Constants_0 (ref), l_ColorSystem_0 (ref), v20 (ref), v30 (copy), l_isIncoming_0 (copy), l_isUnfiltered_0 (copy), v31 (copy), l_isPending_0 (copy), v19 (ref), v37 (ref), v38 (ref), v41 (ref)
        local v44 = nil;
        v44 = if v18() and v25.isRepliedTo then {
            Color = if v39 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[30] else l_ColorSystem_0.Gray[90], 
            Transparency = 0
        } else if v20 then if v25.isAssetCard then {
            Color = v30.Color.Shift.Shift_400.Color3, 
            Transparency = v30.Color.Shift.Shift_400.Transparency
        } else if l_isIncoming_0 then {
            Color = v30.Color.Shift.Shift_400.Color3, 
            Transparency = v30.Color.Shift.Shift_400.Transparency
        } else if l_isUnfiltered_0 then {
            Color = v30.Color.System.Emphasis.Color3, 
            Transparency = v30.Color.System.Emphasis.Transparency
        } else {
            Color = v30.Color.Extended.Gray.Gray_600.Color3, 
            Transparency = v30.Color.Extended.Gray.Gray_600.Transparency
        } else if l_isIncoming_0 then v31.Theme.UIDefault else if l_isPending_0 then if not l_isUnfiltered_0 or v25.isAssetCard then v31.Theme.UIMuted else {
            Color = v30.Color.Extended.Blue.Blue_500.Color3, 
            Transparency = v30.Color.Extended.Blue.Blue_500.Transparency
        } else if not l_isUnfiltered_0 or v25.isAssetCard then v31.Theme.UIEmphasis else {
            Color = if v39 == string.lower(l_Constants_0.ThemeName.Light) then v19.UnfilteredMessageLightColor3 else v19.UnfilteredMessageDarkColor3, 
            Transparency = v19.UnfilteredMessageTransparency
        };
        v37 = v44.Color;
        v38 = v44.Transparency;
        if v18() then
            v41(v44);
        end;
    end;
    local function v47() --[[ Line: 147 ]] --[[ Name: setPressedBubbleStyle ]]
        -- upvalues: v18 (ref), v25 (copy), l_isIncoming_0 (copy), v39 (copy), l_Constants_0 (ref), l_ColorSystem_0 (ref), l_isUnfiltered_0 (copy), v19 (ref), v41 (ref)
        if not v18() or v25.isRepliedTo or v25.isPending then
            return;
        else
            local v46 = nil;
            v46 = if l_isIncoming_0 then {
                Color = if v39 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[50] else l_ColorSystem_0.Gray[70], 
                Transparency = 0.35
            } else if not l_isUnfiltered_0 or v25.isAssetCard then {
                Color = if v39 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[50] else l_ColorSystem_0.Gray[70], 
                Transparency = 0.4
            } else {
                Color = if v39 == l_Constants_0.ThemeName.Light then v19.UnfilteredMessagePressedLightColor3 else v19.UnfilteredMessagePressedDarkColor3, 
                Transparency = v19.UnfilteredMessageTransparency
            };
            v41(v46);
            return;
        end;
    end;
    if v18() then
        v2.useLayoutEffect(function() --[[ Line: 183 ]]
            -- upvalues: v25 (copy), v47 (copy), v45 (copy)
            if v25.isPressed then
                v47();
                return;
            else
                v45();
                return;
            end;
        end, {
            v25.isPressed, 
            v25.isRepliedTo, 
            v39, 
            l_isIncoming_0, 
            l_isPending_0, 
            l_isUnfiltered_0, 
            v25.isAssetCard
        });
    else
        v45();
    end;
    local function _(v48, v49, v50) --[[ Line: 204 ]] --[[ Name: getBubbleVariant ]]
        -- upvalues: l_BUBBLE_VARIANTS_0 (ref)
        if v48 and v49 or v50 then
            return l_BUBBLE_VARIANTS_0.SINGLE;
        elseif v48 then
            return l_BUBBLE_VARIANTS_0.TOP;
        elseif v49 then
            return l_BUBBLE_VARIANTS_0.BOTTOM;
        else
            return l_BUBBLE_VARIANTS_0.MIDDLE;
        end;
    end;
    local function v62() --[[ Line: 220 ]] --[[ Name: renderGroupedBubbleUI ]]
        -- upvalues: v2 (ref), v14 (ref), v25 (copy), l_FFlagEnableAppChatFocusableFixes_0 (ref), v29 (copy), l_isIncoming_0 (copy), v7 (ref), v10 (ref), v32 (copy), v18 (ref), v40 (ref), v37 (ref), v38 (ref), l_BUBBLE_VARIANTS_0 (ref), v13 (ref)
        local l_createElement_0 = v2.createElement;
        local l_View_0 = v14.View;
        local v54 = {
            tag = "auto-xy size-0-0", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v25.LayoutOrder, 
            BackgroundTransparency = 1, 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = true, 
                SelectionImageObject = v29
            } else nil, 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = l_isIncoming_0 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right, 
                Padding = UDim.new(0, v7.REPLIED_TO_MARKER_GAP)
            }
        };
        local v55 = {};
        local l_createElement_1 = v2.createElement;
        local l_v10_0 = v10;
        local v58 = {
            alignment = l_isIncoming_0 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right, 
            children = v32, 
            imageStyle = {
                Color3 = if v18() then v40.Color else v37, 
                Transparency = if v18() then v40.Transparency else v38
            }, 
            layoutOrder = 1, 
            padding = v25.padding
        };
        local l_hasTail_1 = v25.hasTail;
        local l_isLastMessageInMessageGroup_0 = v25.isLastMessageInMessageGroup;
        local l_isRepliedTo_0 = v25.isRepliedTo;
        v58.variant = if l_hasTail_1 and l_isLastMessageInMessageGroup_0 or l_isRepliedTo_0 then l_BUBBLE_VARIANTS_0.SINGLE else if l_hasTail_1 then l_BUBBLE_VARIANTS_0.TOP else if l_isLastMessageInMessageGroup_0 then l_BUBBLE_VARIANTS_0.BOTTOM else l_BUBBLE_VARIANTS_0.MIDDLE;
        v55.bubble = l_createElement_1(l_v10_0, v58);
        v55.repliedToMarker = if v18() and v25.isRepliedTo then v2.createElement(v13, {
            isIncoming = l_isIncoming_0, 
            layoutOrder = v25.isIncoming and 0 or 2
        }) else nil;
        return l_createElement_0(l_View_0, v54, v55);
    end;
    local function v63() --[[ Line: 260 ]] --[[ Name: renderLegacyBubbleUI ]]
        -- upvalues: v2 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), l_hasTail_0 (copy), v26 (copy), v7 (ref), v18 (ref), v25 (copy), v29 (copy), v9 (ref), l_isIncoming_0 (copy), v40 (ref), v37 (ref), v38 (ref), v28 (copy), v27 (copy), v32 (copy), v8 (ref), v13 (ref)
        return v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Selectable = if l_FFlagEnableAppChatFocusableFixes_0 then l_hasTail_0 else nil, 
            Size = UDim2.new(0, v26 + v7.TAIL_WIDTH + if v18() and v25.isRepliedTo then v7.REPLIED_TO_MARKER_GAP + v7.REPLIED_TO_MARKER_WIDTH else 0, 0, 0), 
            SelectionImageObject = v29, 
            LayoutOrder = v25.LayoutOrder, 
            BackgroundTransparency = 1
        }, {
            bubble = v2.createElement(v9, {
                contentWidth = v26, 
                isIncoming = l_isIncoming_0, 
                isRepliedTo = if v18() then v25.isRepliedTo else nil, 
                imageColor = if v18() then v40.Color else v37, 
                imageTransparency = if v18() then v40.Transparency else v38, 
                padding = v25.padding, 
                hasTail = l_hasTail_0, 
                onAbsoluteSizeChanged = v28, 
                setContentWidth = v27, 
                containerChildren = v32
            }), 
            tail = l_hasTail_0 and v2.createElement(v8, {
                isIncoming = l_isIncoming_0, 
                imageColor = if v18() then v40.Color else v37, 
                imageTransparency = if v18() then v40.Transparency else v38
            }), 
            repliedToMarker = if v18() and v25.isRepliedTo then v2.createElement(v13, {
                isIncoming = l_isIncoming_0
            }) else nil
        });
    end;
    return if v20 then v62() else v63();
end);