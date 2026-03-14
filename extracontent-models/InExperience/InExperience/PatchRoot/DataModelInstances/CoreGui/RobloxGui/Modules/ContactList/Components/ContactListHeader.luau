local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local v4 = require(l_ContactList_0.dependencies);
local v5 = require(l_ContactList_0.Enums.Pages);
local v6 = require(l_ContactList_0.Actions.SetCurrentPage);
local v7 = require(l_ContactList_0.Analytics.useAnalytics);
local v8 = require(l_ContactList_0.Analytics.EventNamesEnum);
local l_useDispatch_0 = v4.Hooks.useDispatch;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_UIBlox_0 = v4.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local function _(v15) --[[ Line: 33 ]]
    -- upvalues: v5 (copy)
    if v15 == v5.FriendList then
        return "Feature.Call.Label.StartNewCall";
    elseif v15 == v5.CallHistory then
        return "Feature.Call.Label.RecentCalls";
    else
        return "";
    end;
end;
return function(v17) --[[ Line: 42 ]]
    -- upvalues: v7 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v5 (copy), v2 (copy), v8 (copy), v6 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy)
    local v18 = v7();
    local v19 = l_useStyle_0();
    local v20 = l_useDispatch_0();
    local l_Theme_0 = v19.Theme;
    local l_Font_0 = v19.Font;
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v24 = {};
    local l_currentPage_0 = v17.currentPage;
    v24.titleLabel = l_currentPage_0 == v5.FriendList and "Feature.Call.Label.StartNewCall" or l_currentPage_0 == v5.CallHistory and "Feature.Call.Label.RecentCalls" or "";
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v24);
    v24 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v18 (copy), v8 (ref), v17 (copy), v5 (ref), v20 (copy), v6 (ref)
        v18.fireEvent(v8.PhoneBookNavigate, {
            eventTimestampMs = os.time() * 1000, 
            startingPage = v17.currentPage, 
            destinationPage = v5.CallHistory
        });
        v20(v6(v5.CallHistory));
    end, {
        v17.currentPage
    });
    local v26 = v2.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: v18 (copy), v8 (ref), v17 (copy), v5 (ref), v20 (copy), v6 (ref)
        v18.fireEvent(v8.PhoneBookNavigate, {
            eventTimestampMs = os.time() * 1000, 
            startingPage = v17.currentPage, 
            destinationPage = v5.FriendList
        });
        v20(v6(v5.FriendList));
    end, {
        v17.currentPage
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v17.headerHeight), 
        LayoutOrder = v17.layoutOrder, 
        BackgroundTransparency = 1
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        HeaderUIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        DismissButton = v2.createElement(l_ImageSetButton_0, {
            Size = UDim2.fromOffset(32, 32), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            Image = if v17.currentPage == v5.CallHistory then l_Images_0["icons/navigation/close"] else l_Images_0["icons/navigation/pushBack"], 
            LayoutOrder = 1, 
            [v2.Event.Activated] = if v17.currentPage == v5.CallHistory then v17.dismissCallback else v24
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        }), 
        DividerContainer = v2.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            Divider = v2.createElement("Frame", {
                Size = UDim2.new(0, 1, 0, 16), 
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                BorderSizePixel = 0
            }), 
            DividerContainerUIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 12)
            })
        }), 
        HeaderText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -85, 0, 24), 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Header1.Font, 
            Text = l_l_useLocalization_0_0.titleLabel, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextSize = l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            LayoutOrder = 3, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        NewCallButton = if v17.currentPage == v5.CallHistory then v2.createElement(l_ImageSetButton_0, {
            Size = UDim2.fromOffset(32, 32), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            Image = "rbxassetid://15239778003", 
            LayoutOrder = 4, 
            [v2.Event.Activated] = v26
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        }) else nil
    });
end;