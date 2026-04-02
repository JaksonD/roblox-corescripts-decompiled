local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.SocialExperienceJoin);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v5 = require(script.Parent.DesktopGameJoinCard);
local l_getRbxThumb_0 = v2.Utility.getRbxThumb;
local l_ThumbnailType_0 = v2.Enums.ThumbnailType;
local l_ThumbnailSize_0 = v2.Enums.ThumbnailSize;
local l_useJoinUserInExperience_0 = v3.useJoinUserInExperience;
return function(v10) --[[ Line: 25 ]] --[[ Name: DesktopGameJoinCardContainer ]]
    -- upvalues: v1 (copy), l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy), l_ContentProvider_0 (copy), l_useJoinUserInExperience_0 (copy), v5 (copy)
    local l_layoutOrder_0 = v10.layoutOrder;
    local l_playerName_0 = v10.playerName;
    local l_universeId_0 = v10.universeId;
    local l_experienceName_0 = v10.experienceName;
    local v15 = v1.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: l_getRbxThumb_0 (ref), l_ThumbnailType_0 (ref), l_universeId_0 (copy), l_ThumbnailSize_0 (ref)
        return l_getRbxThumb_0(l_ThumbnailType_0.GameIcon, l_universeId_0, l_ThumbnailSize_0.Small);
    end, {
        l_universeId_0
    });
    local v16, v17 = v1.useState(Enum.AssetFetchStatus.None);
    v1.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v17 (copy), l_ContentProvider_0 (ref), v15 (copy)
        v17(l_ContentProvider_0:GetAssetFetchStatus(v15));
    end, {
        v15
    });
    v1.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: l_ContentProvider_0 (ref), v15 (copy), v17 (copy)
        local v18 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v15):Connect(v17);
        return function() --[[ Line: 40 ]]
            -- upvalues: v18 (copy)
            v18:Disconnect();
        end;
    end, {
        v15
    });
    local v19 = l_useJoinUserInExperience_0(v10.userId, {
        isHomePageCarousel = true
    });
    local v20 = true;
    if l_universeId_0 ~= "" then
        v20 = true;
        if l_experienceName_0 ~= nil then
            v20 = true;
            if l_experienceName_0 ~= "" then
                v20 = v16 == Enum.AssetFetchStatus.Loading;
            end;
        end;
    end;
    return v1.createElement(v5, {
        layoutOrder = l_layoutOrder_0, 
        playerName = l_playerName_0, 
        experienceName = l_experienceName_0, 
        gameIconUrl = v15, 
        isLoading = v20, 
        onJoin = v19.joinExperience, 
        anchorRef = v10.anchorRef, 
        isOpen = v10.isOpen, 
        onPopoverStateChanged = v10.onPopoverStateChanged
    });
end;