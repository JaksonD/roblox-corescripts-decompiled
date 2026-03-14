local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_InExperienceSquadContract_0 = require(l_script_FirstAncestor_0.Contracts).SquadContract.InExperienceSquadContract;
local v4 = require(l_script_FirstAncestor_0.Contexts);
local l_UnreadMessagesProvider_0 = v4.UnreadMessagesProvider;
local l_ParentContainerProvider_0 = v4.ParentContainer.ParentContainerProvider;
local l_ApolloProvider_0 = require(l_Parent_0.ApolloClient).ApolloProvider;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.RoactUtils);
local v12 = require(l_Parent_0.RoactRodux);
local v13 = require(l_Parent_0.SquadsCore);
local v14 = require(l_Parent_0.SharedFlags);
local l_SquadExternalContractProvider_0 = v13.SquadExternalContractProvider.SquadExternalContractProvider;
local l_SquadLocationEnum_0 = v13.Enums.SquadLocationEnum;
local l_ProviderContainer_0 = v11.Components.ProviderContainer;
local l_FFlagIsSquadEnabledAMP_0 = v14.FFlagIsSquadEnabledAMP;
local l_UniversalAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_Parent_0.SocialPolicies).ChatPolicies;
local l_GetFFlagIsSquadEnabled_0 = v14.GetFFlagIsSquadEnabled;
return function(v23) --[[ Line: 48 ]]
    -- upvalues: v10 (copy), l_ParentContainerProvider_0 (copy), l_UnreadMessagesProvider_0 (copy), v12 (copy), l_ApolloProvider_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_UniversalAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_SquadExternalContractProvider_0 (copy), l_InExperienceSquadContract_0 (copy), l_SquadLocationEnum_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_ProviderContainer_0 (copy)
    local v25 = v10.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: l_ParentContainerProvider_0 (ref), v23 (copy), l_UnreadMessagesProvider_0 (ref), v12 (ref), l_ApolloProvider_0 (ref), l_FFlagIsSquadEnabledAMP_0 (ref), l_UniversalAppPolicy_0 (ref), l_AppFeaturePolicies_0 (ref), l_ChatPolicies_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), l_SquadExternalContractProvider_0 (ref), l_InExperienceSquadContract_0 (ref), l_SquadLocationEnum_0 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_LocalizationService_0 (ref)
        local v24 = {};
        table.insert(v24, {
            class = l_ParentContainerProvider_0, 
            props = v23.parentContainerContext
        });
        table.insert(v24, {
            class = l_UnreadMessagesProvider_0, 
            props = {
                dispatch = v23.updateAppChatUnreadMessagesCount
            }
        });
        table.insert(v24, {
            class = v12.StoreProvider, 
            props = {
                store = v23.store
            }
        });
        table.insert(v24, {
            class = l_ApolloProvider_0, 
            props = {
                client = v23.apolloClient
            }
        });
        if l_FFlagIsSquadEnabledAMP_0 then
            table.insert(v24, {
                class = l_UniversalAppPolicy_0.Provider, 
                props = {
                    policy = {
                        l_AppFeaturePolicies_0, 
                        l_ChatPolicies_0
                    }
                }
            });
        end;
        if l_GetFFlagIsSquadEnabled_0() then
            table.insert(v24, {
                class = l_SquadExternalContractProvider_0, 
                props = {
                    contract = l_InExperienceSquadContract_0, 
                    squadLocation = l_SquadLocationEnum_0.InExperience
                }
            });
        end;
        table.insert(v24, {
            class = l_LocalizationProvider_0, 
            props = {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }
        });
        return v24;
    end, {});
    return v10.createElement(l_ProviderContainer_0, {
        providers = v25
    }, v23.children);
end;