local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_GameTileLayoutType_0 = require(script.Parent.GameTileTypes).GameTileLayoutType;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
return {
    TileOverlay = {
        BottomRightPosition = UDim2.new(0.96, 0, 0.93, 0)
    }, 
    PlayButtonStyleValues = {
        Enabled = "Enabled", 
        Disabled = "Disabled"
    }, 
    PlayerCountStyleValues = {
        Hover = "Hover", 
        Always = "Always", 
        Footer = "Footer"
    }, 
    TileBadgeTypeValues = {
        Text = "Text"
    }, 
    TileBadgeComponentTypeValues = {
        Pill = "Pill", 
        RoundedRectangle = "RoundedRectangle"
    }, 
    TileBadgePositionValues = {
        ImageTopLeft = "ImageTopLeft", 
        ImageBottomLeft = "ImageBottomLeft", 
        ImageTopRight = "ImageTopRight", 
        ImageBottomRight = "ImageBottomRight"
    }, 
    TileBadgePositionCalculators = {
        ImageTopLeft = function(v3) --[[ Line: 37 ]]
            return UDim2.new(0, v3, 0, v3), Vector2.new(0, 0);
        end, 
        ImageBottomLeft = function(v4) --[[ Line: 40 ]]
            return UDim2.new(0, v4, 1, -v4), Vector2.new(0, 1);
        end, 
        ImageTopRight = function(v5) --[[ Line: 43 ]]
            return UDim2.new(1, -v5, 0, v5), Vector2.new(1, 0);
        end, 
        ImageBottomRight = function(v6) --[[ Line: 46 ]]
            return UDim2.new(1, -v6, 1, -v6), Vector2.new(1, 1);
        end
    }, 
    TileBadgeIconTypeValues = {
        PaidAccess = "PaidAccess"
    }, 
    TileBadgeIconNamesByType = {
        PaidAccess = "icons/menu/gem_small"
    }, 
    TileTextLines = {
        [l_GameTileLayoutType_0.Narrow] = {
            titleTextLines = 2, 
            metadataTextLines = 1, 
            largeMetadataTextLines = 2
        }, 
        [l_GameTileLayoutType_0.Wide] = {
            titleTextLines = 1, 
            metadataTextLines = 1, 
            largeMetadataTextLines = 1
        }, 
        [l_GameTileLayoutType_0.Event] = {
            titleTextLines = 1, 
            metadataTextLines = 1, 
            largeMetadataTextLines = 1
        }
    }, 
    TileOverflowMenuItems = {
        NotInterested = "NotInterested", 
        WhyThisAd = "WhyThisAd", 
        ReportAd = l_FFlagLuaAppEnableSponsoredReportAd_0 and "ReportAd" or nil
    }
};