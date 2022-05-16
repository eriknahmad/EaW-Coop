require("PGStateMachine")
require("PGSpawnUnits")

function Definitions()
	Define_State("State_Init", State_Init)
	Define_State("State_Change_Faction", State_Change_Faction)
	ServiceRate = 0.5
end

function State_Init(message)
	if message == OnEnter then
		Owner = Object.Get_Owner()  --Transfer Unit Command
		FindTeam = Find_All_Objects_Of_Type("Placeholder_Container_Coop")  --Find all placeholder units defined in Factions.xml
		for k, unit in pairs(FindTeam) do  --For each unit in list
			if unit.Get_Owner() ~= Owner then  --If unit owner and marker owner are not the same then
				Ally = unit.Get_Owner()  --Store Ally as unit owner
			end
		end
		Set_Next_State("State_Change_Faction")  --Set Next State
	end
end


function State_Change_Faction(message)
	if message == OnUpdate then
		UnitList = Find_All_Objects_Of_Type("Structure | Infantry | Vehicle | Air | LandHero")  --Store every unit
		for k, unit in pairs(UnitList) do  --For each unit in list
			if TestValid(unit) and unit.Get_Owner() == Owner then  --If unit is valid and owned by marker owner
				local distance = unit.Get_Distance(Object) --Check distance between unit and marker
				if distance < 100 then --If distance is less than 100
					unit.Change_Owner(Ally) --Switch unit affiliation
				end
			end
		end
		ScriptExit()  --Exit Script
	end
end
