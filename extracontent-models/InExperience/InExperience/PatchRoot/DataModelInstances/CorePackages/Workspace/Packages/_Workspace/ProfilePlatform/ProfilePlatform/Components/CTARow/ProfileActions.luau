local v0 = require(script.AcceptFriendRequestActions);
local v1 = require(script.AddFriendActions);
local v2 = require(script.BlockActions);
local v3 = require(script.ChatAction);
local v4 = require(script.CommunityActions);
local v5 = require(script.CurrencyTransferAction);
local v6 = require(script.EditAliasAction);
local v7 = require(script.EditAppearanceActions);
local v8 = require(script.EditProfileAction);
local v9 = require(script.FollowActions);
local v10 = require(script.IgnoreFriendRequestAction);
local v11 = require(script.JoinExperienceAction);
local v12 = require(script.PendingFriendRequestAction);
local v13 = require(script.QrCodeAction);
local v14 = require(script.ReportAction);
local v15 = require(script.ShareProfileAction);
local v16 = require(script.TrustedConnectionActions);
local v17 = require(script.UnfriendAction);
local v18 = require(script.ViewAboutAction);
local v19 = require(script.ViewPlatformProfileAction);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v22 = {};
for _, v24 in {
    v0, 
    v1, 
    v2, 
    v3, 
    v4, 
    v5, 
    v6, 
    v7, 
    v8, 
    v9, 
    v10, 
    v11, 
    v12, 
    v13, 
    v14, 
    v15, 
    v16, 
    v17, 
    v18, 
    v19
} do
    for v25, v26 in v24 do
        assert(v22[v25] == nil, "Duplicate ProfileAction key: " .. tostring(v25));
        v22[v25] = v26;
    end;
end;
return v22;