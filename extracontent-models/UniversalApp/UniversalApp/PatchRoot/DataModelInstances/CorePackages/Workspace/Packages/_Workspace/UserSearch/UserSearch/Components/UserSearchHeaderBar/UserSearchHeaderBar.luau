local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_Images_0 = v2.App.ImageSet.Images;
local v6 = require(l_Parent_0.AppHeaderBar);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(script.Parent.UserSearchHeaderInput);
local l_FFlagUserSearchGoBackOnCancel_0 = require(l_Parent_0.SharedFlags).FFlagUserSearchGoBackOnCancel;
return function(v10) --[[ Line: 28 ]] --[[ Name: UserSearchHeaderBar ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_FFlagUserSearchGoBackOnCancel_0 (copy), v6 (copy), v8 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_HeaderBar_0 (copy)
    local l_searchKeyword_0 = v10.searchKeyword;
    local l_onSubmitSearch_0 = v10.onSubmitSearch;
    local l_onBackClick_0 = v10.onBackClick;
    local l_focusOnSearchInput_0 = v10.focusOnSearchInput;
    local l_headerHeight_0 = v10.headerHeight;
    local v16 = l_useLocalization_0({
        titleText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople", 
        placeholderText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople", 
        cancelText = "Feature.Chat.Action.Cancel"
    });
    local v17, v18 = v1.useState(true);
    local v19, v20 = v1.useState(l_focusOnSearchInput_0);
    local v21, v22 = v1.useState(l_searchKeyword_0);
    local v23 = v1.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v18 (copy), v20 (copy)
        v18(true);
        v20(true);
    end, {});
    local v24 = v1.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: l_FFlagUserSearchGoBackOnCancel_0 (ref), v22 (copy), l_onBackClick_0 (copy), v18 (copy)
        if l_FFlagUserSearchGoBackOnCancel_0 then
            v22("");
            l_onBackClick_0();
            return;
        else
            v18(false);
            v22("");
            return;
        end;
    end, {
        if l_FFlagUserSearchGoBackOnCancel_0 then l_onBackClick_0 else nil
    });
    local v25 = v1.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v17 (copy), v6 (ref), l_onBackClick_0 (copy)
        if v17 then
            return function() --[[ Line: 62 ]]

            end;
        else
            return v6.makeBackButton(function() --[[ Line: 64 ]]
                -- upvalues: l_onBackClick_0 (ref)
                l_onBackClick_0();
            end);
        end;
    end, {
        v17, 
        l_onBackClick_0
    });
    local v26 = v1.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v17 (copy), v1 (ref), v8 (ref), v21 (copy), v16 (copy), v19 (copy), l_onSubmitSearch_0 (copy), v24 (copy)
        if not v17 then
            return nil;
        else
            return v1.createElement(v8, {
                initialInputText = v21, 
                searchPlaceholderText = v16.placeholderText, 
                cancelText = v16.cancelText, 
                captureFocusOnMount = v19, 
                onSubmit = l_onSubmitSearch_0, 
                onCancel = v24
            });
        end;
    end, {
        v17, 
        l_searchKeyword_0, 
        v19, 
        l_onSubmitSearch_0, 
        v24, 
        v16.placeholderText, 
        v16.cancelText
    });
    local v27 = v1.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: v17 (copy), v1 (ref), l_IconButton_0 (ref), l_Images_0 (ref), v23 (copy)
        if v17 then
            return nil;
        else
            return v1.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(0, 0), 
                icon = l_Images_0["icons/common/search"], 
                onActivated = v23
            });
        end;
    end, {
        v17, 
        v23
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, l_headerHeight_0)
    }, {
        headerBar = v1.createElement(l_HeaderBar_0, {
            title = v16.titleText, 
            renderLeft = v25, 
            renderCenter = v26, 
            renderRight = v27, 
            shouldHideSecondaryLeftItem = v17, 
            barHeight = l_headerHeight_0, 
            isSecondary = true, 
            paddingTop = UDim.new(0, 0), 
            paddingBottom = UDim.new(0, 0)
        })
    });
end;