local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.React);
local l_Chip_0 = require(l_Parent_0.Foundation).Chip;
local v6 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v7 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v8 = {
    v6.All, 
    v6.Online, 
    v6.Trusted
};
local v9 = {
    [v6.All] = "all", 
    [v6.Online] = "online", 
    [v6.Trusted] = "trusted"
};
local v10 = {
    "allFriendsChip", 
    "onlineFriendsChip", 
    "trustedFriendsChip"
};
ChipFilterGroup = function(v11) --[[ Line: 34 ]] --[[ Name: ChipFilterGroup ]]
    -- upvalues: v4 (copy), v7 (copy), l_useLocalization_0 (copy), v8 (copy), v10 (copy), l_Chip_0 (copy), v9 (copy), l_dependencyArray_0 (copy)
    local l_filter_0 = v4.useContext(v7.Context).filter;
    local v13 = l_useLocalization_0({
        all = "Feature.Friends.Label.All", 
        online = "Common.Presence.Label.Online", 
        trusted = "Feature.Friends.TrustedConnection.Label.Trusted"
    });
    local v17 = v4.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v8 (ref), v10 (ref), v4 (ref), l_Chip_0 (ref), v13 (copy), v9 (ref), v11 (copy), l_filter_0 (copy)
        local v14 = {};
        for v15, v16 in ipairs(v8) do
            v14[v10[v15]] = v4.createElement(l_Chip_0, {
                id = v16, 
                text = v13[v9[v16]], 
                LayoutOrder = v15, 
                onActivated = function() --[[ Line: 50 ]] --[[ Name: onActivated ]]
                    -- upvalues: v11 (ref), v16 (copy)
                    v11.onActivated(v16);
                end, 
                isChecked = l_filter_0 == v16
            });
        end;
        return v14;
    end, l_dependencyArray_0(v13, l_filter_0, v11.onActivated));
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 32), 
        LayoutOrder = v11.layoutOrder, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        allFriendsChip = v17.allFriendsChip, 
        onlineFriendsChip = v17.onlineFriendsChip, 
        trustedFriendsChip = v17.trustedFriendsChip
    });
end;
return ChipFilterGroup;