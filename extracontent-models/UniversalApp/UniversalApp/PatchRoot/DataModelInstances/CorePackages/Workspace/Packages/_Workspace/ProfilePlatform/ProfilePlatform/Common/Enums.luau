local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagAddIEMProfilePage_0 = require(l_Parent_0.SharedFlags).FFlagAddIEMProfilePage;
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local l_FFlagEnableProfileCompletion_0 = require(l_Parent_0.SharedFlags).FFlagEnableProfileCompletion;
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
return {
    Components = {
        About = "About", 
        Actions = "Actions", 
        CoverPhoto = "CoverPhoto", 
        CurrentlyWearing = "CurrentlyWearing", 
        FavoriteExperiences = "FavoriteExperiences", 
        Store = "Store", 
        SocialLinks = "SocialLinks", 
        Videos = "Videos", 
        UserProfileHeader = "UserProfileHeader", 
        ViewFullProfile = "ViewFullProfile", 
        Inventory = "Inventory", 
        CommunityProfileHeader = "CommunityProfileHeader", 
        Experiences = "Experiences", 
        ContactProfileHeader = "ContactProfileHeader", 
        ContactDescription = "ContactDescription", 
        CommunityLocked = "CommunityLocked", 
        ProfileBackground = "ProfileBackground", 
        ProfileCompletion = l_FFlagEnableProfileCompletion_0 and "ProfileCompletion" or "", 
        Events = "Events", 
        CurrentlyPlaying = "CurrentlyPlaying"
    }, 
    ProfileActions = {
        AcceptFriendRequest = "AcceptFriendRequest", 
        AcceptOffNetworkFriendRequest = "AcceptOffNetworkFriendRequest", 
        AddFriend = "AddFriend", 
        AddFriendFromContacts = "AddFriendFromContacts", 
        AddFriendFromContactsSent = "AddFriendFromContactsSent", 
        AddTrustedConnection = "AddTrustedConnection", 
        AddTrustedConnectionViaLink = "AddTrustedConnectionViaLink", 
        AddIncomingTrustedConnection = "AddIncomingTrustedConnection", 
        PendingTrustedConnection = "PendingTrustedConnection", 
        PendingIncomingTrustedConnection = "PendingIncomingTrustedConnection", 
        Block = "Block", 
        CannotAddFriend = "CannotAddFriend", 
        Chat = "Chat", 
        EditAlias = "EditAlias", 
        EditAppearance = v5 and "EditAppearance" or "", 
        EditAvatar = "EditAvatar", 
        EditLook = "EditLook", 
        EditEmotes = v5 and "EditEmotes" or "", 
        SwitchAvatar = v5 and "SwitchAvatar" or "", 
        EditProfile = "EditProfile", 
        IgnoreFriendRequest = "IgnoreFriendRequest", 
        JoinExperience = "JoinExperience", 
        PendingFriendRequest = "PendingFriendRequest", 
        QrCode = "QrCode", 
        Report = "Report", 
        ShareProfile = "ShareProfile", 
        Unblock = "Unblock", 
        Unfriend = "Unfriend", 
        CopyLink = "CopyLink", 
        JoinCommunity = "JoinCommunity", 
        CancelJoinCommunityRequest = "CancelJoinCommunityRequest", 
        ViewCommunity = "ViewCommunity", 
        ViewFullProfile = "ViewFullProfile", 
        LeaveCommunity = "LeaveCommunity", 
        MakePrimaryCommunity = "MakePrimaryCommunity", 
        RemovePrimaryCommunity = "RemovePrimaryCommunity", 
        Follow = "Follow", 
        Unfollow = "Unfollow", 
        RemoveTrustedConnection = "RemoveTrustedConnection", 
        ViewPlatformProfile = "ViewPlatformProfile", 
        ViewAbout = "ViewAbout", 
        CurrencyTransfer = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and "CurrencyTransfer" or ""
    }, 
    DisabledReasons = {
        BannedFromCommunity = "BannedFromCommunity", 
        CommunityIsClosed = "CommunityIsClosed", 
        MaxCommunitiesJoined = "MaxCommunitiesJoined", 
        InsufficientVerificationLevelLow = "InsufficientVerificationLevelLow", 
        InsufficientVerificationLevelMedium = "InsufficientVerificationLevelMedium", 
        InsufficientVerificationLevelHigh = "InsufficientVerificationLevelHigh", 
        AccountCreatedLessThanOneDay = "AccountCreatedLessThanOneDay", 
        AccountCreatedLessThanThreeDays = "AccountCreatedLessThanThreeDays", 
        AccountCreatedLessThanOneWeek = "AccountCreatedLessThanOneWeek", 
        AccountCreatedLessThanOneMonth = "AccountCreatedLessThanOneMonth", 
        AccountCreatedLessThanThreeMonths = "AccountCreatedLessThanThreeMonths"
    }, 
    ProfileTypes = {
        User = "User", 
        Community = "Community", 
        Contact = "Contact"
    }, 
    Sources = {
        HomepageFriendsCarousel = "HomepageFriendsCarousel", 
        OffNetworkFriendRequest = "OffNetworkFriendRequest", 
        PlayerSearch = "PlayerSearch", 
        ProfileDeepLink = "ProfileDeepLink", 
        ProfileShare = "ProfileShare", 
        QrCode = "QrCode", 
        HomepageAd = "HomepageAd", 
        ItemDetailsPage = "ItemDetailsPage", 
        MutualConnectionsList = "MutualConnectionsList", 
        InExperienceProfile = l_FFlagAddIEMProfilePage_0 and "InExperienceProfile" or "", 
        JoinGameCard = "JoinGameCard"
    }, 
    ContextualTypes = {
        AccountDeleted = "AccountDeleted", 
        Presence = "Presence", 
        IsYourself = "IsYourself", 
        PreviousUsername = "PreviousUsername", 
        YouAreFollowing = "YouAreFollowing", 
        FollowsYou = "FollowsYou", 
        MutualFriends = "MutualFriends", 
        PlayedTogether = "PlayedTogether", 
        OffNetworkFriendRequest = "OffNetworkFriendRequest", 
        SentFromQrCode = "SentFromQrCode", 
        SentFromExperience = "SentFromExperience"
    }, 
    PresenceTypes = {
        Online = "Online", 
        Offline = "Offline", 
        InGame = "InGame", 
        InStudio = "InStudio"
    }, 
    Screens = {
        ProfileMain = "ProfileMain", 
        ItemDetails = "ItemDetails", 
        ItemOrBundleDetails = "ItemOrBundleDetails", 
        VideoFullscreen = "VideoFullscreen", 
        EditProfilePage = "EditProfilePage", 
        EditDisplayNameModal = "EditDisplayNameModal", 
        EditDescriptionModal = "EditDescriptionModal", 
        EditDisplayNameErrorModal = "EditDisplayNameErrorModal", 
        UsernameInsufficientFundsModal = "UsernameInsufficientFundsModal", 
        SetAliasModal = "SetAliasModal", 
        SetNicknameModal = "SetNicknameModal", 
        ContextualMenu = "ContextualMenu", 
        EditProfileBackground = "EditProfileBackground", 
        PersonaAvatarPage = "PersonaAvatarPage", 
        EditPersonaNameModal = "EditPersonaNameModal", 
        CommunityVerificationModal = "CommunityVerificationModal", 
        TransferRobuxFlow = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and "TransferRobuxFlow" or ""
    }, 
    NameTypes = {
        Alias = "Alias", 
        DisplayName = "DisplayName", 
        Username = "Username"
    }, 
    ButtonSurface = {
        Actions = "Actions", 
        ContextualMenu = "ContextualMenu"
    }, 
    ItemTypes = {
        Asset = "Asset", 
        Bundle = "Bundle"
    }, 
    FriendStatus = {
        Self = "self", 
        NotFriends = "nonfriend", 
        Friends = "friend", 
        RequestSent = "requestSent", 
        RequestReceived = "requestReceived", 
        Ineligible = "ineligible", 
        Unknown = "unknown"
    }, 
    PriceLineContentType = {
        Price = "price", 
        Text = "text"
    }, 
    SocialMediaTypes = {
        Twitter = "twitter", 
        Facebook = "facebook", 
        Discord = "discord", 
        YouTube = "youtube", 
        Twitch = "twitch", 
        Guilded = "guilded", 
        X = "x"
    }, 
    ViewFullProfileTypes = {
        Profile = "Profile", 
        Community = "Community"
    }, 
    ProfileFormFactor = {
        Wide = "Wide", 
        PeekView = "PeekView"
    }, 
    LoadingState = {
        Failed = "Failed", 
        Finished = "Finished", 
        Loading = "Loading"
    }, 
    SocialCountEnableKeys = {
        IsFriendsCountEnabled = "isFriendsCountEnabled", 
        IsFollowersCountEnabled = "isFollowersCountEnabled", 
        IsFollowingsCountEnabled = "isFollowingsCountEnabled", 
        IsMutualFriendsCountEnabled = "isMutualFriendsCountEnabled"
    }
};