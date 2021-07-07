local is_listening = false
local triggers = {"1","inv"}
local raidFrame = CreateFrame("Frame")
local generalChannel = GetChannelName("General")

raidFrame:SetScript("OnEvent",function(_,event,message,sender,_,_,_,_,_,_)
  -- If group is at max size, convert to a raid
  if GetNumGroupMembers() == 5 then
    ConvertToRaid()
  end

  -- If group is at max size, convert to a raid
  if GetNumGroupMembers() == 40 then
    -- Invite sender
    if (event == "CHAT_MSG_WHISPER") or generalChannel then
      for _,trigger in ipairs(triggers) do
        if message:lower():find(trigger) then
          InviteUnit(sender)
          break
        end
      end
    end
  else
    -- Turn off
    is_listening = false
    print("|cff00ff00 Full raid, no longer auto-inviting.|r")
    raidFrame:UnregisterEvent("CHAT_MSG_WHISPER")
    raidFrame:UnregisterEvent("CHAT_MSG_CHANNEL")
  end
end)

SlashCmdList.GENERALINVRAID = function()
  if is_listening then
    -- Turn off
    is_listening = false
    print("|cff00ccff No longer auto-inviting.|r")
    raidFrame:UnregisterEvent("CHAT_MSG_WHISPER")
    raidFrame:UnregisterEvent("CHAT_MSG_CHANNEL")
  else
    -- Turn on
    is_listening = true
    print("|cff00ccff Now auto-inviting.|r")
    raidFrame:RegisterEvent("CHAT_MSG_WHISPER")
    raidFrame:RegisterEvent("CHAT_MSG_CHANNEL")
  end
end

SLASH_GENERALINVRAID1 = "/generalinvraid"
