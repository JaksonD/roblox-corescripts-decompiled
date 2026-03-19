local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v7 = require(l_Modules_0.LuaApp.mutedError);
local v8 = game:DefineFastFlag("UseOpaqueNameForSessionChange", false);
local v9 = game:DefineFastFlag("MuteSessionServiceErrorUWP", false);
local v10 = game:DefineFastFlag("AXCustomizeSessions3", false);
local v11 = {
    MARKETPLACE_HOMEPAGE_SESSION = "AvatarExperienceMarketplaceHomepageSession", 
    SEARCH_SESSION = "AvatarExperienceSearchSession", 
    CUSTOMIZE_SESSION = v10 and "AvatarExperienceCustomizeSession" or nil
};
local v12 = {
    CATALOG_REQUEST_ID = "avatarCatalogRequestId", 
    SEARCH_REQUEST_ID = "avatarSearchRequestId", 
    CUSTOMIZE_REQUEST_ID = v10 and "avatarCustomizeRequestId" or nil
};
local function _(v13, v14) --[[ Line: 32 ]] --[[ Name: clearSession ]]
    if v13:SessionExists(v14) then
        v13:RemoveSession(v14);
    end;
end;
local function _(v16, v17, v18) --[[ Line: 38 ]] --[[ Name: setSession ]]
    -- upvalues: l_SessionType_0 (copy), l_HttpService_0 (copy)
    if not v16:SessionExists(v17) then
        v16:SetSession(l_SessionType_0.StructuralIdentifier.Level2a, v17, v17);
        v16:SetMetadata(v17, v18, l_HttpService_0:GenerateGUID(true));
    end;
