local l_Parent_0 = script:FindFirstAncestor("Chrome").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v3 = v1.createContext({});
local function v5() --[[ Line: 10 ]] --[[ Name: UnibarStyleConstants ]]
    -- upvalues: l_useTokens_0 (copy)
    local v4 = l_useTokens_0();
    return {
        ICON_CELL_WIDTH = v4.Size.Size_1100, 
        ICON_SIZE = v4.Size.Size_900, 
        UNIBAR_ICON_SIZE = v4.Size.Size_800, 
        ICON_HIGHLIGHT_SIZE = UDim2.new(0, v4.Size.Size_900, 0, v4.Size.Size_900), 
        ICON_DIVIDER_POSITION = UDim2.new(0, v4.Size.Size_50, 0.5, 0), 
        ICON_BADGE_OFFSET_X = v4.Gap.XXLarge, 
        ICON_BADGE_OFFSET_Y = v4.Gap.Small, 
        MEDIUM_ICON_SIZE = v4.Size.Size_700, 
        UNIBAR_END_PADDING = v4.Padding.XSmall, 
        MENU_SUBMENU_PADDING = v4.Padding.Small, 
        UNIBAR_LEFT_MARGIN = v4.Padding.Small, 
        SUB_MENU_ROW_HEIGHT = v4.Size.Size_1400, 
        SUBMENU_CORNER_RADIUS = v4.Radius.Medium, 
        SUBMENU_PADDING_LEFT = v4.Padding.Small, 
        SUBMENU_PADDING_RIGHT = v4.Padding.Small, 
        SUBMENU_ROW_LABEL_FONT = v4.Typography.TitleLarge, 
        SUBMENU_ROW_PADDING = v4.Padding.Small, 
        SUBMENU_ROW_CORNER_RADIUS = v4.Radius.Medium, 
        SUBMENU_BOTTOM_PADDING = v4.Padding.XLarge, 
        CLOSE_BUTTON_FRAME = UDim2.new(0, v4.Size.Size_1100, 0, v4.Size.Size_1100), 
        WINDOW_DEFAULT_PADDING = v4.Padding.Small
    };
end;
return {
    Context = v3, 
    Provider = function(v6) --[[ Line: 38 ]] --[[ Name: UnibarStyleProvider ]]
        -- upvalues: v1 (copy), v3 (copy), v5 (copy)
        return v1.createElement(v3.Provider, {
            value = v5()
        }, v6.children);
    end, 
    use = function() --[[ Line: 44 ]] --[[ Name: use ]]
        -- upvalues: v1 (copy), v3 (copy)
        local v7 = v1.useContext(v3);
        if v7 then
            return v7;
        else
            error("attempt to use UnibarStyleContext with no provider. Add `UnibarStyleContext.Provider` to the React tree and try again");
            return;
        end;
    end
};