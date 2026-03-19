local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local v9 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v9.useNavBarPlacement;
local l_OmniFeedService_0 = require(l_CorePackages_0.Workspace.Packages.OmniFeedService).OmniFeedService;
local l_OmniFeedConstants_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedConstants;
local v13 = v2.PureComponent:extend("OmniFeedItem");
v13.validateProps = v3.strictInterface({
    omniFeedItemType = v3.string, 
    layoutOrder = v3.optional(v3.number), 
    zIndex = v3.optional(v3.number), 
    impressionsTag = v3.string, 
    itemIndex = v3.number, 
    feedItemNameId = v3.string, 
    itemProps = v3.optional(v3.table), 
    onAbsoluteSizeChanged = v3.optional(v3.callback), 
    navBarPlacement = v3.valueOf(v9.Placement), 
    eventIngest = v3.any
});
v13.init = function(v14) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy), l_OmniFeedConstants_0 (copy), l_mutedError_0 (copy)
    v14.feedItemRef = v2.createRef();
    v14.descendantGuiButtons = {};
    v14.addDescendantGuiButton = function(v15) --[[ Line: 43 ]]
        -- upvalues: l_HttpService_0 (ref), v14 (copy), l_OmniFeedConstants_0 (ref)
        local l_v15_Attribute_0 = v15:GetAttribute("GUID");
        if l_v15_Attribute_0 == nil then
            l_v15_Attribute_0 = l_HttpService_0:GenerateGUID();
            v15:SetAttribute("GUID", l_v15_Attribute_0);
        end;
        if v14.descendantGuiButtons[l_v15_Attribute_0] then
            v14.descendantGuiButtons[l_v15_Attribute_0].connection:Disconnect();
            v14.descendantGuiButtons[l_v15_Attribute_0] = nil;
        end;
        local v18 = v15.Activated:Connect(function(_) --[[ Line: 56 ]]
            -- upvalues: v14 (ref), l_OmniFeedConstants_0 (ref), v15 (copy)
            if not v14.isMounted then
                return;
            else
                v14.props.eventIngest:setRBXEventStream(l_OmniFeedConstants_0.EventContext, "feedItemClicked", {
                    fullPath = v15:GetFullName(), 
                    treatmentType = v14.props.omniFeedItemType, 
                    feedItemPos = v14.props.layoutOrder, 
                    feedItemNameId = v14.props.feedItemNameId
                });
                return;
            end;
        end);
        v14.descendantGuiButtons[l_v15_Attribute_0] = {
            name = v15.Name, 
            connection = v18
        };
    end;
    v14.removeDescendantGuiButton = function(v19) --[[ Line: 76 ]]
        -- upvalues: v14 (copy), l_mutedError_0 (ref)
        if v19 ~= nil and v14.descendantGuiButtons[v19] then
            v14.descendantGuiButtons[v19].connection:Disconnect();
            v14.descendantGuiButtons[v19] = nil;
            return;
        else
            if v14.isMounted and not v14.descendantGuiButtonError then
                v14.descendantGuiButtonError = true;
                l_mutedError_0((("OmniFeedItem: Expecting descendant button for guid: %*, feedItemNameId: %*"):format(v19, v14.props.feedItemNameId)));
            end;
            return;
        end;
    end;
    v14.descendantAdded = function(v20) --[[ Line: 92 ]]
        -- upvalues: v14 (copy)
        if not v20 or not v20:IsA("GuiButton") then
            return;
        else
            v14.addDescendantGuiButton(v20);
            return;
        end;
    end;
    v14.descendantRemoving = function(v21) --[[ Line: 100 ]]
        -- upvalues: v14 (copy)
        if not v21 or not v21:IsA("GuiButton") then
            return;
        else
            local l_v21_Attribute_0 = v21:GetAttribute("GUID");
            v14.removeDescendantGuiButton(l_v21_Attribute_0);
            return;
        end;
    end;
    v14.addAllDescendantGuiButtons = function() --[[ Line: 109 ]]
        -- upvalues: v14 (copy)
        local v23 = v14.feedItemRef and v14.feedItemRef.current;
        if v23 then
            local l_v23_Descendants_0 = v23:GetDescendants();
            if l_v23_Descendants_0 then
                for _, v26 in pairs(l_v23_Descendants_0) do
                    v14.descendantAdded(v26);
                end;
            end;
        end;
    end;
    v14.removeAllDescendantGuiButtons = function() --[[ Line: 121 ]]
        -- upvalues: v14 (copy)
        for v27, _ in pairs(v14.descendantGuiButtons) do
            v14.removeDescendantGuiButton(v27);
        end;
        v14.descendantGuiButtons = {};
    end;
