local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.SignalsReact);
local v4 = require(l_Parent_1.Display);
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Parent_1.Foundation);
local l_useScaledValue_0 = v6.Hooks.useScaledValue;
local l_useTokens_0 = v6.Hooks.useTokens;
local v9 = require(script.Parent.LayoutValuesContext);
local v10 = require(script.Parent.Parent.Flags.FFlagUseNewPlayerList);
local v11 = require(l_Parent_0.Flags.FFlagEnableMobilePlayerListOnConsole);
return function() --[[ Line: 21 ]] --[[ Name: useLayoutValues ]]
    -- upvalues: v2 (copy), v9 (copy), v10 (copy), v11 (copy), l_useTokens_0 (copy), l_useScaledValue_0 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v12 = v2.useContext(v9);
    if v10 or v11 then
        local v13 = l_useTokens_0();
        local v14 = if v11 then l_useScaledValue_0(v12.PlayerDropDownSizeX * 10) / 10 else nil;
        local v15 = if v11 then l_useScaledValue_0((v12.EntryBaseSizeX or 150) * 10) / 10 else nil;
        local v16 = if v11 then l_useScaledValue_0(v12.PlayerDropDownSizeXMobile * 10) / 10 else nil;
        local v17 = if v11 then l_useScaledValue_0(v12.PlayerNameSizeXMobile * 10) / 10 else nil;
        local v18 = if v11 then l_useScaledValue_0(500) else nil;
        local v19 = if v11 then l_useScaledValue_0(600) else nil;
        local v20 = if not v11 then v3.useSignalState(v4.GetDisplayStore) else nil;
        local v21 = if not v11 then v3.useSignalState(v20.getUIScale) else nil;
        local l_Size_100_0 = v13.Size.Size_100;
        local v23 = {
            PlayerListSizeMin = v18, 
            PlayerListSizeMax = v19, 
            ContainerPadding = l_Size_100_0, 
            ContainerPosition = UDim2.new(1, -l_Size_100_0, 0, l_Size_100_0), 
            ExtraContainerPadding = v13.Size.Size_400, 
            PlayerDropDownSizeX = if v11 then v14 else v12.PlayerDropDownSizeX * v21, 
            PlayerDropDownOffset = v13.Size.Size_100, 
            EntryBaseSizeX = if v12.EntryBaseSizeX then if v11 then v15 else v12.EntryBaseSizeX * v21 else nil, 
            EntrySizeIncreasePerStat = v13.Size.Size_300, 
            PlayerEntrySizeY = v13.Size.Size_1000, 
            TeamEntrySizeY = v13.Size.Size_600, 
            TeamNameTextSize = if v11 then v13.FontSize.FontSize_300 else nil, 
            StatEntrySizeX = v13.Size.Size_1600, 
            TitleBarTextSize = if v11 then v13.FontSize.FontSize_250 else nil, 
            TitleBarSizeY = v13.Size.Size_500, 
            PlayerIconSize = UDim2.new(0, v13.Size.Size_400, 0, v13.Size.Size_400), 
            InitalPlayerEntryPadding = v13.Size.Size_300, 
            PlayerEntryPadding = v13.Size.Size_300, 
            PlayerEntryNamePadding = v13.Size.Size_100, 
            StatTextPadding = v13.Size.Size_100, 
            PlayerNameSize = UDim2.new(1, -v13.Size.Size_900, 1, 0), 
            PlayerNameTextSize = v13.FontSize.FontSize_300, 
            StatTextSize = v13.FontSize.FontSize_300, 
            ScrollBarOffset = v13.Size.Size_100, 
            ScrollBarSize = v13.Size.Size_200, 
            PlayerDropDownSizeXMobile = if v11 then v16 else v12.PlayerDropDownSizeXMobile * v21, 
            ScrollBarSizeMobile = v13.Size.Size_50, 
            PlayerNameSizeXMobile = if v11 then v17 else v12.PlayerNameSizeXMobile * v21, 
            PlayerIconSizeMobile = UDim2.fromOffset(v13.Size.Size_500, v13.Size.Size_500), 
            PlayerNameTextSizeMobile = v13.FontSize.FontSize_350, 
            StatTextSizeMobile = v13.FontSize.FontSize_350, 
            PlayerNamePaddingXMobile = v13.Size.Size_350, 
            TeamEntryTextPadding = v13.Size.Size_400, 
            TeamEntryTextPaddingMobile = v13.Size.Size_350, 
            PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66), 
            DropDownButtonSizeY = v13.Size.Size_1400, 
            DropDownButtonTextSize = if v11 then v13.FontSize.FontSize_400 else nil, 
            DropDownPadding = v13.Size.Size_250, 
            DropDownRightOptionSize = v13.Size.Size_1400, 
            DropDownIconSize = v13.Size.Size_900, 
            DropDownHeaderSizeY = v13.Size.Size_2000, 
            DropDownHeaderBackgroundSize = v13.Size.Size_1600, 
            DropDownHeaderDisplayNameTextSize = if v11 then v13.FontSize.FontSize_400 else nil, 
            DropDownHeaderPlayerNameTextSize = if v11 then v13.FontSize.FontSize_300 else nil, 
            DropDownScreenSidePadding = l_Size_100_0
        };
        return v5.Dictionary.join(v12, v23);
    else
        return v12;
    end;
end;