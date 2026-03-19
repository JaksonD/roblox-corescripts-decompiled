local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.ChatLanding.SearchTopBar);
local v6 = {
    paddingTop = 0, 
    paddingBottom = 6, 
    paddingLeft = 12, 
    paddingRight = 12, 
    layoutOrder = -1
};
return function(v7) --[[ Line: 32 ]]
    -- upvalues: v2 (copy), v6 (copy), l_useLocalization_0 (copy), v3 (copy), v5 (copy)
    local v8 = v2.Dictionary.union(v6, v7);
    local v9 = l_useLocalization_0({
        searchPlaceholderText = "Feature.Chat.Label.SearchWord", 
        cancelText = "Feature.Chat.Action.Cancel"
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v8.height - v8.paddingBottom - v8.paddingTop), 
        LayoutOrder = v8.layoutOrder, 
        BackgroundTransparency = 1
    }, {
        filterBox = v3.createElement(v5, {
            initialInputText = v8.initialText or "", 
            cancelText = v9.cancelText, 
            searchPlaceholderText = v9.searchPlaceholderText, 
            shouldShowCancel = false, 
            captureFocusOnMount = false, 
            filterBoxPaddingTop = v8.paddingTop, 
            filterBoxPaddingBottom = v8.paddingBottom, 
            filterBoxPaddingLeft = v8.paddingLeft, 
            filterBoxPaddingRight = v8.paddingRight, 
            textChangedCallback = v8.onFilter
        }), 
        heightFlexOverride = v3.createElement("UIFlexItem", {
            FlexMode = Enum.UIFlexMode.None
        })
    });
end;