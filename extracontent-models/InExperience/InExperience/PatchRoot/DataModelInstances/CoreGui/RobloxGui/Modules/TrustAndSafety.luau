local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local _ = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(script.Dependencies);
local l_Localization_0 = v8.Localization;
local v10 = require(v8.LocalizationProvider);
local v11 = require(v8.playerInterface);
local v12 = require(script.Resources.Constants);
local v13 = require(script.GlobalConfig);
local v14 = require(script.Reducers);
local v15 = require(script.Components.TrustAndSafetyApp);
local v16 = require(script.TrustAndSafetyAppPolicy);
local _ = require(script.Actions.OpenReportDialog);
local _ = require(script.Actions.OpenReportMenu);
local v19 = require(script.Actions.BeginReportFlow);
local v20 = require(script.Actions.SetVoiceReportingFlow);
local v21 = require(script.Thunks.IdentifyAvatars);
local v22 = require(script.Utility.SessionUtility);
local v23 = require(script.Utility.ScreenshotHookManager);
local v24 = require(script.Thunks.FetchPlaceInfo);
local v25 = require(script.Flags.GetFFlagReportAnythingScreenshot);
local v39 = {
    getInstance = function(v26) --[[ Line: 36 ]] --[[ Name: getInstance ]]
        if not v26._initialized then
            v26:initialize();
            v26._initialized = true;
        end;
        return v26;
    end, 
    initialize = function(v27) --[[ Line: 45 ]] --[[ Name: initialize ]]
        -- upvalues: v13 (copy), v3 (copy), v24 (copy), v5 (copy), v16 (copy), v10 (copy), v15 (copy), l_CoreGui_0 (copy)
        if v13.propValidation then
            v3.setGlobalConfig({
                propValidation = true
            });
        end;
        if v13.elementTracing then
            v3.setGlobalConfig({
                elementTracing = true
            });
        end;
        v27.store = v27:createStore();
        v27.store:dispatch(v24(game.GameId));
        v27.localization = v27:createLocalization();
        v27.root = v3.createElement(v5.StoreProvider, {
            store = v27.store
        }, {
            PolicyProvider = v3.createElement(v16.Provider, {
                policy = {
                    v16.Mapper
                }
            }, {
                LocalizationProvider = v3.createElement(v10, {
                    localization = v27.localization
                }, {
                    TrustAndSafety = v3.createElement(v15)
                })
            })
        });
        v27.element = v3.mount(v27.root, l_CoreGui_0, "TrustAndSafety");
    end, 
    createStore = function(_) --[[ Line: 79 ]] --[[ Name: createStore ]]
        -- upvalues: v14 (copy), v4 (copy), v13 (copy)
        local l_v14_0 = v14;
        local v30 = {
            v4.thunkMiddleware
        };
        if v13.logStore then
            table.insert(v30, v4.loggerMiddleware);
        end;
        return v4.Store.new(l_v14_0, nil, v30);
    end, 
    createLocalization = function(_) --[[ Line: 90 ]] --[[ Name: createLocalization ]]
        -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy)
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        local v33 = l_Localization_0.new(l_RobloxLocaleId_0);
        l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 94 ]]
            -- upvalues: l_LocalizationService_0 (ref), v33 (copy)
            local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
            v33:SetLocale(l_RobloxLocaleId_1);
        end);
        return v33;
    end, 
    openReportDialog = function(v35, v36, v37) --[[ Line: 102 ]] --[[ Name: openReportDialog ]]
        -- upvalues: v20 (copy), v25 (copy), v21 (copy), v19 (copy)
        v35.store:dispatch(v20(true));
        if v25() then
            v35.store:dispatch(v21());
        end;
        v35.store:dispatch(v19(v36, v37));
    end, 
    openReportMenu = function(v38) --[[ Line: 110 ]] --[[ Name: openReportMenu ]]
        -- upvalues: v20 (copy), v25 (copy), v21 (copy), v19 (copy)
        v38.store:dispatch(v20(true));
        if v25() then
            v38.store:dispatch(v21());
        end;
        v38.store:dispatch(v19());
    end
};
return {
    openReportDialogForPlayer = function(v40, v41) --[[ Line: 119 ]] --[[ Name: openReportDialogForPlayer ]]
        -- upvalues: v11 (copy), v6 (copy), v22 (copy), v39 (copy), v12 (copy)
        assert(v11(v40) and v6.instanceIsA("Player")(v40));
        v22.startAbuseReportSession(v41);
        v39:getInstance():openReportDialog(v12.ReportType.Player, v40);
    end, 
    openReportDialogForPlace = function(v42) --[[ Line: 124 ]] --[[ Name: openReportDialogForPlace ]]
        -- upvalues: v22 (copy), v39 (copy), v12 (copy)
        v22.startAbuseReportSession(v42);
        v39:getInstance():openReportDialog(v12.ReportType.Place);
    end, 
    openReportMenu = function(v43) --[[ Line: 128 ]] --[[ Name: openReportMenu ]]
        -- upvalues: v22 (copy), v39 (copy)
        v22.startAbuseReportSession(v43);
        v39:getInstance():openReportMenu();
    end, 
    setPreReportScreenshotHook = function(v44) --[[ Line: 132 ]] --[[ Name: setPreReportScreenshotHook ]]
        -- upvalues: v23 (copy)
        v23.setPreScreenshotHook(v44);
    end, 
    setPostReportScreenshotHook = function(v45) --[[ Line: 135 ]] --[[ Name: setPostReportScreenshotHook ]]
        -- upvalues: v23 (copy)
        v23.setPostScreenshotHook(v45);
    end
};