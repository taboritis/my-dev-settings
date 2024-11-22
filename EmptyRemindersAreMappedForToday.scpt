 #!/usr/bin/env osascript

tell application "Reminders"
  set todayDate to current date
  set remindersList to reminders
      
  repeat with aReminder in remindersList
    if priority of aReminder = 0 then
      set priority of aReminder to 5
    end if

    if due date of aReminder is missing value then
      set allday due date of aReminder to todayDate
    end if
  end repeat
end tell

