local triggers={"1","inv"}
local f=CreateFrame("Frame")
local index = GetChannelName("General")
local state=false
f:SetScript("OnEvent",function(_,e,m,s,_,_,_,_,_,id)
    if GetNumGroupMembers() < 5 then
        if (e=="CHAT_MSG_WHISPER") or index then
            for _,t in ipairs(triggers) do
                if m:lower():find(t) then
                    InviteUnit(s)
                    break
                end
            end
        end
    else
        state=false
        print("|cff00ff00 Full party, no longer auto-inviting.|r")
        f:UnregisterEvent("CHAT_MSG_WHISPER")
        f:UnregisterEvent("CHAT_MSG_CHANNEL")
    end
end)
SlashCmdList.GENERALINV = function()
    state=not state
    if state then
        print("|cffff00ff Now auto-inviting.|r")
        f:RegisterEvent("CHAT_MSG_WHISPER")
        f:RegisterEvent("CHAT_MSG_CHANNEL")
    else
        print("|cffff00ff No longer auto-inviting.|r")
        f:UnregisterEvent("CHAT_MSG_WHISPER")
        f:UnregisterEvent("CHAT_MSG_CHANNEL")
    end
end
SLASH_GENERALINV1 = "/generalinv"
