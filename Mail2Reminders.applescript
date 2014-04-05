tell application "Mail"
	# get URL and subject of selected mail
	set selected_mails to selection
	set selected_mail to item 1 of selected_mails
	set mail_URL to "message://%3c" & selected_mail's message id & "%3e"
	set mail_subject to selected_mail's subject
	
	# ask user to choose the Reminders's list 
	set list_names to name of every list of application "Reminders"
	(choose from list list_names)
	set selected_lists to rich text of result
	
	# ask user in how many hours the notification should appear
	set display_string to "Reminder in how many hours? (0 for no reminder)"
	set default_answer to 0
	repeat
		set response to display dialog display_string default answer default_answer
		try
			set n_hours to (text returned of response) as number
			exit repeat
		on error errstr
			set display_string to errstr & return & "You have to provide a number."
			set default_answer to text returned of response
		end try
	end repeat
	set in_hours to (current date) + (n_hours * hours)
	
	# add reminder to list (with or without due date)
	tell application "Reminders"
		set selected_list to (item 1 of selected_lists)
		tell list selected_list
			if n_hours is equal to 0 then
				make new reminder at the end of reminders with properties {name:mail_subject, body:mail_URL}
			else
				make new reminder at the end of reminders with properties {name:mail_subject, body:mail_URL, due date:in_hours}
			end if
		end tell
	end tell
	display dialog "New task in " & selected_list & ". " buttons {"OK"}
end tell
