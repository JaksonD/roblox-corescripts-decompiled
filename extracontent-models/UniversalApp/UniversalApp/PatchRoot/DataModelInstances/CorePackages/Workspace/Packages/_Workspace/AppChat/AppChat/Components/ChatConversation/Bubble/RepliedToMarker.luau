local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_ColorSystem_0 = v4.Common.Style.ColorSystem;
local l_Constants_0 = v4.App.Style.Constants;
local v7 = require(script.Parent.ChatBubbleEnum);
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local v9 = require(l_Parent_0.Foundation);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatFixLongRepliesMarker);
local v12 = {
    isIncoming = false
};
RepliedToMarker = function(v13) --[[ Line: 39 ]] --[[ Name: RepliedToMarker ]]
    -- upvalues: v3 (copy), v12 (copy), l_useSelectedTheme_0 (copy), l_Constants_0 (copy), l_ColorSystem_0 (copy), v2 (copy), v11 (copy), v9 (copy), v10 (copy), v7 (copy)
    local v14 = v3.Dictionary.union(v12, v13);
    local v15 = l_useSelectedTheme_0();
    local v16 = nil;
    v16 = if v15 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[40] else l_ColorSystem_0.Gray[80];
    return v2.createElement(if v11 then v9.View else "Frame", {
        tag = v11 and "bg-shift-400 self-stretch" or nil, 
        Size = if v11 and v10 then UDim2.new(0, v7.REPLIED_TO_MARKER_WIDTH, 0, 0) else UDim2.new(0, v7.REPLIED_TO_MARKER_WIDTH, 1, 0), 
        BackgroundColor3 = if v11 then nil else v16, 
        BorderSizePixel = 0, 
        AnchorPoint = if v14.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0), 
        Position = if v10 then nil else if v14.isIncoming then UDim2.new(0, v7.TAIL_WIDTH, 0, 0) else UDim2.new(1, -v7.TAIL_WIDTH, 0, 0), 
        LayoutOrder = if v10 then v14.layoutOrder else nil
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;
return v2.memo(RepliedToMarker);