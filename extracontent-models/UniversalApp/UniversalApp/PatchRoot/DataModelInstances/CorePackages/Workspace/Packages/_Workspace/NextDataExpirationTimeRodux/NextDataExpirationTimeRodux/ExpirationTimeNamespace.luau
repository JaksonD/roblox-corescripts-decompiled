local l_Parent_0 = script:FindFirstAncestor("NextDataExpirationTimeRodux").Parent;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
return {
    GameDetailPage = "GameDetailPage", 
    GameDetailPlayability = "GameDetailPlayability", 
    GameSortGroup = "GameSortGroup", 
    SongDetailPage = l_FFlagEnableTopSongsSort_0 and "SongDetailPage" or nil
};