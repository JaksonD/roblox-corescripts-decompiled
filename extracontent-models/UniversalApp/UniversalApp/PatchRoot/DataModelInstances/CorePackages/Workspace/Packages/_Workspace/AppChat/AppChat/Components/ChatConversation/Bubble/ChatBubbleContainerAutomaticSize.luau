local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_ColorSystem_0 = v3.Common.Style.ColorSystem;
local v5 = require(l_Parent_0.Cryo);
local l_Constants_0 = v3.App.Style.Constants;
local v7 = require(script.Parent.ChatBubbleEnum);
local v8 = require(script.Parent.ChatBubbleGroupable);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local v11 = require(script.Parent.RepliedToMarker);
local v12 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v12.Hooks.useTokens;
local l_useCursor_0 = v12.Hooks.useCursor;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v17 = require(l_script_FirstAncestor_0.Flags.unfilteredMessageColorConfig);
local l_BUBBLE_VARIANTS_0 = v7.BUBBLE_VARIANTS;
local v20 = {
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
    [v2.Change.AbsoluteSize] = function(_) --[[ Line: 51 ]]

    end
};
return v2.memo(function(v21) --[[ Line: 54 ]] --[[ Name: ChatBubbleContainer ]]
    -- upvalues: v5 (copy), v20 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_useCursor_0 (copy), v12 (copy), l_useTokens_0 (copy), l_useStyle_0 (copy), l_useSelectedTheme_0 (copy), v16 (copy), v2 (copy), l_Constants_0 (copy), l_ColorSystem_0 (copy), v17 (copy), l_BUBBLE_VARIANTS_0 (copy), v7 (copy), v8 (copy), v11 (copy)
    local v22 = v5.Dictionary.join(v20, v21);
    local v23 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useCursor_0(v12.Enums.CursorType.RoundedSlot) else nil;
    local v24 = l_useTokens_0();
    local v25 = l_useStyle_0();
    local v26 = v22.children or {};
    local l_isIncoming_0 = v22.isIncoming;
    local l_isPending_0 = v22.isPending;
    local l_isUnfiltered_0 = v22.isUnfiltered;
    local v30 = nil;
    local v31 = nil;
    local v32 = l_useSelectedTheme_0();
    local v33 = nil;
    local v34 = nil;
    if v16() then
        local v35, v36 = v2.useState(v25.Theme.UIDefault);
        v33 = v35;
        v34 = v36;
    end;
    local function v38() --[[ Line: 77 ]] --[[ Name: setBubbleStyle ]]
        -- upvalues: v16 (ref), v22 (copy), v32 (copy), l_Constants_0 (ref), l_ColorSystem_0 (ref), v24 (copy), l_isIncoming_0 (copy), l_isUnfiltered_0 (copy), v30 (ref), v31 (ref), v34 (ref)
        local v37 = nil;
        v37 = if v16() and v22.isRepliedTo then {
            Color = if v32 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[30] else l_ColorSystem_0.Gray[90], 
            Transparency = 0
        } else if v22.isAssetCard then {
            Color = v24.Color.Shift.Shift_400.Color3, 
            Transparency = v24.Color.Shift.Shift_400.Transparency
        } else if l_isIncoming_0 then {
            Color = v24.Color.Shift.Shift_400.Color3, 
            Transparency = v24.Color.Shift.Shift_400.Transparency
        } else if l_isUnfiltered_0 then {
            Color = v24.Color.System.Emphasis.Color3, 
            Transparency = v24.Color.System.Emphasis.Transparency
        } else {
            Color = v24.Color.Extended.Gray.Gray_600.Color3, 
            Transparency = v24.Color.Extended.Gray.Gray_600.Transparency
        };
        v30 = v37.Color;
        v31 = v37.Transparency;
        if v16() then
            v34(v37);
        end;
    end;
    local function v40() --[[ Line: 120 ]] --[[ Name: setPressedBubbleStyle ]]
        -- upvalues: v16 (ref), v22 (copy), l_isIncoming_0 (copy), v32 (copy), l_Constants_0 (ref), l_ColorSystem_0 (ref), l_isUnfiltered_0 (copy), v17 (ref), v34 (ref)
        if not v16() or v22.isRepliedTo or v22.isPending then
            return;
        else
            local v39 = nil;
            v39 = if l_isIncoming_0 then {
                Color = if v32 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[50] else l_ColorSystem_0.Gray[70], 
                Transparency = 0.35
            } else if not l_isUnfiltered_0 or v22.isAssetCard then {
                Color = if v32 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[50] else l_ColorSystem_0.Gray[70], 
                Transparency = 0.4
            } else {
                Color = if v32 == l_Constants_0.ThemeName.Light then v17.UnfilteredMessagePressedLightColor3 else v17.UnfilteredMessagePressedDarkColor3, 
                Transparency = v17.UnfilteredMessageTransparency
            };
            v34(v39);
            return;
        end;
    end;
    if v16() then
        v2.useLayoutEffect(function() --[[ Line: 156 ]]
            -- upvalues: v22 (copy), v40 (copy), v38 (copy)
            if v22.isPressed then
                v40();
                return;
            else
                v38();
                return;
            end;
        end, {
            v22.isPressed, 
            v22.isRepliedTo, 
            v32, 
            l_isIncoming_0, 
            l_isPending_0, 
            l_isUnfiltered_0, 
            v22.isAssetCard
        });
    else
        v38();
    end;
    local function _(v41, v42, v43) --[[ Line: 177 ]] --[[ Name: getBubbleVariant ]]
        -- upvalues: l_BUBBLE_VARIANTS_0 (ref)
        if v41 and v42 or v43 then
            return l_BUBBLE_VARIANTS_0.SINGLE;
        elseif v41 then
            return l_BUBBLE_VARIANTS_0.TOP;
        elseif v42 then
            return l_BUBBLE_VARIANTS_0.BOTTOM;
        else
            return l_BUBBLE_VARIANTS_0.MIDDLE;
        end;
    end;
    return (function() --[[ Line: 193 ]] --[[ Name: renderGroupedBubbleUI ]]
        -- upvalues: v2 (ref), v12 (ref), v22 (copy), l_FFlagEnableAppChatFocusableFixes_0 (ref), v23 (copy), l_isIncoming_0 (copy), v7 (ref), v8 (ref), v26 (copy), v16 (ref), v33 (ref), v30 (ref), v31 (ref), l_BUBBLE_VARIANTS_0 (ref), v11 (ref)
        local l_createElement_0 = v2.createElement;
        local l_View_0 = v12.View;
        local v47 = {
            tag = "auto-xy size-0-0", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v22.LayoutOrder, 
            BackgroundTransparency = 1, 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = true, 
                SelectionImageObject = v23
            } else nil, 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = l_isIncoming_0 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right, 
                Padding = UDim.new(0, v7.REPLIED_TO_MARKER_GAP)
            }
        };
        local v48 = {};
        local l_createElement_1 = v2.createElement;
        local l_v8_0 = v8;
        local v51 = {
            alignment = l_isIncoming_0 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right, 
            children = v26, 
            imageStyle = {
                Color3 = if v16() then v33.Color else v30, 
                Transparency = if v16() then v33.Transparency else v31
            }, 
            layoutOrder = 1, 
            padding = v22.padding
        };
        local l_hasTail_0 = v22.hasTail;
        local l_isLastMessageInMessageGroup_0 = v22.isLastMessageInMessageGroup;
        local l_isRepliedTo_0 = v22.isRepliedTo;
        v51.variant = if l_hasTail_0 and l_isLastMessageInMessageGroup_0 or l_isRepliedTo_0 then l_BUBBLE_VARIANTS_0.SINGLE else if l_hasTail_0 then l_BUBBLE_VARIANTS_0.TOP else if l_isLastMessageInMessageGroup_0 then l_BUBBLE_VARIANTS_0.BOTTOM else l_BUBBLE_VARIANTS_0.MIDDLE;
        v48.bubble = l_createElement_1(l_v8_0, v51);
        v48.repliedToMarker = if v16() and v22.isRepliedTo then v2.createElement(v11, {
            isIncoming = l_isIncoming_0, 
            layoutOrder = v22.isIncoming and 0 or 2
        }) else nil;
        return l_createElement_0(l_View_0, v47, v48);
    end)();
end);