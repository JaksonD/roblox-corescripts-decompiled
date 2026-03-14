local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v6 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsTelemetryEvents);
local v7 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDetailsTelemetryLayer);
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v10 = require(l_script_FirstAncestor_0.Components.Cells.FlexIconWithTextCell);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v12 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v13 = {
    bodyText = "Placeholder body", 
    subTitleText = "Placeholder subtitle", 
    iconImage = nil, 
    cellHeight = 48, 
    onActivated = function() --[[ Line: 39 ]] --[[ Name: onActivated ]]

    end
};
return function(v14) --[[ Line: 44 ]] --[[ Name: CreateUnfilteredChatCell ]]
    -- upvalues: v3 (copy), v13 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v12 (copy), v5 (copy), v7 (copy), l_useEffectOnMount_0 (copy), v6 (copy), v4 (copy), v10 (copy)
    local v15 = v3.Dictionary.join(v13, v14);
    local v16 = l_useStyle_0();
    local v17 = v15.style or v16;
    local v18 = l_useTokens_0();
    local v19 = v12();
    local v20 = v5(v7.Context);
    l_useEffectOnMount_0(function() --[[ Line: 52 ]]
        -- upvalues: v20 (copy), v6 (ref)
        v20.emit(v6.ChatDetailsCreateUnfilteredChatCellRendered, {});
    end);
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v15.layoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        CreateUnfilteredChatRow = v4.createElement(v10, {
            LayoutOrder = v15.layoutOrder, 
            onActivated = v15.onActivated, 
            primaryIcon = v15.iconImage, 
            showDivider = false, 
            Size = UDim2.new(1, 0, 0, v15.cellHeight), 
            style = v17, 
            Text = v15.bodyText, 
            SubTitleText = v15.subTitleText, 
            isDisabled = v15.isLoading, 
            BackgroundTransparency = if v19 then v18.Color.None.Transparency else nil
        })
    });
end;