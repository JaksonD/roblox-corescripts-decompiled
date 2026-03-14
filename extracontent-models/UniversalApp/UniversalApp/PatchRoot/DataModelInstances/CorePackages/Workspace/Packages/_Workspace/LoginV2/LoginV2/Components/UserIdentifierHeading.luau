local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Style);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useDesignTokens_0 = v4.useDesignTokens;
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_OpenTypeSupport_0 = v3.Utility.OpenTypeSupport;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v12 = require(l_script_FirstAncestor_0.Enums.UserIdentifierType);
local v13 = require(l_script_FirstAncestor_0.Context.LoginContext);
UserIdentifierHeading = function(v14) --[[ Line: 27 ]] --[[ Name: UserIdentifierHeading ]]
    -- upvalues: v2 (copy), v13 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v12 (copy), l_LoadableImage_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_StyledTextLabel_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_state_0 = v2.useContext(v13).state;
    local v16 = l_useStyle_0();
    local v17 = l_useDesignTokens_0();
    local v18 = l_state_0.userIdentifierType == v12.Username;
    local l_createElement_0 = v2.createElement;
    local v20 = "Frame";
    local v21 = {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v14.layoutOrder
    };
    local v22 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v17.Global.Space_150)
        }), 
        VerticalLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v17.Global.Space_50)
        })
    };
    local l_v18_0 = v18;
    if l_v18_0 then
        l_v18_0 = v2.createElement;
        local l_l_LoadableImage_0_0 = l_LoadableImage_0;
        local v25 = {
            LayoutOrder = 1, 
            Size = UDim2.new(0, 72, 0, 72)
        };
        local v26 = false;
        if v14.userId ~= nil then
            v26 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v14.userId);
        end;
        v25.Image = v26;
        v25.useShimmerAnimationWhileLoading = true;
        v25.cornerRadius = UDim.new(0.5, 0);
        v25.shouldHandleReloads = true;
        l_v18_0 = l_v18_0(l_l_LoadableImage_0_0, v25);
    end;
    v22.Thumbnail = l_v18_0;
    v22.ThumbnailSpacing = v18 and v2.createElement("Frame", {
        LayoutOrder = 2, 
        Size = UDim2.new(0, 0, 0, v17.Global.Space_150), 
        BackgroundTransparency = 1
    });
    v22.UserIdentifierText = v2.createElement(l_StyledTextLabel_0, {
        text = if v18 then v14.displayName or "" else v14.userIdentifier, 
        fontStyle = v16.Font.Header1, 
        colorStyle = v16.Theme.TextEmphasis, 
        textTruncate = Enum.TextTruncate.AtEnd, 
        textXAlignment = Enum.TextXAlignment.Center, 
        automaticSize = Enum.AutomaticSize.XY, 
        layoutOrder = 3, 
        fluidSizing = true, 
        lineHeight = 1, 
        openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
    });
    v22.SecondaryUsernameText = v18 and v2.createElement(l_StyledTextLabel_0, {
        text = if v14.userIdentifier then "@" .. v14.userIdentifier else "", 
        fontStyle = v16.Font.Body, 
        colorStyle = v16.Theme.TextDefault, 
        textTruncate = Enum.TextTruncate.AtEnd, 
        textXAlignment = Enum.TextXAlignment.Center, 
        automaticSize = Enum.AutomaticSize.XY, 
        layoutOrder = 4, 
        fluidSizing = true, 
        lineHeight = 1, 
        openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
    });
    return (l_createElement_0(v20, v21, v22));
end;
return UserIdentifierHeading;