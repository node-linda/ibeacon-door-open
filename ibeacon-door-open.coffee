path = require 'path'

config = require path.resolve 'config'
console.log config

LindaClient = require('linda-socket.io').Client
socket = require('socket.io-client').connect(config.url)
linda = new LindaClient().connect(socket)

ts = linda.tuplespace(config.tuplespace)

door_open = (where, who) ->
  linda.tuplespace(where).write {type: "door", cmd: "open", who: who}

linda.io.on 'connect', ->
  console.log 'socket.io connect!!'
  linda.tuplespace('masuilab').watch {type: 'region', action: 'enter'}, (err, tuple) ->
    console.log tuple
    return if tuple.data.where?.length < 1
    return if tuple.data.who?.length < 1
    door_open tuple.data.where, tuple.data.who
    

linda.io.on 'disconnect', ->
  console.log 'socket.io disoconnect..'
