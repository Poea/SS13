/datum/program/cargobay
	name = "Cargo Bay Monitor"
	app_id = "cargocontrol"

	use_app()
		dat = "<h4>Cargo Bay Monitor</h4>"
		dat += {"Supply Points: [supply_shuttle.points]<BR>"}
		dat += "<BR><B>Supply shuttle</B><BR>"
		dat += "Location: [supply_shuttle.moving ? "Moving to station ([supply_shuttle.eta] Mins.)":supply_shuttle.at_station ? "Station":"Dock"]<BR>"
		dat += "Current approved orders: <BR><ol>"
		for(var/S in supply_shuttle.shoppinglist)
			var/datum/supply_order/SO = S
			dat += "<li>#[SO.ordernum] - [SO.object.name] approved by [SO.orderedby] [SO.comment ? "([SO.comment])":""]</li>"
		dat += "</ol>"

		dat += "Current requests: <BR><ol>"
		for(var/S in supply_shuttle.requestlist)
			var/datum/supply_order/SO = S
			dat += "<li>#[SO.ordernum] - [SO.object.name] requested by [SO.orderedby]</li>"

		if(supply_shuttle.tasks.len)
			dat += "<hr>[TAB]"
			for(var/datum/round_event/task/T in supply_shuttle.tasks)
				dat += "<div class='statusDisplay'>"
				dat += "<b><u>[T.task_name]</b></u><br>"
				dat += "[T.task_desc]"
				if(T.requires_delivery)
					dat += "<br><br>NOTE: To ensure proper delivery, please ensure all exports are packaged properly in a crate"
				dat += "</div>"