local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Skeleton_0 = v1.Foundation.Skeleton;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_Mock_0 = v1.Mock;
local l_t_0 = v1.t;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v10 = require(l_script_FirstAncestor_0.Components.StyledImageSetLabel);
local v11 = require(l_script_FirstAncestor_0.User);
local v12 = require(l_script_FirstAncestor_0.Components.StyledTextLabel);
local v13 = require(l_script_FirstAncestor_0.Flags.getSocialTabUserProfileApiEnabled);
local v14 = require(l_script_FirstAncestor_0.utils.calculateTextSize);
local v15 = require(l_script_FirstAncestor_0.Flags.isSocialTabAutoSizedCarouselAndTileEnabled2);
local function _(v16) --[[ Line: 34 ]] --[[ Name: getLastLocationText ]]
    return v16 and v16:gsub("^Playing%s*", "") or "";
end;
local v18 = l_Roact_0.PureComponent:extend("UserTile");
v18.defaultProps = {
    enableDisplayNamePolicy = false, 
    height = 120, 
    layoutOrder = 0, 
    onActivated = function() --[[ Line: 43 ]] --[[ Name: onActivated ]]

    end, 
    thumbnailSize = 96, 
    absolutePosition = 1
};
v18.validateProps = l_t_0.interface({
    enableDisplayNamePolicy = l_t_0.optional(l_t_0.boolean), 
    height = l_t_0.optional(l_t_0.number), 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.union(l_t_0.callback, l_Mock_0.MagicMock.is)), 
    thumbnailSize = l_t_0.optional(l_t_0.number), 
    user = v11.validateUser, 
    absolutePosition = l_t_0.optional(l_t_0.number), 
    shouldShimmerName = l_t_0.optional(l_t_0.boolean), 
    combinedName = l_t_0.optional(l_t_0.string)
});
v18.init = function(v19) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), v14 (copy)
    v19.userTileRef = l_Roact_0.createRef();
    v19.onActivated = function() --[[ Line: 63 ]]
        -- upvalues: v19 (copy)
        local l_user_0 = v19.props.user;
        if l_user_0 and v19.userTileRef.current then
            v19.props.onActivated({
                user = l_user_0, 
                positionIndex = v19.props.layoutOrder, 
                absolutePosition = v19.props.absolutePosition, 
                anchorSpaceSize = v19.userTileRef.current.AbsoluteSize, 
                anchorSpacePosition = v19.userTileRef.current.AbsolutePosition, 
                source = "SocialTab"
            });
        end;
    end;
    v19.calculateTextBounds = v14();
end;
v18.render = function(v21) --[[ Line: 82 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_PresenceType_0 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), v15 (copy), v10 (copy), l_Images_0 (copy), v12 (copy), l_Skeleton_0 (copy)
    local l_user_1 = v21.props.user;
    local v23 = not v13() and v21.props.enableDisplayNamePolicy and l_user_1.displayName or l_user_1.username;
    if v13() and v21.props.combinedName then
        v23 = v21.props.combinedName;
    end;
    local v24 = l_user_1.userPresenceType ~= l_PresenceType_0.Offline;
    local l_lastLocation_0 = l_user_1.lastLocation;
    local v26 = l_lastLocation_0 and l_lastLocation_0:gsub("^Playing%s*", "") or "";
    l_lastLocation_0 = (not (l_user_1.userPresenceType ~= l_PresenceType_0.InGame) or l_user_1.userPresenceType == l_PresenceType_0.InStudio) and v26;
    return l_withStyle_0(function(v27) --[[ Line: 97 ]]
        -- upvalues: v21 (copy), v26 (copy), v23 (ref), l_Roact_0 (ref), v15 (ref), v10 (ref), v24 (copy), l_Images_0 (ref), v12 (ref), l_Skeleton_0 (ref), l_lastLocation_0 (copy)
        local l_CaptionHeader_0 = v27.Font.CaptionHeader;
        local v29 = l_CaptionHeader_0.RelativeSize * v27.Font.BaseSize;
        local l_CaptionSubHeader_0 = v27.Font.CaptionSubHeader;
        local v31 = v21.calculateTextBounds(v26 .. "...", l_CaptionSubHeader_0, v27.Font.BaseSize);
        local v32 = v21.calculateTextBounds(v23, l_CaptionHeader_0, v27.Font.BaseSize);
        local v33 = math.min(v21.props.thumbnailSize - 12 - 4, v32.X);
        return l_Roact_0.createElement("TextButton", {
            AutomaticSize = v15() and Enum.AutomaticSize.Y or Enum.AutomaticSize.None, 
            Size = UDim2.new(0, v21.props.thumbnailSize, 0, v21.props.height + v31.Y), 
            BackgroundTransparency = 1, 
            Text = "", 
            LayoutOrder = v21.props.layoutOrder, 
            [l_Roact_0.Ref] = v21.userTileRef, 
            [l_Roact_0.Event.Activated] = v21.onActivated
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            Thumbnail = l_Roact_0.createElement(v10, {
                BackgroundStyle = v27.Theme.PlaceHolder, 
                Image = v21.props.user.thumbnail, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, v21.props.thumbnailSize, 0, v21.props.thumbnailSize)
            }, {
                UICorner = l_Roact_0.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            }), 
            UserInfo = l_Roact_0.createElement("Frame", {
                AutomaticSize = v15() and Enum.AutomaticSize.Y or Enum.AutomaticSize.None, 
                Size = UDim2.new(1, 0, 0, v21.props.height - v21.props.thumbnailSize), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                UsernameFrame = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v29), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    PresenceIcon = v24 and l_Roact_0.createElement(v10, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = l_Images_0["component_assets/circle_25"], 
                        ImageStyle = v27.Theme.OnlineStatus, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        ScaleType = Enum.ScaleType.Slice, 
                        Size = UDim2.new(0, 12, 0, 12), 
                        SliceCenter = Rect.new(12, 12, 13, 13)
                    }) or nil, 
                    Username = if not v21.props.shouldShimmerName then l_Roact_0.createElement(v12, {
                        FontStyle = l_CaptionHeader_0, 
                        LayoutOrder = 2, 
                        Size = UDim2.new(0, v33, 0, v32.Y), 
                        TextStyle = v27.Theme.TextEmphasis, 
                        Text = v23, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }) else nil, 
                    ShimmerName = if v21.props.shouldShimmerName then l_Roact_0.createElement(l_Skeleton_0, {
                        Size = UDim2.fromScale(0.8, 0.8), 
                        LayoutOrder = 2
                    }) else nil
                }), 
                InGameOrStudioTitle = l_Roact_0.createElement(v12, {
                    FontStyle = l_CaptionSubHeader_0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v31.Y), 
                    TextStyle = v27.Theme.TextMuted, 
                    Text = l_lastLocation_0 and v26 or "", 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Center
                })
            })
        });
    end);
end;
return v18;