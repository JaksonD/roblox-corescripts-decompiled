local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_Parent_0.Responsive);
local v8 = require(l_Parent_0.SharedFlags);
local l_useFocusGuiObject_0 = require(l_Parent_0.ReactFocusNavigation).useFocusGuiObject;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v12 = require(l_script_FirstAncestor_0.Constants);
local v13 = require(script.Parent.FriendsMenuUserCard);
local v14 = require(l_Context_0.SelectedUsersContext);
local v15 = require(l_script_FirstAncestor_0.utils.getRenameFriendsToConnectionsEnabledFriendsMenu);
local l_FFlagEnableAppChatFocusableFixes_0 = v8.FFlagEnableAppChatFocusableFixes;
return function(v17) --[[ Line: 32 ]]
    -- upvalues: v4 (copy), v14 (copy), v7 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v15 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v13 (copy), l_dependencyArray_0 (copy), v12 (copy)
    local v18 = v4.useContext(v14);
    local v19 = v7.useBreakpointYOrLarger(v7.Keys.Medium);
    local v20 = l_useLastInputMode_0();
    local v21 = l_useFocusGuiObject_0();
    local v22 = v4.useRef({});
    local v23 = v4.useRef(nil);
    local v24 = l_useStyle_0();
    local l_Theme_0 = v24.Theme;
    local l_Font_0 = v24.Font;
    local v27 = l_useLocalization_0({
        selectedFriendsCountText = {
            v15() and "Feature.FriendsMenu.Label.SelectedConnectionsCount" or "Feature.FriendsMenu.Label.SelectedFriendsCount"; 
            numerator = v18.selectedFriendsSize, 
            denominator = v17.selectionLimit
        }, 
        selectedFriendsCountNoLimitText = {
            v15() and "Feature.FriendsMenu.Label.SelectedConnectionsCountNoLimit" or "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit"; 
            selectedCount = v18.selectedFriendsSize
        }
    });
    local v39 = v4.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v22 (copy), v4 (ref), v18 (copy), v13 (ref), v23 (copy)
        if not l_FFlagEnableAppChatFocusableFixes_0 then
            return {};
        else
            v22.current = {};
            local v28 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            local v29 = {};
            for v30, v31 in pairs(v18.selectedFriends) do
                table.insert(v29, {
                    userId = v30, 
                    userData = v31
                });
            end;
            table.sort(v29, function(v32, v33) --[[ Line: 80 ]]
                return v32.userData.layoutOrder < v33.userData.layoutOrder;
            end);
            for v34, v35 in ipairs(v29) do
                local l_userId_0 = v35.userId;
                local l_userData_0 = v35.userData;
                v28["User-" .. tostring(l_userId_0)] = v4.createElement(v13, {
                    displayName = l_userData_0.displayName, 
                    layoutOrder = l_userData_0.layoutOrder, 
                    userId = l_userId_0, 
                    unremovable = l_userData_0.unremovable, 
                    onRemoved = function() --[[ Line: 93 ]] --[[ Name: onRemoved ]]
                        -- upvalues: v23 (ref), v34 (copy)
                        v23.current = v34;
                    end, 
                    ref = function(v38) --[[ Line: 96 ]] --[[ Name: ref ]]
                        -- upvalues: v22 (ref), v34 (copy)
                        v22.current[v34] = v38;
                    end
                });
            end;
            return v28;
        end;
    end, l_dependencyArray_0(v18.selectedFriends));
    local v43 = v4.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v4 (ref), v18 (copy), v13 (ref)
        if l_FFlagEnableAppChatFocusableFixes_0 then
            return {};
        else
            local v40 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            for v41, v42 in pairs(v18.selectedFriends) do
                v40["User-" .. tostring(v41)] = v4.createElement(v13, {
                    displayName = v42.displayName, 
                    layoutOrder = v42.layoutOrder, 
                    userId = v41, 
                    unremovable = v42.unremovable
                });
            end;
            return v40;
        end;
    end, l_dependencyArray_0(v18.selectedFriends));
    v4.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v23 (copy), v20 (copy), v22 (copy), v21 (copy)
        if not l_FFlagEnableAppChatFocusableFixes_0 or not v23.current or v20 ~= "Focus" then
            return;
        else
            local l_current_0 = v22.current;
            local v45 = #l_current_0;
            if v45 == 0 then
                v23.current = nil;
                return;
            else
                local v46 = l_current_0[math.clamp(v23.current, 1, v45)];
                if v46 and v46.Parent then
                    v21(v46);
                end;
                v23.current = nil;
                return;
            end;
        end;
    end, l_dependencyArray_0(v18.selectedFriends, v21, v20));
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v17.layoutOrder
    }, {
        VerticalLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        SelectedFriendsText = v4.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Header2.Font, 
            LayoutOrder = 0, 
            Text = if v17.selectionLimit then v27.selectedFriendsCountText else v27.selectedFriendsCountNoLimitText, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        SelectedUsers = if v18.selectedFriendsSize ~= 0 and v19 then v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 0, v12.FRIEND_MENU_CARD_SIZE), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
        }, if l_FFlagEnableAppChatFocusableFixes_0 then v39 else v43) else nil
    });
end;