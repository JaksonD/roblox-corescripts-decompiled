local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_script_FirstAncestor_0.Enums.SaveStatusEnum);
if game:DefineFastFlag("FFlagAXFixAvatarSaveContext", false) then
    return (v2.createContext({
        getHistorySignal = v3.createSignal({}), 
        getCurrentHistoryIndexSignal = v3.createSignal(0), 
        updateHistoryIndexAndGetCharacterData = function(_) --[[ Line: 41 ]] --[[ Name: updateHistoryIndexAndGetCharacterData ]]
            return nil;
        end, 
        getLastSuccessfullySavedStateSignal = v3.createSignal({}), 
        getSaveEligibilityStatusSignal = v3.createSignal(v4.AlreadySaved), 
        autoSaveNextNewSaveData = function() --[[ Line: 46 ]] --[[ Name: autoSaveNextNewSaveData ]]
            return nil;
        end, 
        trySaveAvatar = function() --[[ Line: 49 ]] --[[ Name: trySaveAvatar ]]
            return nil;
        end
    }));
else
    return (v2.createContext(nil));
end;