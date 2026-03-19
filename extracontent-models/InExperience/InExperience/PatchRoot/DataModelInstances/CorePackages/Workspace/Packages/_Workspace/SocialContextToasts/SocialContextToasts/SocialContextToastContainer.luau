local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v6 = require(l_script_FirstAncestor_0.SocialContextToastDispatcher);
local v7 = require(l_script_FirstAncestor_0.ToastRoot);
local v8 = require(l_script_FirstAncestor_0.Enums.ToastTypes);
local v9 = require(l_script_FirstAncestor_0.ConfirmationModalRoot);
local v10 = require(l_Parent_0.DisplayOrder);
local v11 = require(l_Parent_0.ReactRoblox);
local v12 = require(l_Parent_0.React);
local v13 = require(l_Parent_0.Rodux);
local v14 = require(l_Parent_0.RoactRodux);
local v15 = require(l_Parent_0.Cryo);
local l_DisplayOrderEnum_0 = v10.DisplayOrderEnum;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
local function _(v19) --[[ Line: 29 ]] --[[ Name: renderWithStyleProvider ]]
    -- upvalues: v12 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    return v12.createElement(l_StyleProviderWithDefaultTheme_0, {}, v19);
end;
return function(v21, v22, v23) --[[ Line: 33 ]] --[[ Name: SocialContextToastContainer ]]
    -- upvalues: l_CoreGui_0 (copy), v8 (copy), v13 (copy), v15 (copy), v12 (copy), v14 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_DisplayOrderEnum_0 (copy), v6 (copy), v7 (copy), l_GetFFlagSocialContextToastEventStream_0 (copy), v9 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v11 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "SocialContextToast";
    l_Folder_0.Parent = l_CoreGui_0;
    local v25 = {
        ToastContent = {
            toastType = v8.None
        }
    };
    local v30 = v13.createReducer({}, {
        SetToastContent = function(v26, v27) --[[ Line: 50 ]] --[[ Name: SetToastContent ]]
            -- upvalues: v15 (ref)
            return (v15.Dictionary.join(v26, {
                ToastContent = v27.toastContent
            }));
        end, 
        SetConfirmationModal = function(v28, v29) --[[ Line: 56 ]] --[[ Name: SetConfirmationModal ]]
            -- upvalues: v15 (ref)
            return (v15.Dictionary.join(v28, {
                ConfirmationModal = {
                    isOpen = v29.isConfirmationModalOpen, 
                    closeCallback = v29.closeCallback
                }
            }));
        end
    });
    local v31 = v13.Store.new(v30, v25, {
        v13.thunkMiddleware
    });
    local l_createElement_0 = v12.createElement;
    local l_StoreProvider_0 = v14.StoreProvider;
    local v34 = {
        store = v31
    };
    local v35 = {};
    local v36 = {
        LocalizationProvider = v12.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            SocialContextToastGUI = v12.createElement("ScreenGui", {
                DisplayOrder = l_DisplayOrderEnum_0.SocialContextToastContainer, 
                ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
            }, {
                ToastDispatcher = v12.createElement(v6, {
                    services = v21, 
                    gameId = v22, 
                    placeId = v23
                }), 
                ToastRoot = v12.createElement(v7, {
                    analyticsProps = if l_GetFFlagSocialContextToastEventStream_0() then {
                        eventIngest = v21.eventIngest, 
                        gameId = v22, 
                        placeId = v23
                    } else nil
                }), 
                ConfirmationModalRoot = v12.createElement(v9)
            })
        })
    };
    v35.StyleProvider = v12.createElement(l_StyleProviderWithDefaultTheme_0, {}, v36);
    l_createElement_0 = l_createElement_0(l_StoreProvider_0, v34, v35);
    v11.createRoot(l_Folder_0):render(l_createElement_0);
    return l_createElement_0;
end;