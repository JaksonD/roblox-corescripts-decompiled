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
local l_FFlagConnectionsToFriendsRename_0 = v8.FFlagConnectionsToFriendsRename;
local l_FFlagEnableAppChatFocusableFixes_0 = v8.FFlagEnableAppChatFocusableFixes;
return function(v18) --[[ Line: 33 ]]
    -- upvalues: v4 (copy), v14 (copy), v7 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v15 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v13 (copy), l_dependencyArray_0 (copy), v12 (copy)
    local v19 = v4.useContext(v14);
    local v20 = v7.useBreakpointYOrLarger(v7.Keys.Medium);
    local v21 = l_useLastInputMode_0();
    local v22 = l_useFocusGuiObject_0();
    local v23 = v4.useRef({});
    local v24 = v4.useRef(nil);
    local v25 = l_useStyle_0();
    local l_Theme_0 = v25.Theme;
    local l_Font_0 = v25.Font;
    local v28 = l_useLocalization_0({
        selectedFriendsCountText = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.FriendsMenu.Label.SelectedFriendsCount" or v15() and "Feature.FriendsMenu.Label.SelectedConnectionsCount" or "Feature.FriendsMenu.Label.SelectedFriendsCount"; 
            numerator = v19.selectedFriendsSize, 
            denominator = v18.selectionLimit
        }, 
        selectedFriendsCountNoLimitText = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit" or v15() and "Feature.FriendsMenu.Label.SelectedConnectionsCountNoLimit" or "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit"; 
            selectedCount = v19.selectedFriendsSize
        }
    });
    local v40 = v4.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v23 (copy), v4 (ref), v19 (copy), v13 (ref), v24 (copy)
        if not l_FFlagEnableAppChatFocusableFixes_0 then
            return {};
        else
            v23.current = {};
            local v29 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            local v30 = {};
            for v31, v32 in pairs(v19.selectedFriends) do
                table.insert(v30, {
                    userId = v31, 
                    userData = v32
                });
            end;
            table.sort(v30, function(v33, v34) --[[ Line: 87 ]]
                return v33.userData.layoutOrder < v34.userData.layoutOrder;
            end);
            for v35, v36 in ipairs(v30) do
                local l_userId_0 = v36.userId;
                local l_userData_0 = v36.userData;
                v29["User-" .. tostring(l_userId_0)] = v4.createElement(v13, {
                    displayName = l_userData_0.displayName, 
                    layoutOrder = l_userData_0.layoutOrder, 
                    userId = l_userId_0, 
                    unremovable = l_userData_0.unremovable, 
                    onRemoved = function() --[[ Line: 100 ]] --[[ Name: onRemoved ]]
                        -- upvalues: v24 (ref), v35 (copy)
                        v24.current = v35;
                    end, 
                    ref = function(v39) --[[ Line: 103 ]] --[[ Name: ref ]]
                        -- upvalues: v23 (ref), v35 (copy)
                        v23.current[v35] = v39;
                    end
                });
            end;
            return v29;
        end;
    end, l_dependencyArray_0(v19.selectedFriends));
    local v44 = v4.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v4 (ref), v19 (copy), v13 (ref)
        if l_FFlagEnableAppChatFocusableFixes_0 then
            return {};
        else
            local v41 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            for v42, v43 in pairs(v19.selectedFriends) do
                v41["User-" .. tostring(v42)] = v4.createElement(v13, {
                    displayName = v43.displayName, 
                    layoutOrder = v43.layoutOrder, 
                    userId = v42, 
                    unremovable = v43.unremovable
                });
            end;
            return v41;
        end;
    end, l_dependencyArray_0(v19.selectedFriends));
    v4.useEffect(function() --[[ Line: 135 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v24 (copy), v21 (copy), v23 (copy), v22 (copy)
        if not l_FFlagEnableAppChatFocusableFixes_0 or not v24.current or v21 ~= "Focus" then
            return;
        else
            local l_current_0 = v23.current;
            local v46 = #l_current_0;
            if v46 == 0 then
                v24.current = nil;
                return;
            else
                local v47 = l_current_0[math.clamp(v24.current, 1, v46)];
                if v47 and v47.Parent then
                    v22(v47);
                end;
                v24.current = nil;
                return;
            end;
        end;
    end, l_dependencyArray_0(v19.selectedFriends, v22, v21));
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v18.layoutOrder
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
            Text = if v18.selectionLimit then v28.selectedFriendsCountText else v28.selectedFriendsCountNoLimitText, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        SelectedUsers = if v19.selectedFriendsSize ~= 0 and v20 then v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 0, v12.FRIEND_MENU_CARD_SIZE), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
        }, if l_FFlagEnableAppChatFocusableFixes_0 then v40 else v44) else nil
    });
end;