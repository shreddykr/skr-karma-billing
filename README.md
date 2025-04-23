💸 skr-karma-billing | QBCore Billing Command w/ ox_lib Integration 💼
A sleek, billing system designed for karma-billing users — brought to life with 🔥 modern UI via ox_lib, database integration via oxmysql, and the convenience of a single /newfine command for fast ticketing or financial enforcement. No more clunky exports or limited UI dialogs -- 0.00ms ⚡

✨ Features

🔹 /newfine command opens a user-friendly input dialog

🔹 Input fields for: Fine Type, Asset Info, Amount Due, and Recipient (by Player ID)

🔹 Script automatically grabs the citizen ID using the entered player ID

🔹 Only accessible to whitelisted jobs: police, ambulance, mechanic, bennys, towtruck -- Add or delete any in the client.lua

🔹 Cancel button to back out with ease 🛑

🔹 Uses oxmysql to write into a karma-billing database table

🔹 Automatically sets bill status to unpaid


[  Preview](https://streamable.com/2mni0p)

----------------------------------------------------------------

🔧 Install
  1. Place skr-karma-billing in resource folder
  2. open server.cfg and ensure skr-karma-billing ( just needs to be after qbcore )

----------------------------------------------------------------

🔧 Dependencies


[karma-billing](https://karmadevelopments.shop/product/billing-invoices-system)

ox_lib


oxmysql


QBCore

