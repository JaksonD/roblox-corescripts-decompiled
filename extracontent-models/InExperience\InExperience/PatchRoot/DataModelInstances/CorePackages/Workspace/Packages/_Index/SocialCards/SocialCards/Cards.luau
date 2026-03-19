local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local l_AltTextCard_0 = require(l_Parent_0.Components).AltTextCard.AltTextCard;
local l_CardComponent_0 = require(l_Parent_0.utils).CardsHelper.CardComponent;
local _ = require(l_Parent_0.CardsType);
local l_useTokens_0 = v3.Hooks.useTokens;
local v9 = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 1, 
    position = UDim2.fromScale(0, 0)
};
return function(v10) --[[ Line: 30 ]] --[[ Name: Cards ]]
    -- upvalues: v2 (copy), v9 (copy), l_useTokens_0 (copy), v4 (copy), l_CardComponent_0 (copy), l_AltTextCard_0 (copy), v3 (copy)
    local v11 = v2.Dictionary.union(v9, v10);
    local v12 = l_useTokens_0();
    local v18 = v4.useCallback(function(v13) --[[ Line: 34 ]]
        -- upvalues: l_CardComponent_0 (ref), v11 (copy), v2 (ref), v4 (ref), l_AltTextCard_0 (ref), v3 (ref), v12 (copy)
        local v14 = {};
        for _, v16 in ipairs(v13.components) do
            if l_CardComponent_0[v16.type] then
                local l_data_0 = v16.data;
                if v11.analyticsInfo then
                    l_data_0 = v2.Dictionary.join(l_data_0, v11.analyticsInfo);
                end;
                table.insert(v14, v4.createElement(l_CardComponent_0[v16.type], l_data_0));
            else
                v14 = {
                    v4.createElement(l_AltTextCard_0, {
                        altText = v13.alt_text
                    })
                };
                break;
            end;
        end;
        return v4.createElement(v3.View, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v12.Color.Shift.Shift_200, 
            cornerRadius = UDim.new(0, v12.Radius.Large)
        }, v14);
    end, {});
    local v19 = {};
    for _, v21 in pairs(v11.cards) do
        table.insert(v19, v18(v21));
    end;
    return v4.createElement(v3.View, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = v11.anchorPoint, 
        Position = v11.position, 
        LayoutOrder = v11.layoutOrder
    }, v19);
end;