end;
v13.render = function(v29) --[[ Line: 129 ]] --[[ Name: render ]]
    -- upvalues: l_OmniFeedService_0 (copy), v2 (copy), v9 (copy), l_mutedError_0 (copy)
    local l_omniFeedItemType_0 = v29.props.omniFeedItemType;
    local l_layoutOrder_0 = v29.props.layoutOrder;
    local v32 = l_OmniFeedService_0.get():getOmniFeedItemMap().getComponent(l_omniFeedItemType_0);
    if l_omniFeedItemType_0 ~= nil and v32 ~= nil then
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            SelectionGroup = true, 
            SelectionBehaviorLeft = if v29.props.navBarPlacement == v9.Placement.Left then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            LayoutOrder = l_layoutOrder_0, 
            ZIndex = v29.props.zIndex, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v2.Ref] = v29.feedItemRef, 
            [v2.Event.DescendantAdded] = function(_, v34) --[[ Line: 149 ]]
                -- upvalues: v29 (copy)
                v29.descendantAdded(v34);
            end, 
            [v2.Event.DescendantRemoving] = function(_, v36) --[[ Line: 152 ]]
                -- upvalues: v29 (copy)
                v29.descendantRemoving(v36);
            end, 
            [v2.Change.AbsoluteSize] = function(v37) --[[ Line: 155 ]]
                -- upvalues: v29 (copy)
                if v37 then
                    local l_onAbsoluteSizeChanged_0 = v29.props.onAbsoluteSizeChanged;
                    if l_onAbsoluteSizeChanged_0 then
                        l_onAbsoluteSizeChanged_0(v37);
                    end;
                end;
            end
        }, {
            FeedItem = v2.createElement(v32, v29.props.itemProps)
        });
    else
        l_mutedError_0("OmniFeedItem: Unknown omni feed item type: " .. tostring(l_omniFeedItemType_0) .. ", should have already been filtered out.");
        return nil;
    end;
end;
v13.didMount = function(v39) --[[ Line: 176 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v39.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v39.feedItemRef, v39.props.impressionsTag, v39.props.itemIndex);
    v39.addAllDescendantGuiButtons();
end;
v13.willUnmount = function(v40) --[[ Line: 183 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v40.isMounted = false;
    v40.removeAllDescendantGuiButtons();
    l_ImpressionsTagUtility_0.RemoveTag(v40.feedItemRef, v40.props.impressionsTag, v40.props.itemIndex);
end;
v13.didUpdate = function(v41, v42) --[[ Line: 190 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    if v42.impressionsTag ~= v41.props.impressionsTag or v42.itemIndex ~= v41.props.itemIndex then
        l_ImpressionsTagUtility_0.RemoveTag(v41.feedItemRef, v42.impressionsTag, v42.itemIndex);
        l_ImpressionsTagUtility_0.AddTag(v41.feedItemRef, v41.props.impressionsTag, v41.props.itemIndex);
    end;
    if v42.feedItemNameId ~= v41.props.feedItemNameId then
        v41.removeAllDescendantGuiButtons();
        v41.addAllDescendantGuiButtons();
    end;
end;
local l_v13_0 = v13;
return l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0
})(function(v44) --[[ Line: 203 ]]
    -- upvalues: l_useNavBarPlacement_0 (copy), v4 (copy), v2 (copy), l_v13_0 (copy)
    local v45 = l_useNavBarPlacement_0();
    local v46 = v4.Dictionary.join(v44, {
        navBarPlacement = v45
    });
    return v2.createElement(l_v13_0, v46);
end);