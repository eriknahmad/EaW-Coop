require("PGStateMachine")
require("PGSpawnUnits")

function Definitions()
	Define_State("State_Init", State_Init)
	Define_State("State_Change_Faction", State_Change_Faction)
	ServiceRate = 0.5
	MainFaction = Find_Player("Empire")
	AllyFaction = Find_Player("AllyFaction")
end

function State_Init(message)
	if message == OnEnter then
		Set_Next_State("State_Change_Faction")
	end
end

function State_Change_Faction(message)
	if message == OnUpdate then  -- Run continously
		local UnitList = Find_All_Objects_Of_Type(MainFaction)  --Store every unit
		for k, unit in pairs(UnitList) do  --For each unit in list
			if TestValid(unit) and unit.Get_Owner() == MainFaction then --Test if unit is valid & owned by Republic
        if Object.Get_Owner() == MainFaction then  -- Check if Republic issued transfer unit command
				  local distance = unit.Get_Distance(Object) --Check distance between unit and marker
				  if distance < 100 then --If distance is less than 100
            unit.Change_Owner(AllyFaction) --Switch unit affiliation
          end
				end
			end
		end
		local UnitList2 = Find_All_Objects_Of_Type(AllyFaction)  --Store every unit
		for k, unit2 in pairs(UnitList2) do  --For each unit in list
			if TestValid(unit2) and unit2.Get_Owner() == AllyFaction then --Test if unit is valid & owned by Ally
        if Object.Get_Owner() == AllyFaction then -- Check if Ally issued transfer unit command
				  local distance = unit2.Get_Distance(Object) --Check distance between unit and marker
				  if distance < 100 then --If distance is less than 100
            unit2.Change_Owner(MainFaction) --Switch unit affiliation
          end
				end
			end
    end
		ScriptExit()
	end
end 
