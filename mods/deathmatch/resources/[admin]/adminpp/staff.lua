------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--  RIGHTS:      All rights reserved by developer
--  FILE:        adminPanel/staff.lua
--  DEVELOPER:   Prime aka Kunal
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

local staffTable =
{
--You can add admins manually here
-- {"Account Name"},
--Eg.
{"Ka_Rts"}, {"Admin_Deaglos"}, {"Test_Account"}, {"Sergei_Kovalev"}, {"Admin_Karts"}, {"Nikolay_Petrushkin"}, {"Aksov_Goodman"}, {"Karts"}, {"Pagan_Suarez"}, {"Just_Eazzy"}, {"Usher_Holt"}, {"MrJengas"}, {"Alex_Merser"}, {"Xabib_Kytyashvili"}, {"Roman_Azotov"}, {"Dmitry_Dudarenko"}, {"Roman_Kowalski"},
}

--=========================================Don't edit anything below this or you might break it=========================================--

local staffTeam = createTeam("Staff", 225, 225, 225)
local unoccupiedTeam = createTeam("Unoccupied", 225, 225, 0)

addEventHandler("onResourceStart", root,
	function()
		for i=1, #staffTable do
			local staffList = dbPoll(dbQuery(adminDB, "SELECT * FROM staffList WHERE staff=?", staffTable[i][1]), -1)
			if (#staffList == 0) then
				dbExec(adminDB, "INSERT INTO staffList(staff) VALUES(?)", staffTable[i][1])
			end
		end
	end
)

addEventHandler("onPlayerLogin", root,
	function()
		local staffName = dbPoll(dbQuery(adminDB, "SELECT * FROM staffList WHERE staff=?", getAccountName(getPlayerAccount(source))), -1)
		if (not (#staffName == 0)) then
			setElementData(source, "isPlayerStaff", true)
			outputChatBox("Logged In as admin", source, 225, 225, 225)
		end
	end
)

addCommandHandler("gostaff", 
	function(plr)
		local isStaff = getElementData(plr, "isPlayerStaff")
		if (isStaff) then
			setPlayerTeam(plr, getTeamFromName("Staff"))
			setElementModel(plr, 217)
			outputChatBox("Entered staff mode", plr, 225, 225, 225)
		else
			return
		end
	end
)
