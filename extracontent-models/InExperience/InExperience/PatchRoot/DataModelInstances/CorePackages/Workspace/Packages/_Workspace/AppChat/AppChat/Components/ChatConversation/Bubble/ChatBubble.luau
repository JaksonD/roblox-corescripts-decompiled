local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.ChatBubbleEnum);
local v6 = require(l_Parent_0.Foundation);
local l_useCursor_0 = v6.Hooks.useCursor;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v13 = {
    contentWidth = 0, 
    isIncoming = false, 
    isRepliedTo = false, 
    imageColor = Color3.new(0, 0, 0), 
    imageTransparency = 0, 
    padding = 0, 
    hasTail = false, 
    onAbsoluteSizeChanged = function(_) --[[ Line: 39 ]] --[[ Name: onAbsoluteSizeChanged ]]

    end, 
    setContentWidth = function(_) --[[ Line: 40 ]] --[[ Name: setContentWidth ]]

    end, 
    handleEvent = function(_) --[[ Line: 41 ]] --[[ Name: handleEvent ]]

    end, 
    containerChildren = {}
};
ChatBubble = function(v14) --[[ Line: 53 ]] --[[ Name: ChatBubble ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), l_useCursor_0 (copy), v6 (copy), v4 (copy), v13 (copy), v5 (copy), v9 (copy), v2 (copy), l_Object_0 (copy)
    local v15 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useCursor_0(v6.Enums.CursorType.RoundedRect) else nil;
    local v16 = v4.Dictionary.union(v13, v14);
    local v17 = UDim.new(0, v16.padding or v13.padding);
    local v18 = v5.TAIL_WIDTH + if v9() and v16.isRepliedTo then v5.REPLIED_TO_MARKER_WIDTH + v5.REPLIED_TO_MARKER_GAP else 0;
    local v19 = if v16.isIncoming then UDim2.new(0, v18, 0, 0) else UDim2.new(1, -v18, 0, 0);
    local l_BUBBLE_0 = v5.BUBBLE;
    if v16.hasTail then
        l_BUBBLE_0 = if v16.isIncoming then v5.RECEIVED_BUBBLE_WITH_TAIL else v5.SENT_BUBBLE_WITH_TAIL;
    end;
    local v22 = v2.useCallback(function(v21) --[[ Line: 76 ]]
        -- upvalues: v16 (copy)
        v16.onAbsoluteSizeChanged(v21);
    end, {
        v16.onAbsoluteSizeChanged
    });
    local v24 = v2.useCallback(function(v23) --[[ Line: 80 ]]
        -- upvalues: v16 (copy), v17 (copy)
        v16.setContentWidth(v23.AbsoluteContentSize.X + v17.Offset * 2);
    end, {
        v16.setContentWidth
    });
    return v2.createElement("ImageLabel", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(0, v16.contentWidth, 0, 0), 
        AnchorPoint = v16.isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        ImageColor3 = v16.imageColor, 
        Image = l_BUBBLE_0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v5.SLIDE_CENTER, 
        ImageTransparency = v16.imageTransparency, 
        Position = v19, 
        Selectable = if l_FFlagEnableAppChatFocusableFixes_0 then not v16.hasTail else nil, 
        SelectionImageObject = v15, 
        [v2.Change.AbsoluteSize] = v22
    }, l_Object_0.assign(table.clone(v16.containerChildren), {
        ["$margin"] = v2.createElement("UIPadding", {
            PaddingBottom = v17, 
            PaddingTop = v17, 
            PaddingRight = v17, 
            PaddingLeft = v17
        }), 
        ["$layout"] = v2.createElement("UIListLayout", {
            [v2.Change.AbsoluteContentSize] = v24
        })
    }));
end;
return v2.memo(ChatBubble);