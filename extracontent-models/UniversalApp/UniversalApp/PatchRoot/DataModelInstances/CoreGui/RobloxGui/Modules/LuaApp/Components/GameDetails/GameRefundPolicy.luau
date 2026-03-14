local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Modules_0.LuaApp.Thunks.OpenRefundPolicyLearnMorePage);
local l_checkAndFormatPossibleLink_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).checkAndFormatPossibleLink;
return function(v7) --[[ Line: 21 ]] --[[ Name: GameRefundPolicy ]]
    -- upvalues: l_useDispatch_0 (copy), l_useTokens_0 (copy), l_checkAndFormatPossibleLink_0 (copy), v2 (copy), v5 (copy)
    local v8 = l_useDispatch_0();
    local v9 = l_useTokens_0();
    local l_BodyLarge_0 = v9.Typography.BodyLarge;
    local l_Muted_0 = v9.Color.Content.Muted;
    local l_Color3_0 = v9.Color.Content.Link.Color3;
    local v13 = ("<font color=\"%*\"><b>"):format((string.format("rgb(%d, %d, %d)", math.round(l_Color3_0.R * 255), math.round(l_Color3_0.G * 255), (math.round(l_Color3_0.B * 255)))));
    local v14, v15 = l_checkAndFormatPossibleLink_0(v7.refundPolicy.policyText, nil, nil, v13, "</b></font>");
    local v17 = v2.useCallback(function(_) --[[ Line: 40 ]]
        -- upvalues: v8 (copy), v5 (ref), v7 (copy)
        v8(v5(v7.refundPolicy.learnMoreUrl));
    end, {
        v7.refundPolicy.learnMoreUrl
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v7.layoutOrder
    }, {
        UIPadding = if v7.paddingTop then v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v7.paddingTop)
        }) else nil, 
        RefundPolicy = v2.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Text = v15, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_BodyLarge_0.Font, 
            TextSize = l_BodyLarge_0.FontSize, 
            TextColor3 = l_Muted_0.Color3, 
            TextTransparency = l_Muted_0.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            RichText = v14, 
            [v2.Event.Activated] = v17
        })
    });
end;