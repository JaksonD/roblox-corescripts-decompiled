local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
return {
    userProfilesCombinedNameByUserIds = l_queries_0.userProfilesCombinedNameByUserIds, 
    userProfilesCombinedNameAndAliasByUserIds = l_queries_0.userProfilesCombinedNameAndAliasByUserIds, 
    userProfilesCombinedNameAndUsernameByUserIds = l_queries_0.userProfilesCombinedNameAndUsernameByUserIds, 
    userProfilesAllNamesByUserIds = l_queries_0.userProfilesAllNamesByUserIds, 
    userProfilesDisplayNameAndUsernameByUserIds = l_queries_0.userProfilesDisplayNameAndUsernameByUserIds, 
    userProfilesDisplayUserPlatformNamesByUserIds = l_queries_0.userProfilesDisplayUserPlatformNamesByUserIds, 
    userProfilesInExperienceNamesByUserIds = l_queries_0.userProfilesInExperienceNamesByUserIds, 
    userProfilesCombinedAndPlatformByUserIds = l_queries_0.userProfilesCombinedAndPlatformByUserIds, 
    userProfilesPlatformNamesByUserIds = l_queries_0.userProfilesPlatformNamesByUserIds, 
    userProfilesPlatformProfileIdsByUserIds = l_queries_0.userProfilesPlatformProfileIdsByUserIds, 
    userProfilesCombinedNameUsernameAndIsVerifiedByUserIds = l_queries_0.userProfilesCombinedNameUsernameAndIsVerifiedByUserIds, 
    userProfilesFriendsLandingQueryByUserIds = l_queries_0.userProfilesFriendsLandingQueryByUserIds
};