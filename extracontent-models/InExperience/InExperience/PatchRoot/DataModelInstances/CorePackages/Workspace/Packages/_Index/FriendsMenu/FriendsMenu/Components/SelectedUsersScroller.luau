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
local l_FFlagRemoveDependencyArrayAntipattern_0 = v8.FFlagRemoveDependencyArrayAntipattern;
return function(v19) --[[ Line: 35 ]]
    -- upvalues: v4 (copy), v14 (copy), v7 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v15 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v13 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v12 (copy)
    local v20 = v4.useContext(v14);
    local v21 = v7.useBreakpointYOrLarger(v7.Keys.Medium);
    local v22 = l_useLastInputMode_0();
    local v23 = l_useFocusGuiObject_0();
    local v24 = v4.useRef({});
    local v25 = v4.useRef(nil);
    local v26 = l_useStyle_0();
    local l_Theme_0 = v26.Theme;
    local l_Font_0 = v26.Font;
    local v29 = l_useLocalization_0({
        selectedFriendsCountText = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.FriendsMenu.Label.SelectedFriendsCount" or v15() and "Feature.FriendsMenu.Label.SelectedConnectionsCount" or "Feature.FriendsMenu.Label.SelectedFriendsCount"; 
            numerator = v20.selectedFriendsSize, 
            denominator = v19.selectionLimit
        }, 
        selectedFriendsCountNoLimitText = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit" or v15() and "Feature.FriendsMenu.Label.SelectedConnectionsCountNoLimit" or "Feature.FriendsMenu.Label.SelectedFriendsCountNoLimit"; 
            selectedCount = v20.selectedFriendsSize
        }
    });
    local v41 = v4.useMemo(function() --[[ Line: 72 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v24 (copy), v4 (ref), v20 (copy), v13 (ref), v25 (copy)
        if not l_FFlagEnableAppChatFocusableFixes_0 then
            return {};
        else
            v24.current = {};
            local v30 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            local v31 = {};
            for v32, v33 in pairs(v20.selectedFriends) do
                table.insert(v31, {
                    userId = v32, 
                    userData = v33
                });
            end;
            table.sort(v31, function(v34, v35) --[[ Line: 90 ]]
                return v34.userData.layoutOrder < v35.userData.layoutOrder;
            end);
            for v36, v37 in ipairs(v31) do
                local l_userId_0 = v37.userId;
                local l_userData_0 = v37.userData;
                v30["User-" .. tostring(l_userId_0)] = v4.createElement(v13, {
                    displayName = l_userData_0.displayName, 
                    layoutOrder = l_userData_0.layoutOrder, 
                    userId = l_userId_0, 
                    unremovable = l_userData_0.unremovable, 
                    onRemoved = function() --[[ Line: 103 ]] --[[ Name: onRemoved ]]
                        -- upvalues: v25 (ref), v36 (copy)
                        v25.current = v36;
                    end, 
                    ref = function(v40) --[[ Line: 106 ]] --[[ Name: ref ]]
                        -- upvalues: v24 (ref), v36 (copy)
                        v24.current[v36] = v40;
                    end
                });
            end;
            return v30;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20.selectedFriends
    } else l_dependencyArray_0(v20.selectedFriends));
    local v45 = v4.useMemo(function() --[[ Line: 119 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v4 (ref), v20 (copy), v13 (ref)
        if l_FFlagEnableAppChatFocusableFixes_0 then
            return {};
        else
            local v42 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            for v43, v44 in pairs(v20.selectedFriends) do
                v42["User-" .. tostring(v43)] = v4.createElement(v13, {
                    displayName = v44.displayName, 
                    layoutOrder = v44.layoutOrder, 
                    userId = v43, 
                    unremovable = v44.unremovable
                });
            end;
            return v42;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20.selectedFriends
    } else l_dependencyArray_0(v20.selectedFriends));
    v4.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v25 (copy), v22 (copy), v24 (copy), v23 (copy)
        if not l_FFlagEnableAppChatFocusableFixes_0 or not v25.current or v22 ~= "Focus" then
            return;
        else
            local l_current_0 = v24.current;
            local v47 = #l_current_0;
            if v47 == 0 then
                v25.current = nil;
                return;
            else
                local v48 = l_current_0[math.clamp(v25.current, 1, v47)];
                if v48 and v48.Parent then
                    v23(v48);
                end;
                v25.current = nil;
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20.selectedFriends, 
        v23, 
        v22
    } else l_dependencyArray_0(v20.selectedFriends, v23, v22));
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v19.layoutOrder
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
            Text = if v19.selectionLimit then v29.selectedFriendsCountText else v29.selectedFriendsCountNoLimitText, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        SelectedUsers = if v20.selectedFriendsSize ~= 0 and v21 then v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 0, v12.FRIEND_MENU_CARD_SIZE), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
        }, if l_FFlagEnableAppChatFocusableFixes_0 then v41 else v45) else nil
    });
end;