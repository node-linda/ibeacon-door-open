Linda iBeacon Door-Open
=======================
watch "region" tuple from [ibeacon-android](https://github.com/node-linda/ibeacon-android), write "door-open" tuple.

- https://github.com/node-linda/ibeacon-door-open
- watch {"type": "region", "action": "enter"}
  - write {"type": "door", "cmd": "open", who: USERNAME}



## Install Dependencies

    % npm install


## Run

    % npm start
