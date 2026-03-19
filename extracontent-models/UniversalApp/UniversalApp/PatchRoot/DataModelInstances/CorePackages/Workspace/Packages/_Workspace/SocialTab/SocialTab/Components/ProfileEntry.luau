local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_VerifiedBadges_0 = v1.VerifiedBadges;
local v7 = require(l_script_FirstAncestor_0.Components.StyledTextLabel);
local v8 = require(l_script_FirstAncestor_0.Components.StyledImageSetLabel);
local v9 = require(l_script_FirstAncestor_0.EnumScreens);
local v10 = l_t_0.interface({
    userText = l_t_0.string, 
    avatarImage = l_t_0.optional(l_t_0.string), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    isPremium = l_t_0.optional(l_t_0.boolean), 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    hasVerifiedBadge = l_t_0.optional(l_t_0.boolean)
});
local v11 = {
    userText = "", 
    avatarImage = "", 
    onActivated = function() --[[ Line: 27 ]] --[[ Name: onActivated ]]

    end, 
    isPremium = false, 
    hasVerifiedBadge = false
};
return function(v12) --[[ Line: 36 ]]
    -- upvalues: l_llama_0 (copy), v11 (copy), v10 (copy), l_VerifiedBadges_0 (copy), l_UIBlox_0 (copy), l_Roact_0 (copy), v8 (copy), v9 (copy), v7 (copy)
    v12 = l_llama_0.Dictionary.join(v11, v12);
    assert(v10(v12));
    local v13 = nil;
    v13 = if v12.hasVerifiedBadge then l_VerifiedBadges_0.emoji.verified else if v12.isPremium then l_VerifiedBadges_0.emoji.premium else "";
    return l_UIBlox_0.Style.withStyle(function(v14) --[[ Line: 52 ]]
        -- upvalues: l_Roact_0 (ref), v12 (ref), v8 (ref), l_VerifiedBadges_0 (ref), v13 (ref), v9 (ref), v7 (ref)
        local l_Theme_0 = v14.Theme;
        local l_Font_0 = v14.Font;
        return l_Roact_0.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.new(0, 0, 0, 36), 
            [l_Roact_0.Event.Activated] = v12.onActivated, 
            LayoutOrder = v12.layoutOrder
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            avatarImage = l_Roact_0.createElement(v8, {
                Image = v12.avatarImage, 
                BackgroundStyle = v14.Theme.PlaceHolder, 
                Size = UDim2.fromOffset(36, 36), 
                LayoutOrder = 1
            }, {
                corner = l_Roact_0.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            }), 
            spacer = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(4, 0), 
                LayoutOrder = 2
            }), 
            userTextWrapper = l_Roact_0.createElement(l_VerifiedBadges_0.EmojiWrapper, {
                size = UDim2.fromScale(0, 0), 
                emoji = if v12.hasVerifiedBadge then l_VerifiedBadges_0.emoji.verified else if v12.isPremium then l_VerifiedBadges_0.emoji.premium else "", 
                color = if v12.isPremium then l_Theme_0.TextEmphasis.Color else nil, 
                layoutOrder = 3, 
                onActivated = v13 == l_VerifiedBadges_0.emoji.verified and function() --[[ Line: 91 ]]
                    -- upvalues: v12 (ref), v9 (ref)
                    v12.navigateToLuaAppPages[v9.VerifiedBadgeModal]();
                end or nil
            }, {
                userText = l_Roact_0.createElement(v7, {
                    TextStyle = l_Theme_0.TextEmphasis, 
                    FontStyle = l_Font_0.Header1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = v12.userText, 
                    AutomaticSize = Enum.AutomaticSize.XY
                })
            })
        });
    end);
end;