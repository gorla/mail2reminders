mail2reminders
==============
## Description

`mail2reminders` is an AppleScript that easily allows you to create a
new task in the `Apple Reminders` application from the `Apple Mail`
application. When adding a new task, `Reminders` will add a link to
the selected email, so you can easily come back to it when you want to
perform the task.

## System Requirements

This script runs on Apple OS X. It has been developed and tested on OS
X Maverics (Version 10.9), but it should work on earlier versions of
the OS as well.

## Installation

The `Mail2Reminders.scpt` Applescript has to be deployed as a service
of the `Apple Mail` application. This is how you can do it:

###Step 1: Create a Service

To import the `Mail2Reminders.applescript` AppleScript as a Service:

* Open the `Automator` application (located in the `Applications`
  folder).

* Select `File` > `New` and choose `Service`.

* Search for `Run AppleScript` and double click on it.

* Copy the content of the AppleScript `Mail2Reminders.applescript` in
  the new service (where it says (* Your script goes here *) ).

* Change `text` to `no input`, and `any application` to `Mail` in the
  top part of the new service window.

* Save the new service, and give it a name such as `Set as
  Reminder`. This name will be the label that appears in your `Apple
  Mail` application's menu.

* Open the `Apple Mail` application. In `Mail` > `Services` you should
  see the newly created service.

###Step 2: Create a Key Binding

You may want to create a key binding for the new service, such that
you can easily add a reminder without using the menu in `Apple
Mail`. To bind the execution of the new service to a specific key, do
the following:

* From System Preferences, select `Keyboard` > `Shortcuts` 

* Search for the newly created service. It is likely at the end of the
  list. Click on `add shortcut`, and type the desired key binding (for
  example `option R`)

## User Manual

If you correctly installed the script as a service, you should see it
in the `Apple Mail` application menu (`Mail` > `Services`). 

Select the email that you want to be reminded about, and select the
service from the menu (or use your specified key binding). 

`mail2reminders` will ask you to select the `Reminders` list you want
to add the new task to. It will then ask you in how many hours you
want to be reminded about this task. Leaving `0`, which is the default
value, will simply add the new task, but will not set any
reminder. Any number greater than `0`, instead, will set an automatic
reminder. For example, by entering `5`, you will be reminded about the
task in 5 hours.