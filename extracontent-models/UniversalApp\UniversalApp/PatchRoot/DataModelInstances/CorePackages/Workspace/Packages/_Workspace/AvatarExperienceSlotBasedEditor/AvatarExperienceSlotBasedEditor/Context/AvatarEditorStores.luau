local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(script.Parent.Parent.Stores.createAvatarEditorStores);
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
return (require(l_Parent_0.React).createContext(if l_FFlagAXAvatarEditorStoresContext_0 then v1() else nil));