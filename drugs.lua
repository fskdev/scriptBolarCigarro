
local cfg = {}

local function play_smoke(player)
  local seq2 = {
    {"mp_player_int_uppersmoke","mp_player_int_smoke_enter",1},
    {"mp_player_int_uppersmoke","mp_player_int_smoke",1},
    {"mp_player_int_uppersmoke","mp_player_int_smoke_exit",1}
  }

  vRPclient.playAnim(player,{true,seq2,false})
end

cfg.drugs= {
  ["baseado"] = {
    name = "Baseado",
    desc = "Baseado de maconha.",
    choices = function(args)
	  local menu = {}
      menu["Fumar"] = {function(player,choice)
  	    local user_id = vRP.getUserId({player})
  	    if user_id ~= nil then
  	      if vRP.tryGetInventoryItem({user_id,"baseado",1,false}) then
  		    	vRPclient.varyHealth(player,{25})
  		    	TriggerClientEvent("pNotify:SendNotification",player,{text = "<b style='color:green'>Fumando Maconha</b> ", type = "error", timeout = (3000),layout = "centerLeft"})
  		    	play_smoke(player)
  		    	SetTimeout(10000,function()
  		      	Dclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false})
  		      	Dclient.playScreenEffect(player, {"DMT_flight", 120})
  		    	end)
  		    	SetTimeout(120000,function()
  			  	Dclient.resetMovement(player,{false})
  		    	end)
  		    	vRP.closeMenu({player})
  		  	end
  	    end
  	  end}
	  return menu
    end,
	weight = 1.0
	},
	["cigarrotabaco"] = {
    name = "Cigarro de tabaco",
    desc = "Cigarro de tabaco",
    choices = function(args)
	  local menu = {}
      menu["Fumar"] = {function(player,choice)
  	    local user_id = vRP.getUserId({player})
  	    if user_id ~= nil then
  	      if vRP.tryGetInventoryItem({user_id,"cigarrotabaco",1,false}) then
  		    	vRPclient.varyHealth(player,{25})
  		    	TriggerClientEvent("pNotify:SendNotification",player,{text = "<b style='color:green'>Fumando tabaco</b> ", type = "error", timeout = (3000),layout = "centerLeft"})
  		    	play_smoke(player)
  		    	SetTimeout(10000,function()
  		      --Diminuindo vida do player
  		    	end)
  		    	vRP.closeMenu({player})
  		  	end
  	    end
  	  end}
	  return menu
    end,
	weight = 1.0
	},
  ["seda"] = {
    name = "Seda",
    desc = "Seda branca.",
    choices = function(args)
	  local menu = {}
      menu["Bolar"] = {function(player,choice)
  	    local user_id = vRP.getUserId({player})
  	    if user_id ~= nil then
					if vRP.tryGetInventoryItem({user_id,"seda",1,false}) then
						if vRP.tryGetInventoryItem({user_id, "maconha", 1, false}) then
  		    		vRPclient.varyHealth(player,{25})
  		    		TriggerClientEvent("pNotify:SendNotification",player,{text = "<b style='color:green'>Bolando um</b> ", type = "error", timeout = (3000),layout = "centerLeft"})
							--Colocar uma animação
							--Colocar uma animação
							--Colocar uma animação
							SetTimeout(10000,function()
							vRPclient.notify(player,{"~g~Baseado bolado"})
							vRP.giveInventoryItem({user_id,"baseado",1,true})
  		    		end)
							vRP.closeMenu({player})
						else
							if vRP.tryGetInventoryItem({user_id, "tabaco", 1, false}) then
								vRPclient.varyHealth(player,{25})
								TriggerClientEvent("pNotify:SendNotification",player,{text = "<b style='color:green'>Bolando um</b> ", type = "error", timeout = (3000),layout = "centerLeft"})
								--Colocar uma animação
								--Colocar uma animação
								--Colocar uma animação
								SetTimeout(10000,function()
								vRPclient.notify(player,{"~g~Cigarro bolado"})
								vRP.giveInventoryItem({user_id,"cigarrotabaco",1,true})
								end)
								vRP.closeMenu({player})
							else
								vRP.giveInventoryItem({user_id,"seda",1,true}) --devolvendo a seda
								vRPclient.notify(player,{"~g~Você não tem fumo para bolar"})
							end
  		  	end
				end
			end
  	  end}
	  return menu
    end,
	weight = 1.0
}
}

return cfg