end;
local function v29(v20, v21) --[[ Line: 45 ]] --[[ Name: processSessionChange ]]
    -- upvalues: v8 (copy), l_AvatarScreen_0 (copy), v11 (copy), v10 (copy), v12 (copy), l_SessionType_0 (copy), l_HttpService_0 (copy)
    local v22 = nil;
    v22 = if v8 then v21.opaque.name else v21.current.name;
    if v22 == l_AvatarScreen_0.CatalogSearch then
        local l_MARKETPLACE_HOMEPAGE_SESSION_0 = v11.MARKETPLACE_HOMEPAGE_SESSION;
        if v20:SessionExists(l_MARKETPLACE_HOMEPAGE_SESSION_0) then
            v20:RemoveSession(l_MARKETPLACE_HOMEPAGE_SESSION_0);
        end;
        if v10 then
            l_MARKETPLACE_HOMEPAGE_SESSION_0 = v11.CUSTOMIZE_SESSION;
            if v20:SessionExists(l_MARKETPLACE_HOMEPAGE_SESSION_0) then
                v20:RemoveSession(l_MARKETPLACE_HOMEPAGE_SESSION_0);
            end;
        end;
        l_MARKETPLACE_HOMEPAGE_SESSION_0 = v11.SEARCH_SESSION;
        local l_SEARCH_REQUEST_ID_0 = v12.SEARCH_REQUEST_ID;
        if not v20:SessionExists(l_MARKETPLACE_HOMEPAGE_SESSION_0) then
            v20:SetSession(l_SessionType_0.StructuralIdentifier.Level2a, l_MARKETPLACE_HOMEPAGE_SESSION_0, l_MARKETPLACE_HOMEPAGE_SESSION_0);
            v20:SetMetadata(l_MARKETPLACE_HOMEPAGE_SESSION_0, l_SEARCH_REQUEST_ID_0, l_HttpService_0:GenerateGUID(true));
            return;
        end;
    elseif v10 and (v22 == l_AvatarScreen_0.AvatarEditor or v22 == l_AvatarScreen_0.AvatarSwitcher or v22 == l_AvatarScreen_0.EditEmotes or v22 == l_AvatarScreen_0.AccessoryAdjustment or v22 == l_AvatarScreen_0.BodyShape or v22 == l_AvatarScreen_0.HeadRefinement or v22 == l_AvatarScreen_0.LayeredClothingSort or v22 == l_AvatarScreen_0.ColorAdjustment or v22 == l_AvatarScreen_0.MySharedAvatars or v22 == l_AvatarScreen_0.LookComposerPage or v22 == l_AvatarScreen_0.ProfilePictureEditorEmotes or v22 == l_AvatarScreen_0.ProfilePictureEditorCamera or v22 == l_AvatarScreen_0.ProfilePictureEditorFinal) then
        local l_MARKETPLACE_HOMEPAGE_SESSION_1 = v11.MARKETPLACE_HOMEPAGE_SESSION;
        if v20:SessionExists(l_MARKETPLACE_HOMEPAGE_SESSION_1) then
            v20:RemoveSession(l_MARKETPLACE_HOMEPAGE_SESSION_1);
        end;
        l_MARKETPLACE_HOMEPAGE_SESSION_1 = v11.SEARCH_SESSION;
        if v20:SessionExists(l_MARKETPLACE_HOMEPAGE_SESSION_1) then
            v20:RemoveSession(l_MARKETPLACE_HOMEPAGE_SESSION_1);
        end;
        l_MARKETPLACE_HOMEPAGE_SESSION_1 = v11.CUSTOMIZE_SESSION;
        local l_CUSTOMIZE_REQUEST_ID_0 = v12.CUSTOMIZE_REQUEST_ID;
        if not v20:SessionExists(l_MARKETPLACE_HOMEPAGE_SESSION_1) then
            v20:SetSession(l_SessionType_0.StructuralIdentifier.Level2a, l_MARKETPLACE_HOMEPAGE_SESSION_1, l_MARKETPLACE_HOMEPAGE_SESSION_1);
            v20:SetMetadata(l_MARKETPLACE_HOMEPAGE_SESSION_1, l_CUSTOMIZE_REQUEST_ID_0, l_HttpService_0:GenerateGUID(true));
            return;
        end;
    else
        local l_SEARCH_SESSION_0 = v11.SEARCH_SESSION;
        if v20:SessionExists(l_SEARCH_SESSION_0) then
            v20:RemoveSession(l_SEARCH_SESSION_0);
        end;
        if v10 then
            l_SEARCH_SESSION_0 = v11.CUSTOMIZE_SESSION;
            if v20:SessionExists(l_SEARCH_SESSION_0) then
                v20:RemoveSession(l_SEARCH_SESSION_0);
            end;
        end;
        l_SEARCH_SESSION_0 = v11.MARKETPLACE_HOMEPAGE_SESSION;
        local l_CATALOG_REQUEST_ID_0 = v12.CATALOG_REQUEST_ID;
        if not v20:SessionExists(l_SEARCH_SESSION_0) then
            v20:SetSession(l_SessionType_0.StructuralIdentifier.Level2a, l_SEARCH_SESSION_0, l_SEARCH_SESSION_0);
            v20:SetMetadata(l_SEARCH_SESSION_0, l_CATALOG_REQUEST_ID_0, l_HttpService_0:GenerateGUID(true));
        end;
    end;
end;
return function(v30) --[[ Line: 95 ]]
    -- upvalues: v6 (copy), l_AppSessionService_0 (copy), v29 (copy), v9 (copy), v7 (copy), l_SessionType_0 (copy)
    local v31 = v6(l_AppSessionService_0);
    v29(v31, v30);
    if v9 and v31.isA ~= nil then
        v7("useRouteSessionManager: sessionService is not being redirected to SessionServiceWrapper");
        return;
    else
        v31.SessionChangedSignal:connect(function(v32) --[[ Line: 105 ]]
            -- upvalues: l_SessionType_0 (ref), v29 (ref), v31 (copy), v30 (copy)
            if v32 == l_SessionType_0.StructuralIdentifier.Level2a then
                v29(v31, v30);
            end;
        end);
        return;
    end;
end;