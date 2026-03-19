local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local l_Text_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Text;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Common.formatDate);
local v7 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
local v8 = require(l_script_FirstAncestor_0.Common.getEventCategory);
local v9 = require(l_script_FirstAncestor_0.Components.AttendanceChip);
local v10 = require(l_script_FirstAncestor_0.Components.DescriptionExpander);
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Text_1 = v2.Text;
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
return function(v16) --[[ Line: 36 ]] --[[ Name: EventDetailsBody ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Text_0 (copy), v8 (copy), v7 (copy), l_useLocalization_0 (copy), v9 (copy), l_Text_1 (copy), v10 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), v6 (copy)
    local v17 = l_useTokens_0();
    local v18 = v1.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v16 (copy), l_Text_0 (ref)
        if v16.virtualEvent.description == nil then
            return nil;
        else
            return l_Text_0.Trim(v16.virtualEvent.description);
        end;
    end, {
        v16.virtualEvent.description
    });
    local v19 = v1.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v8 (ref), v16 (copy)
        return v8(v16.virtualEvent);
    end, {
        v16.virtualEvent
    });
    local v20 = v1.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v7 (ref), v16 (copy)
        return v7(v16.virtualEvent);
    end, {
        v16.virtualEvent
    });
    local v21 = l_useLocalization_0({
        interested = "Feature.VirtualEvents.AttendanceBeforeEvent", 
        newContent = "Feature.VirtualEvents.Label.NewContent", 
        itemDrop = "Feature.VirtualEvents.Label.ItemDrop", 
        newSeason = "Feature.VirtualEvents.Label.NewSeason", 
        newLocation = "Feature.VirtualEvents.Label.NewLocation", 
        newMap = "Feature.VirtualEvents.Label.NewMap", 
        moreLevels = "Feature.VirtualEvents.Label.MoreLevels", 
        newFeature = "Feature.VirtualEvents.Label.NewFeature", 
        earlyAccess = "Feature.VirtualEvents.Label.EarlyAccess", 
        expansion = "Feature.VirtualEvents.Label.Expansion", 
        challenge = "Feature.VirtualEvents.Label.Challenge", 
        quest = "Feature.VirtualEvents.Label.Quest", 
        festival = "Feature.VirtualEvents.Label.Festival"
    });
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        BodyContainer = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ZIndex = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            EventAttendace = v1.createElement(v9, {
                LayoutOrder = 1, 
                virtualEvent = v16.virtualEvent, 
                eventStatus = v16.eventStatus
            }), 
            EventTitle = v1.createElement(l_Text_1, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v16.virtualEvent.title, 
                TextTruncate = Enum.TextTruncate.None, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                RichText = true, 
                textStyle = v17.Color.Content.Emphasis, 
                fontStyle = v17.Typography.TitleLarge, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = false
            }), 
            Description = if v18 and v18 ~= "" then v1.createElement(v10, {
                layoutOrder = 3, 
                description = v18, 
                width = v16.containerSize.X - 32 - 16, 
                maxHeight = v16.containerSize.Y * 0.3, 
                isExpanded = v16.isExpanded, 
                setIsExpanded = v16.setIsExpanded
            }) else nil, 
            EventCategory = if v19 and v21[v19] then v1.createElement("Frame", {
                LayoutOrder = 4, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 6)
                }), 
                Icon = v1.createElement(l_Icon_0, {
                    LayoutOrder = 1, 
                    name = "icons/common/poi_small", 
                    size = l_IconSize_0.Small, 
                    style = v17.Color.Content.Emphasis
                }), 
                Label = v1.createElement(l_Text_1, {
                    LayoutOrder = 2, 
                    Text = v21[v19], 
                    TextTruncate = Enum.TextTruncate.None, 
                    textStyle = v17.Color.Content.Emphasis, 
                    fontStyle = v17.Typography.BodyLarge, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = false
                })
            }) else nil, 
            EventTime = if v16.eventStatus == "Upcoming" then v1.createElement("Frame", {
                LayoutOrder = 5, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 6)
                }), 
                Icon = v1.createElement(l_Icon_0, {
                    LayoutOrder = 1, 
                    name = "icons/actions/calendar_small", 
                    size = l_IconSize_0.Small, 
                    style = v17.Color.Content.Emphasis
                }), 
                Label = v1.createElement(l_Text_1, {
                    LayoutOrder = 2, 
                    Text = v6(v20.startDate, true), 
                    TextTruncate = Enum.TextTruncate.None, 
                    textStyle = v17.Color.Content.Emphasis, 
                    fontStyle = v17.Typography.BodyLarge, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = false
                })
            }) else nil
        })
    });
end;