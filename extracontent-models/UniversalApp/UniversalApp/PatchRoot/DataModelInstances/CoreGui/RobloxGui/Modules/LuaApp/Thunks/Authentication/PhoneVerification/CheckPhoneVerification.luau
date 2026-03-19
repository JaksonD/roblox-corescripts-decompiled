local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.GetPhoneNumber);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.GetVerifiedEmail);
local v5 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v6 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v7 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v8 = require(l_Modules_0.LuaApp.EventStreamConstants);
local l_FFlagAddReasonToEveryLogout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddReasonToEveryLogout;
local l_FFlagLogoutPhoneVerificationUpsellCopy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLogoutPhoneVerificationUpsellCopy;
return function(v11, v12) --[[ Line: 25 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v5 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), v6 (copy), v7 (copy), v8 (copy), l_FFlagLogoutPhoneVerificationUpsellCopy_0 (copy)
    return function(v13) --[[ Line: 26 ]]
        -- upvalues: v3 (ref), v11 (copy), v2 (ref), v4 (ref), v5 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v6 (ref), v12 (copy), v7 (ref), v8 (ref), l_FFlagLogoutPhoneVerificationUpsellCopy_0 (ref)
        return v3(v11):andThen(function(v14) --[[ Line: 27 ]]
            -- upvalues: v2 (ref), v4 (ref), v11 (ref), v13 (copy), v5 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v6 (ref), v12 (ref), v7 (ref), v8 (ref), l_FFlagLogoutPhoneVerificationUpsellCopy_0 (ref)
            local l_phone_0 = v14.responseBody.phone;
            local l_countryCode_0 = v14.responseBody.countryCode;
            local l_prefix_0 = v14.responseBody.prefix;
            if l_phone_0 and l_phone_0 ~= "" then
                return v2.resolve({
                    l_phone_0, 
                    l_countryCode_0, 
                    l_prefix_0
                });
            else
                return v4(v11):andThen(function(v18) --[[ Line: 40 ]]
                    -- upvalues: v2 (ref), v13 (ref), v5 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), v6 (ref), v11 (ref), v12 (ref), v7 (ref), v8 (ref), l_FFlagLogoutPhoneVerificationUpsellCopy_0 (ref)
                    local l_emailAddress_0 = v18.responseBody.emailAddress;
                    if l_emailAddress_0 and l_emailAddress_0 ~= "" then
                        return v2.resolve({
                            EmailAddress = l_emailAddress_0
                        });
                    else
                        v13:dispatch(v5({
                            onSuccess = function() --[[ Line: 52 ]] --[[ Name: onSuccess ]]
                                -- upvalues: l_FFlagAddReasonToEveryLogout_0 (ref), v13 (ref), v6 (ref), v11 (ref), v12 (ref), v7 (ref)
                                if l_FFlagAddReasonToEveryLogout_0 then
                                    v13:dispatch(v6(v11, v12, v7.PhoneUpsellLogOut));
                                    return;
                                else
                                    v13:dispatch(v6(v11, v12));
                                    return;
                                end;
                            end, 
                            eventContext = v8.Context.VerificationUpsell, 
                            origin = v8.Origin.Logout, 
                            addPhoneTitleKey = "Feature.VerificationUpsell.Heading.FinishAccountSetup", 
                            addPhoneDescriptionKey = l_FFlagLogoutPhoneVerificationUpsellCopy_0 and "Feature.VerificationUpsell.Description.LogoutAddPhoneTextV3" or "Feature.VerificationUpsell.Description.LogoutAddPhoneTextV2", 
                            addPhoneLegalTextKey = l_FFlagLogoutPhoneVerificationUpsellCopy_0 and "Feature.VerificationUpsell.Description.AddPhoneBody" or nil, 
                            addPhoneButtonKey = l_FFlagLogoutPhoneVerificationUpsellCopy_0 and "Feature.AccountSettings.Action.Verify" or nil, 
                            extraButtonTextKey = "Feature.VerificationUpsell.Action.Logout", 
                            shouldShowVerificationText = not l_FFlagLogoutPhoneVerificationUpsellCopy_0 and nil, 
                            alwaysShowAddPhoneLegalText = l_FFlagLogoutPhoneVerificationUpsellCopy_0 and true or nil, 
                            onExtraButtonClick = function() --[[ Line: 76 ]] --[[ Name: onExtraButtonClick ]]
                                -- upvalues: l_FFlagAddReasonToEveryLogout_0 (ref), v13 (ref), v6 (ref), v11 (ref), v12 (ref), v7 (ref)
                                if l_FFlagAddReasonToEveryLogout_0 then
                                    v13:dispatch(v6(v11, v12, v7.PhoneUpsellLogOut));
                                    return;
                                else
                                    v13:dispatch(v6(v11, v12));
                                    return;
                                end;
                            end
                        }));
                        return v2.reject();
                    end;
                end, function(_) --[[ Line: 88 ]]
                    -- upvalues: v2 (ref)
                    return v2.resolve();
                end);
            end;
        end, function(_) --[[ Line: 94 ]]
            -- upvalues: v2 (ref)
            return v2.resolve();
        end);
    end;
end;