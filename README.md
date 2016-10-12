# WearableSoftware

In this step I have designed a better hover function for the apps, the content fades in when selected rather than just appearing on the screen. I have developed some functionality in the player app; When the player is selected and hover is true the user can set volume to High / Low with LEFT + RIGHT keys and toggle spotifys pause / play state with DOWN.


Whats Next?

- populate Finder and Browser apps with basic content.

- Bring in Bluetooth-Incoming connection from port [6] and make sure it is recieving the correct values from the arduino UNO.

- Connect to the garment and try establish BLE connection and map out capacitive data signals. The key presses within this sketch will need to be replaced by incoming bluetooth signals. 
** Example: 
- If capacitive sensor 1 reads HIGH send a 1 to processing, 
- If capacitive sensor 2 reads HIGH send a 2 to processing,
- If capacitive sensor 3 reads HIGH send a 3 to processing ... and so on ...


