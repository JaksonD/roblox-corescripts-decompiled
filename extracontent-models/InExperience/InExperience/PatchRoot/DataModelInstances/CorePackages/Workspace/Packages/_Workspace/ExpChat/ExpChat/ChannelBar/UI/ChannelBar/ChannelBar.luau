local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Config);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local v6 = require(l_Parent_0.SignalsReact);
local v7 = require(l_Parent_0.UIBlox);
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_useSelectionCursor_0 = v7.App.SelectionImage.useSelectionCursor;
local v12 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatFocusChannelBarSupport);
local v14 = require(l_script_FirstAncestor_0.Stores.GetFocusNavigationStore)(false);
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
local v16 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local v17 = require(script.Parent.Parent.ChannelTab);
local v18 = l_Images_0["icons/navigation/cycleDown"];
local v19 = Color3.fromRGB(255, 255, 255);
local v20 = Color3.fromRGB(100, 100, 100);
local _ = function(v21) --[[ Line: 65 ]] --[[ Name: countAllChannelTabs ]]
    local v22 = 0;
    for _ in pairs(v21) do
        v22 = v22 + 1;
    end;
    return v22;
end;
local function v28(v25, v26) --[[ Line: 73 ]] --[[ Name: setTransparency ]]
    return v26:map(function(v27) --[[ Line: 74 ]]
        -- upvalues: v25 (copy)
        if v25 == nil then
            return 1;
        else
            return v25 + v27 * (1 - v25);
        end;
    end);
