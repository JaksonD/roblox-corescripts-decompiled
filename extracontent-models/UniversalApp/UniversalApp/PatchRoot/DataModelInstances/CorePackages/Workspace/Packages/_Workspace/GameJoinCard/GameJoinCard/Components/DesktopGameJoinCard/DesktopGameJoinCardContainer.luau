local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_getRbxThumb_0 = v2.Utility.getRbxThumb;
local l_ThumbnailType_0 = v2.Enums.ThumbnailType;
local l_ThumbnailSize_0 = v2.Enums.ThumbnailSize;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v7 = require(script.Parent.DesktopGameJoinCard);
return function(v8) --[[ Line: 22 ]] --[[ Name: DesktopGameJoinCardContainer ]]
    -- upvalues: v1 (copy), l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy), l_ContentProvider_0 (copy), v7 (copy)
    local l_layoutOrder_0 = v8.layoutOrder;
    local l_playerName_0 = v8.playerName;
    local l_presenceInfo_0 = v8.presenceInfo;
    local l_universeId_0 = l_presenceInfo_0.universeId;
    local l_lastLocation_0 = l_presenceInfo_0.lastLocation;
    local v14 = v1.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: l_getRbxThumb_0 (ref), l_ThumbnailType_0 (ref), l_universeId_0 (copy), l_ThumbnailSize_0 (ref)
        return l_getRbxThumb_0(l_ThumbnailType_0.GameIcon, l_universeId_0, l_ThumbnailSize_0.Small);
    end, {
        l_universeId_0
    });
    local v15, v16 = v1.useState(Enum.AssetFetchStatus.None);
    v1.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v16 (copy), l_ContentProvider_0 (ref), v14 (copy)
        v16(l_ContentProvider_0:GetAssetFetchStatus(v14));
    end, {
        v14
    });
    v1.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: l_ContentProvider_0 (ref), v14 (copy), v16 (copy)
        local v17 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v14):Connect(v16);
        return function() --[[ Line: 39 ]]
            -- upvalues: v17 (copy)
            v17:Disconnect();
        end;
    end, {
        v14
    });
    local v18 = true;
    if l_lastLocation_0 ~= nil then
        v18 = true;
        if l_lastLocation_0 ~= "" then
            v18 = v15 == Enum.AssetFetchStatus.Loading;
        end;
    end;
    return v1.createElement(v7, {
        layoutOrder = l_layoutOrder_0, 
        playerName = l_playerName_0, 
        experienceName = l_lastLocation_0, 
        gameIconUrl = v14, 
        isLoading = v18
    });
end;