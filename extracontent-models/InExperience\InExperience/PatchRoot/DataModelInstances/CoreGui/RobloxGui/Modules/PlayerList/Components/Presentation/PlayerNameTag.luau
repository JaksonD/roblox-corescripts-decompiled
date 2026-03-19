local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v5 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Connection_0 = l_Parent_0.Components.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v10 = require(l_Parent_0.Hooks.usePlayerCombinedName);
local v11 = require(l_Parent_0.createShallowEqualAndTables);
local v12 = require(l_Parent_0.Flags.FFlagPlayerListReduceRerenders);
local l_useVerifiedBadge_0 = require(l_CorePackages_0.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore;
local v15 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local v16 = v2.PureComponent:extend("PlayerNameTag");
v16.validateProps = v3.strictInterface({
    player = v15, 
    isTitleEntry = v3.boolean, 
    isHovered = v3.boolean, 
    layoutOrder = v3.integer, 
    name = v3.union(v3.string, v3.table), 
    hasVerifiedBadge = v3.optional(v3.boolean), 
    textStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number, 
        StrokeColor = v3.optional(v3.Color3), 
        StrokeTransparency = v3.optional(v3.number)
    }), 
    textFont = v3.strictInterface({
        Size = v3.number, 
        MinSize = v3.number, 
        Font = v3.enum(Enum.Font)
    })
});
v16.render = function(v17) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v5 (copy), v2 (copy), v4 (copy)
    return l_WithLayoutValues_0(function(v18) --[[ Line: 65 ]]
        -- upvalues: v17 (copy), l_FFlagEnableVerifiedBadgeStore_0 (ref), v5 (ref), v2 (ref), v4 (ref)
        local l_IconUnSelectedColor_0 = v18.IconUnSelectedColor;
        if v17.props.isHovered then
            l_IconUnSelectedColor_0 = v18.IconSelectedColor;
        end;
        local l_Font_0 = v17.props.textFont.Font;
        local l_Size_0 = v17.props.textFont.Size;
        local v22 = {};
        local l_PlatformName_0 = v17.props.player.PlatformName;
        local v24 = if l_FFlagEnableVerifiedBadgeStore_0 then v17.props.hasVerifiedBadge else v5.Utils.isPlayerVerified(v17.props.player);
        if v18.IsTenFoot and l_PlatformName_0 ~= "" then
            v22.VerticalLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            });
            v22.PlayerPlatformName = v2.createElement("TextLabel", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0.35, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Font = Enum.Font.SourceSans, 
                TextSize = l_Size_0, 
                TextColor3 = v17.props.textStyle.Color, 
                TextTransparency = v17.props.textStyle.Transparency, 
                TextStrokeColor3 = v17.props.textStyle.StrokeColor, 
                TextStrokeTransparency = v17.props.textStyle.StrokeTransparency, 
                BackgroundTransparency = 1, 
                Text = l_PlatformName_0, 
                LayoutOrder = 2
            });
            v22.RobloxNameFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0.45, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 6)
                }), 
                RobloxIcon = v2.createElement("ImageButton", {
                    Size = UDim2.new(0, 24, 0, 24), 
                    Image = v18.RobloxIconImage, 
                    BackgroundTransparency = 1, 
                    Selectable = false, 
                    ImageColor3 = l_IconUnSelectedColor_0, 
                    LayoutOrder = 1
                }), 
                PlayerNameContainer = v2.createElement(v4.EmojiWrapper, {
                    emoji = if v24 then v4.emoji.verified else "", 
                    layoutOrder = 2, 
                    mockIsEnrolled = true, 
                    size = UDim2.new(1, -30, 0, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    verticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    PlayerName = v2.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        ClipsDescendants = false, 
                        Size = UDim2.fromScale(0, 1), 
                        Font = l_Font_0, 
                        Text = v17.props.name, 
                        TextSize = l_Size_0, 
                        TextColor3 = v17.props.textStyle.Color, 
                        TextTransparency = v17.props.textStyle.Transparency, 
                        TextStrokeColor3 = v17.props.textStyle.StrokeColor, 
                        TextStrokeTransparency = v17.props.textStyle.StrokeTransparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1
                    })
                })
            });
        else
            v22.PlayerNameContainer = v2.createElement(v4.EmojiWrapper, {
                emoji = if v24 then v4.emoji.verified else "", 
                anchorPoint = Vector2.new(0, 0.5), 
                position = UDim2.fromScale(0, 0.5), 
                mockIsEnrolled = true, 
                verticalAlignment = Enum.VerticalAlignment.Center, 
                automaticSize = Enum.AutomaticSize.X, 
                size = UDim2.new(0, 0, 0, l_Size_0)
            }, {
                PlayerName = v2.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.fromScale(0, 1), 
                    Font = l_Font_0, 
                    Text = v17.props.name, 
                    TextSize = l_Size_0, 
                    TextColor3 = v17.props.textStyle.Color, 
                    TextTransparency = v17.props.textStyle.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextScaled = false, 
                    TextStrokeColor3 = v17.props.textStyle.StrokeColor, 
                    TextStrokeTransparency = v17.props.textStyle.StrokeTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1
                })
            });
        end;
        return v2.createElement("Frame", {
            LayoutOrder = v17.props.layoutOrder, 
            Size = v18.PlayerNameSize, 
            BackgroundTransparency = 1
        }, v22);
    end);
end;
local function v28(v25) --[[ Line: 183 ]] --[[ Name: PlayerNameTagContainer ]]
    -- upvalues: v10 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_useVerifiedBadge_0 (copy), v2 (copy), v16 (copy), v6 (copy)
    local v26 = v10(tostring(v25.player.UserId), v25.player.DisplayName);
    local v27 = if l_FFlagEnableVerifiedBadgeStore_0 then l_useVerifiedBadge_0(v25.player) else nil;
    return v2.createElement(v16, v6.Dictionary.join(v25, {
        name = v26, 
        hasVerifiedBadge = if l_FFlagEnableVerifiedBadgeStore_0 then v27 else nil
    }));
end;
if v12 then
    return (v2.memo(v28, v11({
        "textFont"
    })));
else
    return v28;
end;