end;
return function(v29) --[[ Line: 79 ]] --[[ Name: ChannelBar ]]
    -- upvalues: v3 (copy), v4 (copy), v13 (copy), v6 (copy), v14 (copy), v5 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v17 (copy), l_FFlagExpChatPerfTracking_0 (copy), v16 (copy), v28 (copy), l_TextChatService_0 (copy), v12 (copy), v20 (copy), l_ImageSetLabel_0 (copy), v18 (copy), v19 (copy)
    local l_allChannelTabs_0 = v29.allChannelTabs;
    local v31 = 0;
    for _ in pairs(l_allChannelTabs_0) do
        v31 = v31 + 1;
    end;
    local l_v31_0 = v31;
    l_allChannelTabs_0 = v3.ChatWindowSize.Y.Scale * v29.chatWindowSettings.HeightScale * v3.ChatWindowMaxWidth;
    local v34;
    v31, v34 = v4.useState(false);
    local v35, v36 = v4.useState(false);
    local v37, v38 = v4.useState(1024);
    local v39 = if v13 then v6.useSignalState(v14.getChatInputBarFocused) else nil;
    local v40 = if v13 then v4.useRef(nil) else nil;
    local v41 = if v13 then v5.useFocusGuiObject() else nil;
    local v42 = if v13 then l_useSelectionCursor_0(l_CursorKind_0.Invisible) else nil;
    local v43 = if v13 then l_useSelectionCursor_0(l_CursorKind_0.RoundedSlot) else nil;
    local v44 = v37 < l_v31_0 * v3.ChannelTabsSettings.MinTabWidth;
    local v45 = not v44 and l_v31_0 or math.floor((v37 - v3.ChannelTabsSettings.DropdownIconContainerWidth) / v3.ChannelTabsSettings.MinTabWidth);
    local v46 = (v37 - (v44 and v3.ChannelTabsSettings.DropdownIconContainerWidth or 0)) / v45;
    local v47 = (l_v31_0 - v45) * 40;
    local v50 = v4.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: v29 (copy), v45 (copy)
        for _, v49 in pairs(v29.allChannelTabs) do
            if v49.TabIndex > v45 and v49.HasUnreadMessages then
                return true;
            end;
        end;
        return false;
    end);
    local v51 = {
        ["$layout"] = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        })
    };
    local v52 = {
        ["$layout"] = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    for v53, v54 in pairs(v29.allChannelTabs) do
        local v55 = v54.TabIndex <= v45;
        local v56 = v29.allTextChannels[v53];
        local v58 = v4.createElement(v17, {
            channelTabsSettings = v29.channelTabsSettings, 
            channelName = v53, 
            textChannel = v56, 
            hasUnreadMessages = v54.HasUnreadMessages, 
            isDividerVisible = (not (v54.TabIndex >= v45) or v44) and v54.TabIndex < l_v31_0, 
            isTabCollapsed = not v55, 
            isTabSelected = v29.selectedTabName and v29.selectedTabName == v53, 
            onTabSelected = function() --[[ Line: 147 ]] --[[ Name: onTabSelected ]]
                -- upvalues: l_FFlagExpChatPerfTracking_0 (ref), v16 (ref), v56 (copy), v55 (copy), v39 (copy), v40 (copy), v41 (copy), v29 (copy), v36 (copy)
                if l_FFlagExpChatPerfTracking_0 then
                    v16.cancelAll();
                    v16.start(v16.Events.ChatWindowTabSwitchTTI, {
                        tabId = v56.Name
                    });
                end;
                if not v55 and v39 and v40.current then
                    v41(v40.current);
                end;
                v29.onTabSelected(v56, not v55);
                v36(false);
            end, 
            setTransparency = function(v57) --[[ Line: 161 ]] --[[ Name: setTransparency ]]
                -- upvalues: v28 (ref), v29 (copy)
                return v28(v57, v29.transparencyValue);
            end
        });
        if v55 then
            v51[v54.TabIndex] = v4.createElement("Frame", {
                Size = UDim2.new(0, v46, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v54.TabIndex
            }, {
                ChannelTab = v58
            });
        else
            local v59 = v54.TabIndex - v45;
            v52[v59] = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 40), 
                BackgroundTransparency = 1, 
                LayoutOrder = v59
            }, {
                ChannelTab = v58
            });
            if v54.HasUnreadMessages then
                v50 = true;
            end;
        end;
    end;
    local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
    local l_channelTabsSettings_0 = v29.channelTabsSettings;
    local l_BackgroundTransparency_0 = v12(l_channelTabsSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v12(l_channelTabsSettings_0).BackgroundColor3;
    local l_createElement_0 = v4.createElement;
    local v65 = "Frame";
    local v68 = {
        Size = UDim2.new(1, 0, 0, v3.ChannelTabsSettings.HorizontalBarHeight), 
        BackgroundTransparency = 1, 
        Visible = v29.visible, 
        BorderSizePixel = 0, 
        [v4.Event.MouseEnter] = v29.onHovered, 
        [v4.Event.MouseLeave] = v29.onUnhovered, 
        [v4.Change.AbsoluteSize] = function(v66) --[[ Line: 202 ]]
            -- upvalues: v38 (copy), l_ChannelTabsConfiguration_0 (copy)
            v38(v66.AbsoluteSize.X);
            if l_ChannelTabsConfiguration_0 then
                l_ChannelTabsConfiguration_0:SetAbsoluteSize(v66.AbsoluteSize);
            end;
        end, 
        [v4.Change.AbsolutePosition] = function(v67) --[[ Line: 208 ]]
            -- upvalues: l_ChannelTabsConfiguration_0 (copy)
            if l_ChannelTabsConfiguration_0 then
                l_ChannelTabsConfiguration_0:SetAbsolutePosition(v67.AbsolutePosition);
            end;
        end
    };
    local v69 = {};
    local l_createElement_1 = v4.createElement;
    local v71 = "Frame";
    local v72 = {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    };
    local v74 = {
        ContentContainer = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v51), 
        TopCorner = v4.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            ImageColor3 = l_BackgroundColor3_0, 
            ImageTransparency = v29.transparencyValue:map(function(v73) --[[ Line: 74 ]]
                -- upvalues: l_BackgroundTransparency_0 (copy)
                if l_BackgroundTransparency_0 == nil then
                    return 1;
                else
                    return l_BackgroundTransparency_0 + v73 * (1 - l_BackgroundTransparency_0);
                end;
            end), 
            Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 8), 
            SliceCenter = Rect.new(8, 8, 24, 32), 
            BorderSizePixel = 0, 
            Selectable = v13 and true or nil, 
            SelectionImageObject = v42, 
            ref = if v13 then v29.topBorderRef else nil
        })
    };
    local l_createElement_2 = v4.createElement;
    local v76 = "Frame";
    local v77 = {
        Size = UDim2.new(1, 0, 0, 1), 
        Position = UDim2.new(0, 0, 1, -1), 
        BackgroundColor3 = v3.ChannelTabsSettings.BorderColor3
    };
    local l_BorderTransparency_0 = v3.ChannelTabsSettings.BorderTransparency;
    local l_l_BorderTransparency_0_0 = l_BorderTransparency_0 --[[ copy: 38 -> 47 ]];
    v77.BackgroundTransparency = v29.transparencyValue:map(function(v80) --[[ Line: 74 ]]
        -- upvalues: l_l_BorderTransparency_0_0 (copy)
        if l_l_BorderTransparency_0_0 == nil then
            return 1;
        else
            return l_l_BorderTransparency_0_0 + v80 * (1 - l_l_BorderTransparency_0_0);
        end;
    end);
    v77.BorderSizePixel = 0;
    v74.BottomBorder = l_createElement_2(v76, v77);
    v74.Background = v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v3.ChannelTabsSettings.HorizontalBarHeight - 8 - 1), 
        Position = UDim2.new(0, 0, 0, 8), 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = v29.transparencyValue:map(function(v81) --[[ Line: 74 ]]
            -- upvalues: l_BackgroundTransparency_0 (copy)
            if l_BackgroundTransparency_0 == nil then
                return 1;
            else
                return l_BackgroundTransparency_0 + v81 * (1 - l_BackgroundTransparency_0);
            end;
        end), 
        BorderSizePixel = 0
    });
    v69.HorizontalBar = l_createElement_1(v71, v72, v74);
    l_createElement_1 = v44;
    if l_createElement_1 then
        l_createElement_1 = v4.createElement;
        v71 = "Frame";
        v72 = {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 8), 
            Size = UDim2.new(0, v3.ChannelTabsSettings.DropdownIconContainerWidth, 1, -9), 
            BackgroundColor3 = Color3.fromRGB(255, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        };
        v74 = {};
        l_createElement_2 = v4.createElement;
        v76 = "TextButton";
        v77 = {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -v3.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4), 
            Size = UDim2.new(0, 27, 0, 27)
        };
        l_BorderTransparency_0 = v31 and 0.3 or 1;
        local l_l_BorderTransparency_0_1 = l_BorderTransparency_0 --[[ copy: 38 -> 50 ]];
        v77.BackgroundTransparency = v29.transparencyValue:map(function(v83) --[[ Line: 74 ]]
            -- upvalues: l_l_BorderTransparency_0_1 (copy)
            if l_l_BorderTransparency_0_1 == nil then
                return 1;
            else
                return l_l_BorderTransparency_0_1 + v83 * (1 - l_l_BorderTransparency_0_1);
            end;
        end);
        v77.BackgroundColor3 = v20;
        v77.Text = "";
        v77.BorderSizePixel = 0;
        v77.Selectable = v13 and true or nil;
        v77.SelectionImageObject = v43;
        v77.ref = if v13 then v40 else nil;
        v77[v4.Event.MouseEnter] = function() --[[ Line: 284 ]]
            -- upvalues: v34 (copy)
            v34(true);
        end;
        v77[v4.Event.MouseLeave] = function() --[[ Line: 287 ]]
            -- upvalues: v34 (copy)
            v34(false);
        end;
        v77[v4.Event.Activated] = function() --[[ Line: 290 ]]
            -- upvalues: v36 (copy), v35 (copy)
            v36(not v35);
        end;
        local v84 = {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 27)
            })
        };
        l_BorderTransparency_0 = v4.createElement;
        local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
        local v86 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(0.6, 0.6), 
            BackgroundTransparency = 1, 
            Image = v18, 
            ImageColor3 = v19
        };
        local l_transparencyValue_0 = v29.transparencyValue;
        local v88 = 0;
        v86.ImageTransparency = l_transparencyValue_0:map(function(v89) --[[ Line: 74 ]]
            -- upvalues: v88 (copy)
            if v88 == nil then
                return 1;
            else
                return v88 + v89 * (1 - v88);
            end;
        end);
        v86.ScaleType = Enum.ScaleType.Stretch;
        v86.BorderSizePixel = 0;
        v84.DropdownIconImage = l_BorderTransparency_0(l_l_ImageSetLabel_0_0, v86);
        v74.TextButton = l_createElement_2(v76, v77, v84);
        l_createElement_2 = v50;
        if l_createElement_2 then
            l_createElement_2 = v4.createElement;
            v76 = "Frame";
            v77 = {
                Size = UDim2.new(0, 8, 0, 8), 
                Position = UDim2.new(0, 18, 0.5, -4), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundColor3 = v3.ChannelTabsSettings.UnreadDotColor3
            };
            l_BorderTransparency_0 = v29.transparencyValue;
            l_transparencyValue_0 = 0;
            local l_l_transparencyValue_0_0 = l_transparencyValue_0 --[[ copy: 42 -> 51 ]];
            v77.BackgroundTransparency = l_BorderTransparency_0:map(function(v91) --[[ Line: 74 ]]
                -- upvalues: l_l_transparencyValue_0_0 (copy)
                if l_l_transparencyValue_0_0 == nil then
                    return 1;
                else
                    return l_l_transparencyValue_0_0 + v91 * (1 - l_l_transparencyValue_0_0);
                end;
            end);
            v77.BorderSizePixel = 0;
            l_createElement_2 = l_createElement_2(v76, v77, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            });
        end;
        v74.UnreadDot = l_createElement_2;
        l_createElement_1 = l_createElement_1(v71, v72, v74);
    end;
    v69.DropdownButton = l_createElement_1;
    l_createElement_1 = v44;
    if l_createElement_1 then
        l_createElement_1 = v4.createElement;
        v71 = "Frame";
        v72 = {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -1, 0, v3.ChannelTabsSettings.HorizontalBarHeight + 1), 
            Size = UDim2.new(0, 150, 0, v47), 
            BackgroundTransparency = 1, 
            Visible = v35
        };
        v74 = {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(150, l_allChannelTabs_0)
            })
        };
        l_createElement_2 = v4.createElement;
        v76 = "UIStroke";
        v77 = {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v3.ChannelTabsSettings.BorderColor3
        };
        l_BorderTransparency_0 = v3.ChannelTabsSettings.BorderTransparency;
        local l_l_BorderTransparency_0_2 = l_BorderTransparency_0 --[[ copy: 38 -> 48 ]];
        v77.Transparency = v29.transparencyValue:map(function(v93) --[[ Line: 74 ]]
            -- upvalues: l_l_BorderTransparency_0_2 (copy)
            if l_l_BorderTransparency_0_2 == nil then
                return 1;
            else
                return l_l_BorderTransparency_0_2 + v93 * (1 - l_l_BorderTransparency_0_2);
            end;
        end);
        v74.Border = l_createElement_2(v76, v77);
        l_createElement_2 = v4.createElement;
        v76 = "ScrollingFrame";
        v77 = {
            Size = UDim2.fromScale(1, 1), 
            CanvasSize = UDim2.new(0, 150, 0, v47)
        };
        l_BorderTransparency_0 = v29.transparencyValue;
        local v94 = 0;
        local l_v94_0 = v94 --[[ copy: 42 -> 49 ]];
        v77.BackgroundTransparency = l_BorderTransparency_0:map(function(v96) --[[ Line: 74 ]]
            -- upvalues: l_v94_0 (copy)
            if l_v94_0 == nil then
                return 1;
            else
                return l_v94_0 + v96 * (1 - l_v94_0);
            end;
        end);
        v77.ScrollBarThickness = 4;
        l_BorderTransparency_0 = v29.transparencyValue;
        v94 = 0;
        v77.ScrollBarImageTransparency = l_BorderTransparency_0:map(function(v97) --[[ Line: 74 ]]
            -- upvalues: v94 (copy)
            if v94 == nil then
                return 1;
            else
                return v94 + v97 * (1 - v94);
            end;
        end);
        v77.ScrollingDirection = Enum.ScrollingDirection.Y;
        v77.ElasticBehavior = Enum.ElasticBehavior.Always;
        v77.ClipsDescendants = true;
        v77.Selectable = not v13 and nil;
        v77.BorderSizePixel = 0;
        v74.ScrollView = l_createElement_2(v76, v77, v52);
        l_createElement_1 = l_createElement_1(v71, v72, v74);
    end;
    v69.DropdownMenu = l_createElement_1;
    return l_createElement_0(v65, v68, v69);
end;