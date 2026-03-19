local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_AnimatedFlatList_0 = require(l_CorePackages_0.Packages.VirtualizedList).AnimatedFlatList;
local v7 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local v8 = require(l_Modules_0.LuaApp.Components.More.MoreItemsMap);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v10 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
local function v21(v13) --[[ Line: 38 ]] --[[ Name: Section ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), v8 (copy), v3 (copy), v7 (copy)
    local l_items_0 = v13.items;
    local v15 = l_useLocalization_0({
        title = v13.titleKey
    });
    local v16 = {};
    if l_items_0 ~= nil then
        v16 = v2.reduce(l_items_0, function(v17, v18, v19) --[[ Line: 46 ]]
            -- upvalues: v8 (ref), v3 (ref)
            local v20 = v8.getItemComponent(v18.itemType);
            if v20 then
                table.insert(v17, v3.createElement(v20, {
                    layoutOrder = v19, 
                    itemData = v18
                }));
            end;
            return v17;
        end, {});
    end;
    return v3.createElement(v7, {
        layoutOrder = v13.layoutOrder, 
        withDivider = v13.withDivider, 
        title = v15.title
    }, v16);
end;
local function v23(v22) --[[ Line: 68 ]] --[[ Name: renderItem ]]
    return v22.item;
end;
return v3.memo(function(v24) --[[ Line: 72 ]] --[[ Name: MoreSectionList ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), v8 (copy), v21 (copy), v3 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v10 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_AnimatedFlatList_0 (copy), v23 (copy)
    local l_itemList_0 = v24.itemList;
    local v26 = v24.topbarHeight or 0;
    local v27 = l_useDesignTokens_0();
    local l_PageTopMargin_0 = v27.LuaApps.More.PageTopMargin;
    local l_BackgroundGradientOffset_0 = v27.LuaApps.More.BackgroundGradientOffset;
    local l_SafeAreaMargin_0 = v27.LuaApps.More.SafeAreaMargin;
    local v31 = {};
    if l_itemList_0 ~= nil then
        v31 = v2.reduce(l_itemList_0, function(v32, v33) --[[ Line: 83 ]]
            -- upvalues: v2 (ref)
            return v2.append(v32, v33);
        end, {});
    end;
    local v39 = v2.map(v31, function(v34, v35) --[[ Line: 88 ]]
        -- upvalues: v8 (ref), v21 (ref), v3 (ref), v31 (ref)
        local l_itemInfo_0 = v34.itemInfo;
        local l_subItems_0 = v34.subItems;
        local v38 = v8.getSectionComponent(l_itemInfo_0.itemType) or v21;
        return v3.createElement(v38, {
            layoutOrder = v35, 
            withDivider = v35 < #v31, 
            titleKey = l_itemInfo_0.textKey, 
            items = l_subItems_0
        });
    end);
    local v40 = v3.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v3 (ref), v27 (copy)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v27.Global.Space_300), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 10000000
        });
    end, {
        v27.Global.Space_300
    });
    local v41 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v10.GetDisplayStore().getDeviceSafePadding) else nil;
    return v3.createElement("Frame", {
        Position = UDim2.new(0, l_SafeAreaMargin_0.X, 0, l_PageTopMargin_0 + v26), 
        Size = UDim2.new(1, -2 * l_SafeAreaMargin_0.X, 1, (if l_FFlagExtendScrollingFramesBySafeInsets_0 then v41.bottom - l_SafeAreaMargin_0.Y else -l_SafeAreaMargin_0.Y) - l_PageTopMargin_0 - v26), 
        BackgroundTransparency = 1
    }, {
        BackgroundFrame = v3.createElement("Frame", {
            Position = UDim2.new(0, -l_SafeAreaMargin_0.X, 0, -l_BackgroundGradientOffset_0), 
            Size = UDim2.new(1, l_SafeAreaMargin_0.X + l_SafeAreaMargin_0.X, 1, l_BackgroundGradientOffset_0 + l_SafeAreaMargin_0.Y), 
            BackgroundColor3 = if l_FFlagEnableLeftNavOnConsole_0 then v27.Semantic.Color.Background.Default.Color3 else nil, 
            BackgroundTransparency = if l_FFlagEnableLeftNavOnConsole_0 then v27.Semantic.Color.Background.Default.Transparency else 1, 
            ZIndex = -1
        }, {
            UIGradient = if l_FFlagEnableLeftNavOnConsole_0 then nil else v3.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            })
        }), 
        ContentList = v3.createElement(l_AnimatedFlatList_0, {
            animated = true, 
            animationConfig = v27.LuaApps.App.Page.ScrollAnimationConfig, 
            initialNumToRender = #v39, 
            data = v39, 
            renderItem = v23, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            style = {
                Selectable = false, 
                ClipsDescendants = true, 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                ScrollingEnabled = false
            }, 
            ItemSeparatorComponent = v40, 
            ListHeaderComponent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v27.Global.Space_200), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            ListFooterComponent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v27.Global.Space_400), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            })
        })
    });
end);