local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local l_useLayoutValues_0 = v4.Common.useLayoutValues;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v8 = require(l_Parent_0.Components.Container.PlayerEntryContainer);
local v9 = require(l_Parent_0.Components.Container.TeamEntryContainer);
local l_FFlagReplacePlayerIconRoduxWithSignal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal;
local l_FFlagPlayerListUseFocusNavHook_0 = v4.Flags.FFlagPlayerListUseFocusNavHook;
local l_PlayerIconInfoStore_0 = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore;
return v2.memo(function(v13) --[[ Line: 61 ]] --[[ Name: TeamListView ]]
    -- upvalues: l_useLayoutValues_0 (copy), l_useStyle_0 (copy), v2 (copy), v9 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), l_PlayerIconInfoStore_0 (copy), v8 (copy), l_FFlagPlayerListUseFocusNavHook_0 (copy)
    local v14 = l_useLayoutValues_0();
    local v15 = l_useStyle_0();
    local v16 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = if v13.isDirectionalPreferred then UDim.new(0, v14.EntryPadding) else nil
        })
    };
    if v13.showTeamEntry then
        v16.TeamEntry = v2.createElement(v9, {
            size = UDim2.new(1, 0, 0, v14.TeamEntrySizeY), 
            teamData = v13.teamData, 
            entrySizeX = v13.entrySizeX, 
            isSmallTouchDevice = v13.isSmallTouchDevice, 
            isDirectionalPreferred = v13.isDirectionalPreferred, 
            layoutOrder = -1
        });
    end;
    if v13.teamPlayersCount > 0 then
        local v17 = 0;
        if v13.isSmallTouchDevice then
            v16.BottomDiv = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 0, 0), 
                AnchorPoint = Vector2.new(0, 0), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0.8, 
                LayoutOrder = v13.teamPlayersCount * 2
            });
        end;
        do
            local l_v17_0 = v17;
            v13.teamData.players.iterateData(function(v19, v20) --[[ Line: 100 ]]
                -- upvalues: l_v17_0 (ref), l_FFlagReplacePlayerIconRoduxWithSignal_0 (ref), l_PlayerIconInfoStore_0 (ref), v13 (copy), v16 (copy), v2 (ref), v8 (ref), v14 (copy), l_FFlagPlayerListUseFocusNavHook_0 (ref), v15 (copy)
                l_v17_0 = l_v17_0 + 1;
                local v21 = nil;
                v21 = if l_FFlagReplacePlayerIconRoduxWithSignal_0 then l_PlayerIconInfoStore_0.getPlayerIconInfoReactive(v19.UserId)(false) else v13.playerIconInfos[v20];
                local v22 = v13.playerRelationships[v20];
                if not v21 or not v22 then
                    return;
                else
                    v16["PlayerEntry_" .. tostring(v20)] = v2.createElement(v8, {
                        size = UDim2.new(1, v14.EntryXOffset, 0, v14.PlayerEntrySizeY), 
                        player = v19, 
                        titlePlayerEntry = false, 
                        entrySizeX = v13.entrySizeX, 
                        playerIconInfo = v21, 
                        playerRelationship = v22, 
                        setDropDownPlayerDimensionY = v13.setDropDownPlayerDimensionY, 
                        firstPlayerRef = v13.firstPlayerRef, 
                        prevFocusedEntry = v13.prevFocusedEntry, 
                        destroyedFocusedPlayerId = v13.destroyedFocusedPlayerId, 
                        registerPlayerInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v13.registerPlayerInstance else nil, 
                        unregisterPlayerInstance = if l_FFlagPlayerListUseFocusNavHook_0 then v13.unregisterPlayerInstance else nil, 
                        setSelectedPlayerId = if l_FFlagPlayerListUseFocusNavHook_0 then v13.setSelectedPlayerId else nil
                    });
                    if v13.isSmallTouchDevice then
                        v16["TopDiv_" .. l_v17_0] = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 1), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0, 0), 
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                            BackgroundTransparency = 0.8, 
                            LayoutOrder = (l_v17_0 - 1) * 2
                        });
                    end;
                    if l_v17_0 < v13.teamPlayersCount and not v13.isSmallTouchDevice and not v13.isDirectionalPreferred then
                        v16["Divider_" .. l_v17_0] = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 1), 
                            Position = UDim2.new(0, 0, 1, 0), 
                            AnchorPoint = Vector2.new(0, 1), 
                            BackgroundTransparency = v15.Theme.Divider.Transparency, 
                            BackgroundColor3 = v15.Theme.Divider.Color, 
                            BorderSizePixel = 0, 
                            LayoutOrder = l_v17_0 * 2
                        });
                    end;
                    return;
                end;
            end, false);
        end;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.layoutOrder
    }, v16);
end);