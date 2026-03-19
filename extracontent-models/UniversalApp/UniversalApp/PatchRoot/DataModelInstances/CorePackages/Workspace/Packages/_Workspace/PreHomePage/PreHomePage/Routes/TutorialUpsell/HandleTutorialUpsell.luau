local l_Parent_0 = script:FindFirstAncestor("PreHomePage").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v5 = require(l_Parent_0.Promise);
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local l_FFlagTutorialUpsellEnabled_0 = require(l_Parent_0.SharedFlags).FFlagTutorialUpsellEnabled;
local v8 = game:DefineFastFlag("TutorialUpsellOverrideIXPEnabled", false);
local v9 = game:DefineFastString("TutorialUpsellIXPLayerName", "ConsumerPlatforms.TutorialUpsell.BTID");
local function _(v10) --[[ Line: 19 ]] --[[ Name: userJustSignedUp ]]
    -- upvalues: l_LaunchContext_0 (copy)
    v10:flush();
    return v10:getState().LaunchContext == l_LaunchContext_0.SignUp;
end;
local function v14() --[[ Line: 25 ]] --[[ Name: getTutorialUpsellIxpEligible ]]
    -- upvalues: v8 (copy), l_IXPServiceWrapper_0 (copy), v9 (copy), l_Logger_0 (copy)
    if v8 then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v9 (ref)
            return l_IXPServiceWrapper_0:GetBTIDLayerData(v9);
        end);
        if not l_status_0 then
            l_Logger_0:error("Error fetching tutorial upsell IXP layer data");
            return false;
        elseif not l_result_0 then
            l_Logger_0:error("Tutorial upsell IXP layer data is nil");
            return false;
        else
            l_IXPServiceWrapper_0:LogBrowserTrackerLayerExposure(v9);
            return l_result_0.ShowTutorialUpsell or false;
        end;
    end;
end;
return function(_, v16, v17) --[[ Line: 55 ]] --[[ Name: handleTutorialUpsell ]]
    -- upvalues: l_FFlagTutorialUpsellEnabled_0 (copy), l_Logger_0 (copy), v5 (copy), l_LaunchContext_0 (copy), l_LinkingProtocol_0 (copy), v14 (copy), l_AppPage_0 (copy)
    if not l_FFlagTutorialUpsellEnabled_0 then
        l_Logger_0:info("Tutorial upsell flag is not enabled");
        return v5.resolve(false);
    else
        v16:flush();
        if not (v16:getState().LaunchContext == l_LaunchContext_0.SignUp) then
            l_Logger_0:info("User is not eligible for tutorial upsell");
            return v5.resolve(false);
        else
            local v18 = false;
            if l_LinkingProtocol_0:getLastLuaURL() ~= nil then
                v18 = l_LinkingProtocol_0:getLastLuaURL() ~= "";
            end;
            if v18 then
                l_Logger_0:info("Skipping tutorial upsell due to deep link");
                return v5.resolve(false);
            elseif not v14() then
                l_Logger_0:info("User is not eligible for tutorial upsell via IXP");
                return v5.resolve(false);
            else
                v16:dispatch(v17({
                    {
                        name = l_AppPage_0.TutorialUpsellScreen, 
                        extraProps = {
                            resetNavigationHistory = v17
                        }
                    }
                }));
                return v5.resolve(true);
            end;
        end;
    end;
end;