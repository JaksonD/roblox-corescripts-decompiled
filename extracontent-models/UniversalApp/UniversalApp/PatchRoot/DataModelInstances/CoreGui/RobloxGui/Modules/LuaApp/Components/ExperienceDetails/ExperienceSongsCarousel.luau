local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_HttpService_0 = game:GetService("HttpService");
local l_SongCollectionCarousel_0 = require(l_CorePackages_0.Workspace.Packages.SongDetails).SongCollectionCarousel;
local l_useExperienceSongs_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceSongsRodux).useExperienceSongs;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_FFlagSongCarouselPropUpdate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSongCarouselPropUpdate;
return function(v8) --[[ Line: 26 ]]
    -- upvalues: l_useExperienceSongs_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_HttpService_0 (copy), l_SongCollectionCarousel_0 (copy), l_FFlagSongCarouselPropUpdate_0 (copy), l_AppPage_0 (copy)
    local v9 = l_useExperienceSongs_0(v8.universeId);
    local v10 = l_useLocalization_0({
        featuredSongsHeader = {
            "Feature.GameDetails.Heading.FeaturedSongs"; 
            experienceName = v8.universeTitle
        }
    });
    local l_songIds_0 = v9.songIds;
    local v12 = v1.useRef(l_HttpService_0:GenerateGUID());
    local v13 = "GameDetails_" .. tostring(v8.universeId) .. tostring(v12.current);
    if #l_songIds_0 == 0 then
        return nil;
    else
        return v1.createElement(l_SongCollectionCarousel_0, {
            songIds = l_songIds_0, 
            title = v10.featuredSongsHeader, 
            impressionsTag = v13, 
            collectionOrder = if l_FFlagSongCarouselPropUpdate_0 then v8.collectionOrder else nil, 
            layoutOrder = if l_FFlagSongCarouselPropUpdate_0 then nil else v8.collectionOrder, 
            pageContext = l_AppPage_0.ExperienceDetail, 
            referralId = v8.universeId, 
            fractionalItemAmount = v8.fractionalItemAmount, 
            clipsDescendants = v8.clipsDescendants
        });
    end;
end;