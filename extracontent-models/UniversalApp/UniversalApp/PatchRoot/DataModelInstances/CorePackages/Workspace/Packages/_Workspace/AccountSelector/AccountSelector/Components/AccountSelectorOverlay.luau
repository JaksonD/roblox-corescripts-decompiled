local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = l_UIBlox_0.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useState_0 = l_React_0.useState;
local l_useEffect_0 = l_React_0.useEffect;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local v11 = require(script.Parent.AccountSelectionList);
local _ = require(script.Parent.AccountSelection);
local v13 = require(l_Parent_0.Analytics.AnalyticsEvents);
return function(v14) --[[ Line: 34 ]] --[[ Name: AccountSelectorPage ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useState_0 (copy), l_useLocalization_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), l_React_0 (copy), l_useEffect_0 (copy), v13 (copy), l_PartialPageModal_0 (copy), v11 (copy)
    local v15 = l_useStyle_0();
    local v16 = l_useDesignTokens_0();
    local v17, v18 = l_useState_0(false);
    local l_BaseSize_0 = v15.Font.BaseSize;
    local l_Size_800_0 = v16.Global.Size_800;
    local v21 = l_Size_800_0 * 7.5;
    local v22 = #v14.users < 7 and l_Size_800_0 * #v14.users or v21;
    local v23 = l_useLocalization_0({
        titleText = v14.titleTextKey, 
        helpText = v14.helpTextKey
    });
    local v24 = l_getPartialPageModalMiddleContentWidth_0(v14.screenSize.X);
    local v25 = l_React_0.useRef(false);
    l_useEffect_0(function() --[[ Line: 53 ]]
        -- upvalues: v14 (copy), v13 (ref), v25 (copy)
        local v26 = "";
        for _, v28 in v14.users do
            v26 = v26 .. tostring(v28.id) .. ",";
        end;
        v26 = v26:sub(1, -2);
        v13.sendPageLoadEvent(v14.context, v14.origin, v26);
        return function() --[[ Line: 62 ]]
            -- upvalues: v25 (ref), v14 (ref)
            if not v25.current then
                v14.onAccountSelectionAbandoned();
            end;
        end;
    end, {});
    local function v30(v29) --[[ Line: 71 ]] --[[ Name: handleAccountSelection ]]
        -- upvalues: v18 (copy), v14 (copy), v13 (ref), v25 (copy)
        v18(true);
        v14.onAccountSelection(v29);
        v13.sendSelectEvent(v14.context, v14.origin, (tostring(v29)));
        v25.current = true;
    end;
    return l_React_0.createElement(l_PartialPageModal_0, {
        screenSize = v14.screenSize, 
        title = v23.titleText, 
        onCloseClicked = v14.onAccountSelectionAbandoned
    }, {
        ViewContainer = l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ContentPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 6), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            HelpText = l_React_0.createElement("TextLabel", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Text = v23.helpText, 
                TextSize = l_BaseSize_0, 
                TextColor3 = v15.Theme.TextDefault.Color, 
                TextTransparency = v15.Theme.TextDefault.Transparency, 
                Font = v15.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Size = UDim2.new(0, v24, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }), 
            AccountSelectionContent = l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v22), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                AccountSelectionList = l_React_0.createElement(v11, {
                    users = v14.users, 
                    onAccountSelection = v30, 
                    height = v22, 
                    isDisabled = v17, 
                    isScrollable = true
                })
            })
        })
    });
end;