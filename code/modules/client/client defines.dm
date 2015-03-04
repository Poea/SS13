/client
		////////////////
		//ADMIN THINGS//
		////////////////
	var/datum/admins/holder = null
	var/buildmode		= 0
	var/admintoggles = 1
	var/last_message	= "" //Contains the last message sent by this client - used to protect against copy-paste spamming.
	var/last_message_count = 0 //contins a number of how many times a message identical to last_message was sent.

		/////////
		//OTHER//
		/////////
	var/datum/preferences/prefs = null
	var/move_delay		= 1
	var/moving			= null
	var/adminobs		= null
	var/area			= null

		///////////////
		//SOUND STUFF//
		///////////////
	var/ambience_playing= null
	var/played			= 0

		////////////
		//SECURITY//
		////////////
	var/next_allowed_topic_time = 10
	// comment out the line below when debugging locally to enable the options & messages menu
	control_freak = 1


		////////////////////////////////////
		//things that require the database//
		////////////////////////////////////
	var/player_age = "--"	//So admins know why it isn't working - Used to determine how old the account is - in days.
	var/list/related_accounts_ip = list()	//So admins know why it isn't working - Used to determine what other accounts previously logged in from this ip
	var/list/related_accounts_cid = list()	//So admins know why it isn't working - Used to determine what other accounts previously logged in from this computer id

	preload_rsc = PRELOAD_RSC
